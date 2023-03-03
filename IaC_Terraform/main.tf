

resource "aws_s3_bucket" "site" {
    bucket = var.site_domain
}

resource "aws_s3_bucket_website_configuration" "site" {
    bucket = aws_s3_bucket.site.id

    index_document {
      suffix = "index.html"
    }
}

resource "aws_s3_bucket_acl" "site" {
    bucket = aws_s3_bucket.site.id

    acl = "public-read"
}

resource "aws_s3_bucket_policy" "site" {
  bucket = aws_s3_bucket.site.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource = [
          aws_s3_bucket.site.arn,
          "${aws_s3_bucket.site.arn}/*",
        ]
      },
    ]
  })
}

# Since we are using an existing hosted zone already we will use the data block
data "aws_route53_zone" "hosted_zone"{
  name = var.mainsite_domain
}

resource "aws_route53_record" "root_domain" {
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name = var.site_domain
  type = "A"

  alias {
    name = "${aws_cloudfront_distribution.cdn.domain_name}"
    zone_id = "${aws_cloudfront_distribution.cdn.hosted_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_cloudfront_distribution" "cdn" {
  origin {
    origin_id   = "${var.site_domain}"
    domain_name = "${aws_s3_bucket.site.bucket_domain_name}"
  }

  # If using route53 aliases for DNS we need to declare it here too, otherwise we'll get 403s.
  aliases = ["${var.site_domain}"]

  enabled             = true
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "${var.site_domain}"

    forwarded_values {
      query_string = true
      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  # The cheapest priceclass
  price_class = "PriceClass_100"

  # This is required to be specified even if it's not used.
  restrictions {
    geo_restriction {
      restriction_type = "none"
      locations        = []
    }
  }

  viewer_certificate {
    acm_certificate_arn = "${var.certificate_arn}"
    ssl_support_method = "sni-only"
  }
}

output "s3_website_endpoint" {
  value = "${aws_s3_bucket.site.website_endpoint}"
}

output "route53_domain" {
  value = "${aws_route53_record.root_domain.fqdn}"
}

output "cdn_domain" {
  value = "${aws_cloudfront_distribution.cdn.domain_name}"
}
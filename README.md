# aws-resume

# AWS Cloud Resume Challenge

[The Cloud Resume Challenge](https://cloudresumechallenge.dev/docs/the-challenge/aws/) is a project created by Forrest Brazeal, Head of content at Google Cloud. 
- The final deliverable is a serverless website hosting my resume
- Technologies powering this:
     - AWS - S3 buckets | DynamoDB | CloudFront | Route53 | Certificate Manager | API Gateway | Lambda | Terraform (Infrastructure as Code)
     - GitHub Actions is used for CI/CD

---

### Demo
[View the live site here!](https://resume.madebyfrankely.com/)

---

### Blog Posts
[Building the CI/CD Pipeline](https://blog.madebyfrankely.com/aws-cloud-resume-challenge/)

---

### Project Details

#### To Do
- [x] Setup GitHub Actions
- [x] Build a website in HTML/CSS
- [x] Host website with S3 Bucket
- [x] Use Route53 for custom DNS
- [x] Use Certificate Manager for enabling secure access with SSL Certificate
- [x] Use CloudFront for routing HTTP/S traffic
- [x] Use DynamoDB for database, storing website visitor count
- [x] Use API Gateway to trigger Lambda function
- [x] Use Lambda function (python) to read/write website visitor count to DynamoDB
- [x] Use javascript on website to call API and display visitor counter

// The DOMContentLoaded event fires our visitcount function when the HTML document has been completely parsed
window.addEventListener('DOMContentLoaded', (event) => {getVisitCount()});

const apicall = 'https://1pohivmhq8.execute-api.us-east-1.amazonaws.com/default/LiveCounterFunction'


const getVisitCount = () => {
    let count;
    fetch(apicall)
    .then(response => {
        return response.json()
    })
    .then(response => {
        console.log("API Function Called.")
        console.log(response)
        count = response;
        //console.log(document.getElementById('counter').innerText);
      //  document.getElementById('counter').innerText = count;
    }).catch(function(error) {
        console.log(error);
      });
    return count;
}
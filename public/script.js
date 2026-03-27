//get data and parse it as a string
fetch('/api/data')
.then(res => res.json())
  .then(data => {
    document.getElementById('text').innerText = JSON.stringify(data);
  });
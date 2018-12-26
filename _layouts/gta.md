---
# layout: compress
---

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="/css/picnic.mini.css">

<style>

body {
   text-align: center;
   font-size: 2em;
   padding: 2em;
}

button, input {
   width: 200px;
   text-align: center;
}

svg {
  max-height: 1.5em;
  fill: none;
  stroke: #eee;
  stroke-linecap: round;
  stroke-width: 8%;
  display: none;
}

use {
  stroke: #0074d9;
  animation: a 2s linear infinite
}
.y {
  display: none;
}

@keyframes a { to { stroke-dashoffset: 0px } }

</style>
</head>
  <body>
    <form onsubmit="makeCorsRequest()">
    <input type="text" id="x"><br/>
    <button onclick="makeCorsRequest()">⇩</button><br/>
    <svg id="spinner" viewBox="-2000 -1000 4000 2000">
      <path id="inf" d="M354-354A500 500 0 1 1 354 354L-354-354A500 500 0 1 0-354 354z"></path>
      <use xlink:href="#inf" stroke-dasharray="1570 5143" stroke-dashoffset="6713px"></use>
    </svg>
    <span id="y"></span>
    </form>

    <script>

    var data = {};

    function createCORSRequest(method, url) {
      var xhr = new XMLHttpRequest();
      if ("withCredentials" in xhr) {
        xhr.open(method, url, true);
      } else if (typeof XDomainRequest != "undefined") {
        xhr = new XDomainRequest();
        xhr.open(method, url);
      } else {
        xhr = null;
      }
      return xhr;
    }

    function addCommas(number) {
      return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }

    function showLoader() {
      document.getElementById("spinner").style.display = "block";
    }

    function makeCorsRequest() {
      event.preventDefault();
      document.getElementById("y").innerHTML = "";
      var loaderTimer = setTimeout(showLoader, 200);
      var x = document.getElementById('x').value;
      {% if site.GH_ENV == 'gh_pages' %}
        var url = 'https://guess-the-algorithm.herokuapp.com';
      {% else %}
        var url = 'http://localhost:5000';
      {% endif %}
      url += '/{{ page.alg-number }}/?x='+x+'&session='+data.session+'&iv='+data.iv;
      var xhr = createCORSRequest('GET', url);
      if (!xhr) {
        alert('CORS not supported');
        return;
      }

      xhr.onload = function() {
        clearTimeout(loaderTimer);
        document.getElementById("spinner").style.display = "none";
        var response = xhr.responseText;
        data = JSON.parse(response);
        document.getElementById("y").innerHTML = addCommas(data.y);
        console.log(data);
      };

      xhr.onerror = function() {
        console.log('fail');
      };

      xhr.send();

      document.getElementById("x").focus().select();
      // document.getElementById("x").select();
    }

    document.getElementById("x").focus();
    </script>
  </body>

</html>

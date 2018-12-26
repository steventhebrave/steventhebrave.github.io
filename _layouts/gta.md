---
layout: compress
---

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>

body {
   text-align: center;
   font-size: 2em;
   padding: 2em;
   line-height: 1.5;
   font-family: Arial, Helvetica, sans-serif;
   box-sizing: border-box;
   margin: auto;
    max-width: 600px;
}

* {
  box-sizing: inherit;
}

button, input {
   width: 200px;
   text-align: center;
   border-radius: .2em;
   font: inherit;
}

input {
  height: 2.1em;
  border: 1px solid #ccc;
}

input:focus {
  border: 1px solid #0074d9;
  outline: 0;
}

button {
   margin: .3em 0;
   padding: .3em .9em;
   background: #0074d9;
   color: #fff;
   border: 0;
   cursor: pointer;
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

/*.y {
  display: none;
}*/

.tell-me {
  color: gray;
  font-size: .3em;
  margin-top: 10em;
}

.solution {
  display: none;
}

.clicker:focus + .solution {
  display:block;
}

</style>
</head>
<<<<<<< HEAD
<body>

<form onsubmit="makeCorsRequest()">
<input type="text" id="x" autocomplete="off"><br/>
<button onclick="makeCorsRequest()">⇩</button><br/>
<svg id="spinner" viewBox="-2000 -1000 4000 2000">
  <path id="inf" d="M354-354A500 500 0 1 1 354 354L-354-354A500 500 0 1 0-354 354z"></path>
  <use xlink:href="#inf" stroke-dasharray="1570 5143" stroke-dashoffset="6713px"></use>
</svg>
<span id="y"></span><br/>
</form>
{% if page.solved %}
<p class="tell-me">
  This algorithm is has been solved by {{ page.solver }}.<br>
  Click <a href="#" tabindex="1" class="revealer">here</a> to reveal the solution. 
</p>
<p class="tell-me solution">
  {{ page.solution }}
</p>
{% else %}
<p class="tell-me">
  Have you figured it out? Tell me!<br>
  <a href="https://twitter.com/moulds">@moulds</a> or <a href="mailto:steve@stevemould.com">steve@stevemould.com</a>
</p>
{% endif %}

<script>
var data = {};
var xBox = document.getElementById("x");

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
  var x = xBox.value;
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

  xBox.focus();
  xBox.select();
}

xBox.focus();
</script>
=======
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

    function makeCorsRequest() {
      event.preventDefault();
      document.getElementById("y").innerHTML = "";
      document.getElementById("spinner").style.display = "block";
      var x = document.getElementById('x').value;
      {% if site.GH_ENV == 'gh_pages' %}
        var url = 'https://guess-the-algorithm.herokuapp.com';
      {% else %}
        var url = 'http://localhost:5000';
      {% endif %}
      url += '/{{page.alg-number }}/?x='+x+'&session='+data.session+'&iv='+data.iv;
      var xhr = createCORSRequest('GET', url);
      if (!xhr) {
        alert('CORS not supported');
        return;
      }

      xhr.onload = function() {
        document.getElementById("spinner").style.display = "none";
        var response = xhr.responseText;
        data = JSON.parse(response);
        document.getElementById("y").innerHTML = addCommas(data.y);
        console.log(data);
      };

      xhr.onerror = function() {
        console.log('youtube stats update failed.');
      };

      xhr.send();
    }

    document.getElementById("x").focus();
    </script>
  </body>
>>>>>>> parent of 79fbc8d... Update gta.md

</body>
</html>

$(document).ready(function(){function e(e){for(var t,a=e.target.files,n=0;t=a[n];n++)if(t.type.match("image.*")){var r=new FileReader;r.onload=function(e){return function(t){var a=document.createElement("span");a.innerHTML=['<img class="image-preview-thumb border-light" src="',t.target.result,'" title="',escape(e.name),'"/>'].join(""),document.getElementById("list").insertBefore(a,null)}}(t),r.readAsDataURL(t)}}var t=document.querySelector(".load-image");t&&t.addEventListener("change",e,!1)});
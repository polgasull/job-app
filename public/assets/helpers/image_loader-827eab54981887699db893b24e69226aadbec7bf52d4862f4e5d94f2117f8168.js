$(document).ready(function(){function e(e){for(var t,n=e.target.files,a=0;t=n[a];a++)if(t.type.match("image.*")){var r=new FileReader;r.onload=function(e){return function(t){var n=document.querySelector(".rounded-image:last-child"),a=document.createElement("div");a.classList.add("rounded-image","size-150"),a.innerHTML=['<img class="image-preview-thumb border-light" src="',t.target.result,'" title="',escape(e.name),'"/>'].join(""),n?document.getElementById("list").replaceChild(a,n):document.getElementById("list").insertBefore(a,null)}}(t),r.readAsDataURL(t)}}var t=document.querySelector(".load-image");t&&t.addEventListener("change",e,!1)});
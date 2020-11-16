function profile () {
  const edit = document.getElementById("return-btn");
  const box = document.getElementById("profile-b");
  const form = document.getElementById("profile-f");
  edit.addEventListener("click",() => {
    if (box.getAttribute("style", "display:none;")) {
      box.setAttribute("style","display:block;");
      form.setAttribute("style","display:none;");
    } 
  });
}

setInterval(profile, 1000)
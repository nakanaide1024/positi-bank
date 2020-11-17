function profile () {
  const edit = document.getElementById("edit-btn");
  const box = document.getElementById("profile-b");
  const form = document.getElementById("profile-f");
  edit.addEventListener("click",() => {
    if (box.getAttribute("style", "display:block;")) {
      box.setAttribute("style","display:none;");
      form.setAttribute("style","display:block;");
    } 
  });
}

setInterval(profile, 1000)
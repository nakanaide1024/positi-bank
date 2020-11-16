function load (){
  const box = document.getElementById("profile-b");
  const form = document.getElementById("profile-f");
  if (box.getAttribute("style", "display:none")) {
    box.setAttribute("style","display:block;");
    form.setAttribute("style","display:none;");
  }
};

window.onload = load


window.onload = function menu () {
  const menuBlock = document.getElementById("menu-bk")
  const menuBox = document.getElementById("menu-bx")
  menuBlock.addEventListener("mouseover", () => {
    menuBox.setAttribute("style", "visibility:visible;");
  });
  menuBox.addEventListener("mouseleave", () => {
    menuBox.removeAttribute("style", "visibility:visible;");
  });
}


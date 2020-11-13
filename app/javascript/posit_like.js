function posit_like () {
  const likes = document.querySelectorAll(".likes");
  likes.forEach(function (like) {
    if (like.getAttribute("data-load") != null) {
      return null;
    }
    like.setAttribute("data-load", "true");
    like.addEventListener("click",() => {
      const positId = like.getAttribute("data-id");
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `/posits/${positId}/add`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        if (XHR.status != 200) {
          alert(`Error ${XHR.status}: ${XHR.statusText}`);
          return null;          
        }
        const item = XHR.response.posit;
        if (item.checked === true) {
          like.setAttribute("data-check", "true");
          XHR.open("POST", `/posits/${positId}/add`, true);
          XHR.responseType = "json";
          let token = document.getElementsByName("csrf-token")[0].content; 
          XHR.setRequestHeader('X-CSRF-Token', token);
          XHR.send();
          XHR.onload = () => {
            location.reload();
          }
        } else if (item.checked === false) {
          like.removeAttribute("data-check");
          XHR.open("DELETE", `/posits/${positId}/add`, true);
          XHR.responseType = "json";
          let token = document.getElementsByName("csrf-token")[0].content; 
          XHR.setRequestHeader('X-CSRF-Token', token);
          XHR.send();
          XHR.onload = () => {
            location.reload();
          }
        }
      };
    });
  });
}
setInterval(posit_like, 1000);
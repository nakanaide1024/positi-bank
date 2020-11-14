window.addEventListener('load', function(){
  const likes = document.querySelectorAll(".blogs_likes");
  likes.forEach(function (like) {
    const blogId = like.getAttribute("data-id");
    const XHR = new XMLHttpRequest();
    XHR.open("GET", `/blogs/${blogId}/check`, true);
    XHR.responseType = "json";
    XHR.send();
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;          
      }
      const item = XHR.response.blog;
      if (item.checked === true) {
        like.setAttribute("data-check", "true");
      } else if (item.checked === false) {
        like.removeAttribute("data-check");
      }
    };
  });
});
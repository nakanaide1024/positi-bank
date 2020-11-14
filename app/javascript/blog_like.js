function blog_like () {
  const likes = document.querySelectorAll(".blogs_likes");
  likes.forEach(function (like) {
    if (like.getAttribute("blog-load") != null) {
      return null;
    }
    like.setAttribute("blog-load", "true");
    like.addEventListener("click",() => {
      const blogId = like.getAttribute("data-id");
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `/blogs/${blogId}/add`, true);
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
          XHR.open("POST", `/blogs/${blogId}/add`, true);
          XHR.responseType = "json";
          let token = document.getElementsByName("csrf-token")[0].content; 
          XHR.setRequestHeader('X-CSRF-Token', token);
          XHR.send();
          XHR.onload = () => {
            location.reload();
          }
        } else if (item.checked === false) {
          like.removeAttribute("data-check");
          XHR.open("DELETE", `/blogs/${blogId}/add`, true);
          XHR.responseType = "json";
          let token = document.getElementsByName("csrf-token")[0].content; 
          XHR.setRequestHeader('X-CSRF-Token', token);
          XHR.send();
          XHR.onload = () => {
            location.reload();
          };
        };
      };
    });
  });
}
setInterval(blog_like, 1000);
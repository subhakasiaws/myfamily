/*var prevScrollpos = window.pageYOffset;
window.onscroll = function() {
var currentScrollPos = window.pageYOffset;
  if (prevScrollpos > currentScrollPos) {
    document.getElementById("mynavbar").style.top = "0";
  } else {
    document.getElementById("mynavbar").style.top = "-50px";
  }
  prevScrollpos = currentScrollPos;
}*/

var timer = 0;
function startRedirect() {
  timer = setTimeout(function () {
    window.location.replace("/login?lang=te");
  }, 60000);
}
function restartTimer() {
  clearTimeout(timer);
  startRedirect();
}
$(function () {
  startRedirect();
  $(document).mousemove(restartTimer).keyup(restartTimer);
});
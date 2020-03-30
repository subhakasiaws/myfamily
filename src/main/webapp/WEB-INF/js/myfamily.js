
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

function clearItems(){
	$('#welcome').remove();
	$('#shopping').remove();
}

function getLanguageConverter(selected){
	if("1" == selected ){
		selected = "?lang=te";
	}else if("2" == selected){
		selected = "?lang=en";
	}else if("3" == selected){
		selected = "?lang=hi";
	}else if("4" == selected){
		selected = "?lang=cn";
	}else if("5" == selected){
		selected = "?lang=de";
	}
	return selected;
}

$( "#quiz_1" ).click(function() {
	$('#quiz_1').html('Coming Soon');
	});

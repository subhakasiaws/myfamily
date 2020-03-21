
function eventDataSubmit(name,desc,date,createdBy){
	$.get("createEvent", { eventName: name,eventDescription: desc,eventDate: date, eventCreatedBy: createdBy })
	  .done(function( data ) {
		$('#createEvent').click();
		$('#createEvent').css("display","none");
		
		var title = '';
		var birthdayImg = '';
		if('marriageday'== name){
			title = 'Marriage Day';
		}else{
			title = 'Birthday';
			birthdayImg = '<img alt="My 24th Birthday!" src="images/birthday.jpg" />';
		}
		
		var newList = '<li> <time datetime="2014-07-20 2000"> <span class="day">20</span> <span class="month">Jan</span> <span class="time">8:00 PM</span> </time>'  
			+birthdayImg
			+'<div class="info"> <h2 class="title">'+desc+'</h2>'
			+'<p class="desc">'+title+'</p>'
			+'<ul>'
			+'<li style="width:33%;">1 <span class="glyphicon glyphicon-ok"></span></li>'
			+'<li style="width:34%;">3 <span class="fa fa-thumbs-up"></span></li>'
			+'<li style="width:33%;"> <span class="fa fa-envelope"></span></li>'
			+'</ul>'
			+'</div>'
			+'<div class="social">'
			+'<ul> '
			+'<li class="facebook" style="width:33%;"><a href="#facebook"><span class="fa fa-facebook"></span></a></li>'
			+'<li class="twitter" style="width:34%;"><a href="#twitter"><span class="fa fa-twitter"></span></a></li>'
			+'<li class="google-plus" style="width:33%;"><a href="#google-plus"><span class="fa fa-google-plus"></span></a></li>'
			+'</ul>'
			+'</div>'
			+'</li>';
		
		$('.event-list').prepend(newList);
	  });
}

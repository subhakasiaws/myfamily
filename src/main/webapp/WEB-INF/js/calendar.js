$('.event-list').sortable();

   //logout
   $('#logout').click(function() {
	 window.location.replace("/logout");
	});
   
function eventDataSubmit(name,desc,date,createdBy){
	$('#eventSubmit').attr('disabled',true);
	$.get("createEvent", { eventName: name,eventDescription: desc,eventDate: date, eventCreatedBy: createdBy })
	  .done(function( data ) {
		$('#createEvent').click();
		$('#createEvent').css("display","none");
		
		var title = '';
		if('marriageday'== name){
			title = 'Marriage Day';
		}else{
			title = 'Birthday';
		}
		
		var output=date.split('-');
		
		var newList = '<li> <time datetime="2014-07-20 2000"> <span class="day">'+output[0]+'</span> <span class="month">'+output[1]+'</span> <span class="time">8:00 PM</span> </time>'  
			+'<div class="info"> <h2 class="title">'+desc+'</h2>'
			+'<p class="desc">'+title+'</p>'
			+'<ul>'
			+'<li style="width:33%;">1 <span class="glyphicon glyphicon-ok"></span></li>'
			+'<li style="width:34%;">3 <span class="fa fa-thumbs-up"></span></li>'
			+'<li style="width:33%;"> <span class="fa fa-envelope"></span></li>'
			+'</ul>'
			+'</div>'
			+'</li>';
		
		$('.event-list').prepend(newList);
	  });
}

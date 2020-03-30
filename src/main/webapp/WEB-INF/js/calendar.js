$('.event-list').sortable();

   //logout
   $('#logout').click(function() {
	 window.location.replace("/logout");
	});
   
function eventDataSubmit(name,desc,day,month,stringMonth,createdBy){
	$('#eventSubmit').attr('disabled',true);
	$.get("createEvent", { eventName: name,eventDescription: desc,eventDay: day,eventMonth: month,stringMonth:stringMonth, eventCreatedBy: createdBy })
	  .done(function( data ) {
		$('#createEvent').click();
		$('#createEvent').css("display","none");
		
		var title = '';
		if('marriageday'== name){
			title = 'Marriage Day';
		}else{
			title = 'Birthday';
		}
		
		
		var newList = '<li> <time datetime="2014-07-20 2000"> <span class="day">'+day+'</span> <span class="month">'+stringMonth+'</span> <span class="time">8:00 PM</span> </time>'  
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

$("#dropEvent li").click(function() {
	var id = $(this).data("id");
    $.get("dropEvent", { eventId: id })
	  .done(function( data ) {
		  console.log("deleted "+id);
		  $('#'+id).remove();
	  });
    
});


$("#cup_q" ).change(function() {
	var temp = $(this).val();
	var exVal = $('#totalVal').html();
	console.log('exVal :'+exVal);
	  if(temp <= 5){
		  var ftotal =parseInt(exVal)+500;
		  console.log('ftotal total :'+ftotal);
		  $('#totalVal').html('');
		 $('#totalVal').html(ftotal); 
	  }else{
		  $("#cup_q" ).prop('disabled', true);
		  $("#cup_q" ).val(5);
	  }
	});

$("#iphone_q" ).change(function() {
	var temp = $(this).val(); 
	var exVal = $('#totalVal').html();
	  if(temp <= 2){
		  var ftotal =parseInt(exVal)+2000;
		  $('#totalVal').html('');
		  $('#totalVal').html(ftotal); 
	  }else{
		  $("#iphone_q" ).prop('disabled', true);
		  $("#iphone_q" ).val(2);
	  }
	  
	});

$("#gold_q" ).change(function() {
	var temp = $(this).val(); 
	var exVal = $('#totalVal').html();
	  if(temp <= 1){
		  var ftotal =parseInt(exVal)+5000;
		  $('#totalVal').html('');
		  $('#totalVal').html(ftotal); 
	  }else{
		  $("#gold_q" ).prop('disabled', true);
		  $("#gold_q" ).val(1);
	  }
	  
	});

$('#place_order').click(function(){
	var orderPoints = parseInt($('#totalVal').html());
	var earnedPoints = parseInt($('#totalPoints').html());
	console.log(orderPoints +"-->"+earnedPoints);
	
	if(orderPoints <= earnedPoints){
		console.log("you can place order");
		 $('#orderplaced').modal('show');
	}else{
		console.log("you can't place order");
		$('#cancelOrder').modal('show');
	}
	
});

if(localStorage.getItem("taskNoti") == '1'){
	 $("#myTask").append('<span id="taskNotification" class="badge badge-pill badge-danger my-top-12">1</span>');
}
if(localStorage.getItem("calNoti") == '1'){
	 $("#calendar").append('<span id="celebrNotification" class="badge badge-pill badge-danger my-top-12">1</span>');
}

$( "#quiz_1" ).click(function() {
	$(this).html('Coming Soon');
});

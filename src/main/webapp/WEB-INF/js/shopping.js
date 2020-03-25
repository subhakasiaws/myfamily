
$("#cup_q" ).change(function() {
	var temp = $(this).val();
	var exVal = $('#totalVal').html();
	  if(temp <= 5){
		  var sub_t=temp*500;
		  var ftotal =exVal+sub_t;
		  $('#totalVal').html('');
		 $('#totalVal').html(ftotal); 
	  }
	});

$("#iphone_q" ).change(function() {
	var temp = $(this).val(); 
	var exVal = $('#totalVal').html();
	  if(temp <= 2){
		  var ftotal =exVal+(temp*2000);
		  $('#totalVal').html('');
		  $('#totalVal').html(ftotal); 
	  }
	  
	});

$("#gold_q" ).change(function() {
	var temp = $(this).val(); 
	var exVal = $('#totalVal').html();
	  if(temp <= 1){
		  var ftotal =exVal+(temp*5000);
		  $('#totalVal').html('');
		  $('#totalVal').html(ftotal); 
	  }
	  
	});
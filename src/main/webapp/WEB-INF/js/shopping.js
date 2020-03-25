
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
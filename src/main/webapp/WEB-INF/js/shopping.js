
$("#cup_q" ).change(function() {
	var temp = $(this).val();
	var exVal = $('#totalVal').html();
	console.log('exVal :'+exVal);
	  if(temp <= 5){
		  var ftotal =parseInt(exVal)+500;
		  console.log('ftotal total :'+ftotal);
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
$("#sortable").sortable();
$("#sortable").disableSelection();

countTodos();

// all done btn
$("#checkAll").click(function(){
	console.log("checkAll clicked-->")
   
	$('#pointscredit').modal("show");
	var total=$('.count-todos').html();
	console.log(total);
	$('.task-points').html(total*10);
	 AllDone();
	 submitPost($('#name').val(),total*10);
});

function submitPost(name,points){
	$.get("creditPoints", { name: name, points: points })
	  .done(function( data ) {
	    //alert( "Data Loaded: " + data );
	    $('#totalPoints').text(data);
	  });
}

//create todo
$('.add-todo').on('keypress',function (e) {
      e.preventDefault
      if (e.which == 13) {
           if($(this).val() != ''){
           var todo = $(this).val();
            createTodo(todo); 
            countTodos();
           }else{
               // some validation
           }
      }
});
// mark task as done
$('.todolist').on('change','#sortable li input[type="checkbox"]',function(){
	console.log('todolist change');
    if($(this).prop('checked')){
        var doneItem = $(this).parent().parent().find('label').text();
        $(this).parent().parent().parent().addClass('remove');
        done(doneItem);
        countTodos();
    }
});

//delete done task from "already done"
$('.todolist').on('click','.remove-item',function(){
    removeItem(this);
});

// count tasks
function countTodos(){
    var count = $("#sortable li").length;
    $('.count-todos').html(count);
}

//create task
function createTodo(text){
    var markup = '<li class="ui-state-default"><div class="checkbox"><label><input type="checkbox" value="" />'+ text +'</label></div></li>';
    $('#sortable').append(markup);
    $('.add-todo').val('');
}

//mark task as done
function done(doneItem){
    var done = doneItem;
    var markup = '<li>'+ done +'<button class="btn btn-default btn-xs pull-right  remove-item"><span class="fa fa-trash my-display-block"></span></button></li>';
    $('#done-items').append(markup);
    $('.remove').remove();
    console.log('done task');
    if($("#sortable li").length == 0){
    	$('#checkAll').attr("disabled", true);
    }
    
    $('#pointscredit').modal("show");
    $('.task-points').html(10);
}

//mark all tasks as done
function AllDone(){
    var myArray = [];

    $('#sortable li').each( function() {
         myArray.push($(this).text());   
    });
    
    // add to done
    for (i = 0; i < myArray.length; i++) {
        $('#done-items').append('<li>' + myArray[i] + '<button class="btn btn-default btn-xs pull-right  remove-item"><span class="fa fa-trash my-display-block"></span></button></li>');
    }
    
    // myArray
    $('#sortable li').remove();
    $('#checkAll').attr("disabled", true);
    countTodos();
}

//remove done task from list
function removeItem(element){
    $(element).parent().remove();
}
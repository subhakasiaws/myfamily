<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<spring:message code=""/>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="css/task.css" >
<script src="js/task.js"></script>
</head>
<%@ include file="header.jsp" %> 
   <!-- Page Content -->
  <div class="container-fluid makeScroll homeccbground margin-b-100">
      <div>
        <h1 class="mt-5"><spring:message code="app.page.hi"/> <label for="name" id="name" value='${param.name}' >${param.name}</label> </h1>
        <label id="userId" name="userId" style="display: none;" value='${param.userId}'>${param.userId}</label>
<div class="row">
        <div class="col-md-6">
            <div class="todolist not-done">
             <h1>Todos</h1>
                <input type="text" class="form-control add-todo" placeholder="Add todo">
                    <button id="checkAll" class="btn btn-success">Mark all as done</button>
                    
                    <hr>
                    <ul id="sortable" class="list-unstyled">
                    <li class="ui-state-default">
                        <div class="checkbox">
                            <label> <input type="checkbox" value="" />Wake Up Early</label>
                        </div>
                    </li>
                    <li class="ui-state-default">
                        <div class="checkbox">
                            <label> <input type="checkbox" value="" />Take out the trash</label>
                        </div>
                    </li>
                    <li class="ui-state-default">
                        <div class="checkbox">
                            <label> <input type="checkbox" value="" />Do house work</label>
                        </div>
                    </li>
                </ul>
                <div class="todo-footer">
                    <strong><span class="count-todos"></span></strong> Items Left
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="todolist">
             <h1>Already Done</h1>
                <ul id="done-items" class="list-unstyled">
                    <li>Sleeping a lot <button class="remove-item btn btn-default btn-xs pull-right"><span class="fa fa-trash my-display-block"></span></button></li>
                    
                </ul>
            </div>
        </div>
    </div>   
        <div class="modal fade" id="pointscredit" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header align-popup-div">
                        <button type="button" class="close align-popup-btn" data-dismiss="modal" aria-label=""><span>×</span></button>
                     </div>
					
                    <div class="modal-body">
                       
						<div class="thank-you-pop text-center">
							<img src="images/Green-Round-Tick.png" alt="">
							<h1>Congratulations!</h1>
							<p>You earned <strong><span class="task-points"></span></strong> points</p>
 						</div>
                    </div>
					
                </div>
            </div>
        </div>
           
      </div>
  
  </div>
<%@ include file="footer.jsp" %>
<script type="text/javascript">
$(document).ready(function() {
   var userName = '${param.name}';
   $("#name").val(userName);
   console.log("userName:"+userName);
   var userId = '${param.userId}';
   $("#userId").val(userId);
   console.log(userId);
   var points = '${param.points}';
   $('#totalPoints').text(points);
   console.log("points "+points);
   
   $("#home").click(function() {
	   console.log("loding home");
	   var temp = userName;
		$("body").load("/home",{name:temp,userId:userId,isFromLogin:false});
		history.pushState(null, null, "/home");
   });
   
   $("#calendar").click(function() {
	   console.log("loding calendar");
		$("body").load("/calendar?name="+userName+"&userId="+userId+"&points="+points);
		history.pushState(null, null, "/calendar");
   });
});
</script>

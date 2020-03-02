<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<spring:message code=""/>

<link href="css/font-awesome.min.css"	rel="stylesheet" />	
<link rel="stylesheet" href="css/mystyle.css" >

<%@ include file="header.jsp" %> 

   <!-- Page Content -->
  <div class="container-fluid makeScroll homeccbground">
      <div>
        <h1 class="mt-5"><spring:message code="app.page.hi"/> <label for="name" id="name" >${name}</label> </h1>
        
        <table class="table">
  <thead>
    <tr>
      <th scope="col">Rank</th>
      <th scope="col">Name</th>
      <th scope="col">Points</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Chandra</td>
      <td>100</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Thulasi</td>
      <td>50</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>Sankara</td>
      <td>50</td>
    </tr>
  </tbody>
</table>
      </div>
  
  </div>
<%@ include file="footer.jsp" %> 
<script type="text/javascript">
$(window).on('load', function () { 
   var modelAttributeValue = '${name}';
   $("#name").val(modelAttributeValue);
   console.log("modelAttributeValue");
   console.log(modelAttributeValue);
});
</script>

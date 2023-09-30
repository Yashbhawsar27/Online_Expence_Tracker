<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page isELIgnored="false" %>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
      <%@ include file="component/all_css.jsp" %>
<style type="text/css">

.card-sh{
		box-shadow: 0 0 6px 0 rgba(0 ,0, 0,3);
		

}

</style>
  </head>
  <body class="bg-light">
   

<%@include file="component/navbar.jsp" %>

<div class="container p-5">

	<div class="row">
	<div class="col-md-6 offset-md-3 ">
		<div class="card card-sh ">
			<div class="card-header">
				<p class="text-center fs-3">Register Page</p>
			 <c:if test="${not empty message}">
			    <p>${message}
			   </p>
			   <c:remove var="message"/>
			   </c:if>
			</div>
		     <div class="card-body">
		     <form action="userRegister" method="post">
		     	<div class="mb-3">
		     	 	<label>Enter full name</label>
		     	 	<input type="text" name="fullname" class="form-control">
		     	</div>
		     	
		     	
		     	<div class="mb-3">
		     	 	<label>Email</label>
		     	 	<input type="email" name="email" class="form-control">
		     	</div>
		     	<div class="mb-3">
		     	 	<label>password</label>
		     	 	<input type="password" name="password" class="form-control">
		     	</div>
		     	
		     	
		     	
		     	<div class="mb-3">
		     	 	<label>About</label>
		     	 	<input type="text" name="about" class="form-control">
		     	</div>
		     	<button class="btn btn-primary col-md-12">
		     	   Register
		     	</button>
		     </form>
		     </div>
		</div>
		</div>
	
	</div>
</div>
</body>
</html>
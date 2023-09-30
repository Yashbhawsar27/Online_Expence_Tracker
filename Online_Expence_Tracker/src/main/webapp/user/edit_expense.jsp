<%@page import="com.entity.Expense"%>
<%@page import="com.db.HibernateUtil"%>
<%@page import="com.dao.ExpenseDao"%>
<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@page import="com.db.HibernateUtil"%>
<%@page import="com.dao.ExpenseDao"%>
<%@page import="com.mysql.cj.protocol.a.CompressedPacketSender"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Edit Expense</title>
<%@ include file="../component/all_css.jsp" %>
<style type="text/css">
    .card-sh {
        box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.3);
        border: 1px solid #ccc;
    }
    
    .form-label {
        font-weight: bold;
    }
</style>
</head>
<body class="bg-light">


    <c:if test="${empty loginUser}">
    	<c:redirect url="../login.jsp">
    	</c:redirect>
      </c:if>
      
      <%int id=Integer.parseInt(request.getParameter("id"));
      
      ExpenseDao dao= new ExpenseDao (HibernateUtil.getSessionFactory());
      Expense ex= dao.getExpenseById(id);
      %>
        <jsp:include page="../component/navbar.jsp" />

           
 
    <div class="container">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card card-sh">
                    <div class="card-header text-center">
                        <p class="fs-3">Edit Expense</p>
                        <c:if test="${not empty message}">
                            <p>${message}</p>
                            <c:remove var="message" />
                        </c:if>
                    </div>
                    
                    <div class="card-body">
                        <form action="../updateExpense" method="post">

                            <div class="mb-3">
                                <label for="title" class="form-label">Title</label>
                                <input type="text" class="form-control" id="title" name="title" value=<%=ex.getTitle() %>>
                            </div>
                            <div class="mb-3">
                                <label for="date" class="form-label">Date</label>
                                <input type="date" class="form-control" name="date" value=<%=ex.getDate() %>>
                            </div>

                            <div class="mb-3">
                                <label for="time" class="form-label">Time</label>
                                <input type="time" class="form-control" name="time" value=<%=ex.getTime() %>>
                            </div>

                            <div class="mb-3">
                                <label for="description" class="form-label">Description</label>
                                <input type="text" class="form-control" name="description" value=<%=ex.getDescription() %>>
                            </div>

                            <div class="mb-3">
                                <label for="price" class="form-label">Price</label>
                                <input type="text" class="form-control" name="price" value=<%=ex.getPrice() %>>
                            </div>

							<input type="hidden" name="id" value=<%=ex.getId() %>>

                            <button type="submit" class="btn btn-dark col-md-12">Update</button>
                        </form>
                    </div>
                </div>
     
        </div>
    </div>
</body>
</html>

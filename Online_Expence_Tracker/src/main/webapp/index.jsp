<!doctype html>
<%@page import="org.hibernate.SessionFactory"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.db.HibernateUtil"%>
<%@page import="org.hibernate.Hibernate"%>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Index</title>
<%@ include file="component/all_css.jsp"%>

</head>
<body>

	<!--  ye wala page nhi chal raha hai -->




	<%@include file="component/navbar.jsp"%>


	<%-- <%SessionFactory sessionFactory  = HibernateUtil.getSessionFactory();
out.println(sessionFactory);%>

 --%>

	<div id="carouselExampleControls" class="carousel slide"
		data-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100" src="img/ex1.jpeg" alt="First slide"
					style="height: 350px;">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="img/ex2.jpeg" alt="Second slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="img/ex3.jpeg" alt="Third slide">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleControls"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleControls"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>


</body>
</html>
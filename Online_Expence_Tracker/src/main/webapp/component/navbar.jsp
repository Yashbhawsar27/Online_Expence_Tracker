<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Expense Tracker</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer">
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"> <i class="fas fa-money-check"></i>
				Expense Tracker
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>



			<div class="collapse navbar-collapse" id="navbarSupportedContent">

				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<!-- <li class="nav-item"><a class="nav-link active"
						aria-current="page" href="../index.jsp"><i
							class="fa-solid fa-house"></i>Home</a></li> -->


					<%
					if (session.getAttribute("loginUser") == null) {
					%>
					<li class="nav-item"><a class="nav-link" href="index.jsp">

							Home </a></li>

					<%
					}
					%>

					<%
					if (session.getAttribute("loginUser") != null) {
					%>

					<li class="nav-item"><a class="nav-link" href="home.jsp">

							Home </a></li>

					<li class="nav-item"><a class="nav-link"
						href="add_expense.jsp"> <i class="fa-solid fa-circle-plus"
							style="color: #f3f4f7;"></i> Add Expense
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="view_expense.jsp"> <i class="fas fa-list"
							style="color: #f3f4f7;"></i> View Expenses
					</a></li>
					<%
					}
					%>

				</ul>
				<ul class="navbar-nav ">
					<%
					if (session.getAttribute("loginUser") != null) {
					%>



					<li class="nav-item"><a class="nav-link" href="#"> <i
							class="fas fa-user-circle"></i> <%=((User) session.getAttribute("loginUser")).getFullname()%>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="../logout">
							<i class="fas fa-sign-out-alt"></i> LogOut
					</a></li>


					<%
					} else {
					%>
					<li class="nav-item"><a class="nav-link" href="login.jsp">
							<i class="fas fa-sign-in-alt"></i> Login
					</a></li>
					<li class="nav-item"><a class="nav-link" href="register.jsp">
							<i class="fas fa-user-plus"></i> Register
					</a></li>
					<%
					}
					%>
				</ul>
			</div>
		</div>
	</nav>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

 <%-- 
 
 <%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Meta tags and CSS links -->

    <title>Expense Tracker</title>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <!-- Navbar content -->

        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <!-- Home link for non-logged-in users -->
            <%
            if (session.getAttribute("loginUser") == null) {
            %>
            <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
            <%
            }
            %>

            <!-- Links for logged-in users -->
            <%
            if (session.getAttribute("loginUser") != null) {
            %>
            <li class="nav-item"><a class="nav-link" href="home.jsp">Home</a></li>
            <li class="nav-item"><a class="nav-link" href="add_expense.jsp">Add Expense</a></li>
            <li class="nav-item"><a class="nav-link" href="view_expense.jsp">View Expenses</a></li>
            <%
            }
            %>
        </ul>

        <ul class="navbar-nav">
            <!-- User-related links -->
            <%
            if (session.getAttribute("loginUser") != null) {
            %>
            <li class="nav-item"><a class="nav-link" href="#"><%=((User) session.getAttribute("loginUser")).getFullname()%></a></li>
            <li class="nav-item"><a class="nav-link" href="../logout">LogOut</a></li>
            <%
            } else {
            %>
            <!-- Links for non-logged-in users -->
            <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
            <li class="nav-item"><a class="nav-link" href="register.jsp">Register</a></li>
            <%
            }
            %>
        </ul>
    </nav>

    <!-- JavaScript libraries -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
  --%>
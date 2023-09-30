package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.HibernateUtil;
import com.entity.User;

@WebServlet("/userRegister")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String fullName = req.getParameter("fullname");
		String emailString = req.getParameter("email");
		String password = req.getParameter("password");
		String about = req.getParameter("about");
		User u = new User(fullName, emailString, password, about);
//	
//	System.out.println(u);
//	
		UserDao userDao = new UserDao(HibernateUtil.getSessionFactory());
		boolean f = userDao.saveUser(u);

		HttpSession session=  req.getSession();
		
		if (f) {
			session.setAttribute("message", "Register sucessfully");
			System.out.println("Register Sucessfully");
			resp.sendRedirect("register.jsp");
		}
		else {
			session.setAttribute("message", "something wrong on server");
			System.out.println("something wrong on server");
		}
		}

	}

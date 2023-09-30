package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ExpenseDao;
import com.db.HibernateUtil;
import com.entity.Expense;
import com.entity.User;

@WebServlet("/updateExpense")
public class UpdateExpenceServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));
		String title = req.getParameter("title");
		String date = req.getParameter("date");
		String time = req.getParameter("time");
		String description = req.getParameter("description");
		String price = req.getParameter("price");

//		if (title.isEmpty() || date.isEmpty() || time.isEmpty() || description.isEmpty() || price.isEmpty()) {
//			HttpSession session = req.getSession();
//			session.setAttribute("message", "All fields are required.");
//			resp.sendRedirect("user/add_expense.jsp");
//			return;
//		}

		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("loginUser");
		Expense expense = new Expense(user, title, date, time, description, price);
		expense.setId(id);
		
		
		
		ExpenseDao expenseDao = new ExpenseDao(HibernateUtil.getSessionFactory());
		boolean success = expenseDao.updateExpense(expense);

		if (success) {
			session.setAttribute("message1", "Expense updated successfully.");
			resp.sendRedirect("user/view_expense.jsp");

		} else {
			session.setAttribute("message1", "Something went wrong on the server.");
			resp.sendRedirect("user/view_expense.jsp");

		}

//        resp.sendRedirect("user/add_expense.jsp");
	}

}

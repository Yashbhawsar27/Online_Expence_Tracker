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

@WebServlet("/deleteExpense")
public class DeleteExpenseServlet  extends HttpServlet{
	
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id=Integer.parseInt(req.getParameter("id"));
		ExpenseDao expenseDao= new ExpenseDao(HibernateUtil.getSessionFactory());
		boolean f= expenseDao.deleteExpense(id);
		
		
		HttpSession session=req.getSession();
		
		if(f)
		{
			session.setAttribute("message", "Delete Sicessfully");
			resp.sendRedirect("user/view_expense.jsp");
			
	
		}
		
		else {
			session.setAttribute("message", "something wrong");
			resp.sendRedirect("user/view_expense.jsp");
		}
		
		
	}

}

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

@WebServlet("/saveExpense")
public class SaveExpenseServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        String date = req.getParameter("date");
        String time = req.getParameter("time");
        String description = req.getParameter("description");
        String price = req.getParameter("price");

        if (title.isEmpty() || date.isEmpty() || time.isEmpty() || description.isEmpty() || price.isEmpty()) {
            HttpSession session = req.getSession();
            session.setAttribute("message", "All fields are required.");
            resp.sendRedirect("user/add_expense.jsp");
            return;
        }

        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("loginUser");
        Expense expense = new Expense(user, title, date, time, description,price);
     
        ExpenseDao expenseDao = new ExpenseDao(HibernateUtil.getSessionFactory());
        boolean success = expenseDao.saveExpense(expense);

        if (success) {
            session.setAttribute("message", "Expense added successfully.");
//            resp.sendRedirect("user/add_expence.jsp");
//   path me error aane pr ye context path me path add krna hai          
            resp.sendRedirect(req.getContextPath() + "/user/add_expense.jsp");
        } else {
            session.setAttribute("message", "Something went wrong on the server.");
//            resp.sendRedirect("user/add_expence.jsp");
            
            resp.sendRedirect(req.getContextPath() + "/user/add_expense.jsp");
        }
        
//        resp.sendRedirect("user/add_expense.jsp");
    }
}

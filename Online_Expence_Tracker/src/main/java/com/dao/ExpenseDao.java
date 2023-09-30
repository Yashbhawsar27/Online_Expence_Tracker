package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.internal.build.AllowPrintStacktrace;

import com.entity.Expense;
import com.entity.User;

public class ExpenseDao {
    private SessionFactory factory = null;
    private Session session = null;
    private Transaction transaction = null;

    public ExpenseDao(SessionFactory factory) {
        super();
        this.factory = factory;
    }

    public boolean saveExpense(Expense expense) {
        boolean f = false;
        try {
            session = factory.openSession();
            transaction = session.beginTransaction();
            session.save(expense);
            transaction.commit();
            f = true;
        } catch (Exception e) {
            if (transaction != null) {
                f = false;
                e.printStackTrace();
            }
        }         return f;
    }

    public List<Expense> getAllExpensesByUser(User user) {
        List<Expense> list = new ArrayList<Expense>();
        try {
            session = factory.openSession();
            Query<Expense> query = session.createQuery("from Expense where user = :us", Expense.class);
            query.setParameter("us", user);
            list = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        } 
        return list;
    }
    
    
    
    
  

    public Expense getExpenseById(int id) {
        try (Session session = factory.openSession()) {
            return session.get(Expense.class, id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    

    public boolean updateExpense(Expense expense) {
        boolean f = false;
        try {
            session = factory.openSession();
            transaction = session.beginTransaction();
            session.saveOrUpdate(expense);
            transaction.commit();
            f = true;
        } catch (Exception e) {
            if (transaction != null) {
                f = false;
                e.printStackTrace();
            }
        } 
        return f;
    }

    
    public boolean deleteExpense(int id) {
        boolean f = false;
        try {
            session = factory.openSession();
            transaction = session.beginTransaction();
           Expense expense= session.get(Expense.class, id);
           session.delete(expense);
            transaction.commit();
            f = true;
        } catch (Exception e) {
            if (transaction != null) {
                f = false;
                e.printStackTrace();
            }
        }
        return f;
    }
}

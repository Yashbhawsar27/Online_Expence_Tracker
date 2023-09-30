package com.dao;

import java.util.List;

import javax.transaction.Transactional.TxType;
import org.hibernate.query.Query; // Import the Query class



import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entity.User;

public class UserDao {

	private SessionFactory factory= null;
	
	private Session session= null;
	
	private Transaction transaction= null;
	
	
	public UserDao(SessionFactory factory)
	{
		this.factory=factory;
	}
	
	
	public boolean saveUser(User user)
	{
		boolean f= false;
		try {
			session=factory.openSession();
			transaction=session.beginTransaction();
			
			session.save(user);
			transaction.commit();
			f=true;
		}
		catch (Exception e) 
		{
			if(transaction!=null)
			{
				f=false;
				e.printStackTrace();
			}
		}
		return f;
	}

		public User login( String email, String password)
		{
			User user=null;
			
			
			session=factory.openSession();
			
			String hql = "from User where email = :em and password = :ps";
			Query<User> query = session.createQuery(hql, User.class); // Replace "User" with your entity class
			query.setParameter("em", email);
			query.setParameter("ps", password);
			List<User> users = query.getResultList();
			
		        user = (User) query.uniqueResult();
			
			
			return user;
			
		}

}

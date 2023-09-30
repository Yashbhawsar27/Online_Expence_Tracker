     package com.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;

@Entity
public class Expense {

    @ManyToOne
    @JoinColumn(name = "user_id") // Name of the foreign key column in the expense table
    private User user;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String title;
    private String date;
    private String time;
    public Expense(User user,  String title, String date, String time, String description, String price) {
		super();
		this.user = user;
	
		this.title = title;
		this.date = date;
		this.time = time;
		this.description = description;
		this.price = price;
	}
	public Expense() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "Expense [user=" + user + ", id=" + id + ", title=" + title + ", date=" + date + ", time=" + time
				+ ", description=" + description + ", price=" + price + "]";
	}
	private String description;
    private String price;
    
}
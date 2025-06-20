package model;

import java.sql.Time;
import java.util.Date;

public class Payment {
	
	//declaring variables
	private int paymentID;
	private String paymentName;
	private Date paymentDate;
	private Time paymentTime;
	private Double amount;
	private String paymentMethod;
	
	// Constructor
	public Payment(int paymentID, String paymentName, Date paymentDate, Time paymentTime, Double amount,
			String paymentMethod) {
		
		this.paymentID = paymentID;
		this.paymentName = paymentName;
		this.paymentDate = paymentDate;
		this.paymentTime = paymentTime;
		this.amount = amount;
		this.paymentMethod = paymentMethod;
	}
	//getters & setters
	public int getPaymentID() {
		return paymentID;
	}
	public void setPaymentID(int paymentID) {
		this.paymentID = paymentID;
	}
	public String getPaymentName() {
		return paymentName;
	}
	public void setPaymentName(String paymentName) {
		this.paymentName = paymentName;
	}
	public Date getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}
	public Time getPaymentTime() {
		return paymentTime;
	}
	public void setPaymentTime(Time paymentTime) {
		this.paymentTime = paymentTime;
	}
	public Double getAmount() {
		return amount;
	}
	public void setAmount(Double amount) {
		this.amount = amount;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	
	
	
	
}

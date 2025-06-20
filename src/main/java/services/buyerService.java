package services;

import java.sql.ResultSet;
import java.sql.Statement;


import model.buyer;
import utils.DBConnect;


public class buyerService {
	
	public void regBuyer(buyer bu) {
		try {
			
			String query="insert into buyer values('"+bu.getNic()+"','"+bu.getName()+"','"+bu.getNumber()+"','"+bu.getEmail()+"','"+bu.getMessage()+"')";
			
			Statement statement=DBConnect.getConnection().createStatement();
			statement.executeUpdate(query);
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}
	
	public buyer getOne(buyer bu) {
		try {
			String query="select * from buyer where nic='"+bu.getNic()+"' and name='"+bu.getName()+"' and number='"+bu.getNumber()+"' and email='"+bu.getEmail()+"' and message='"+bu.getMessage()+"'";
			
			Statement statement =DBConnect.getConnection().createStatement();
			ResultSet rs =statement.executeQuery(query);
			
			bu.setNic(rs.getNString("nic"));
			bu.setName(rs.getNString("name"));
			bu.setNumber(rs.getNString("number"));
			bu.setEmail(rs.getNString("email"));
			bu.setMessage(rs.getNString("message"));
			return bu;
				
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public void updateBuyer(buyer buyer) {
		try {
			String query="update buyer SET nic='"+buyer.getNic()+"','"+buyer.getName()+"','"+buyer.getNumber()+"','"+buyer.getEmail()+"','"+buyer.getMessage()+"' where nic='"+buyer.getNic()+"'";
			Statement statement= DBConnect.getConnection().createStatement();
			statement.executeUpdate(query);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteBuyer(buyer bu) {
		try {
			
			String query ="Delete from buyer where nic='"+bu.getNic()+"'";
			
			Statement statement=DBConnect.getConnection().createStatement();
			statement.executeUpdate(query);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

package services;

import java.sql.ResultSet;

import java.sql.Statement;
import model.buyer;
import model.customer1;
import utils.DBConnect;

public class customerService {
	
	public void regCustomer(customer1 cus) {
		try {
			
			String query="insert into customer1 values('"+cus.getEmail()+"','"+cus.getFirstName()+"','"+cus.getLastName()+"','"+cus.getPhone()+"','"+cus.getPassword()+"','"+cus.getConfirmPassword()+"')";
			Statement statement=DBConnect.getConnection().createStatement();
			statement.executeUpdate(query);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public boolean validate(customer1 cus) {
		try {
			String query="select * from customer1 where email='"+cus.getEmail()+"' and password ='"+cus.getPassword()+"'";
			
			Statement statement =DBConnect.getConnection().createStatement();
			ResultSet rs =statement.executeQuery(query);
			
			if(rs.next()) {
				return true;
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	public void updateBuyerDetails(buyer bu) {
	    try {
	        String query = "UPDATE buyer SET name='" + bu.getName() + "', number='" + bu.getNumber() + "', email='" + bu.getEmail() + "', message='" + bu.getMessage() + "' WHERE nic='" + bu.getNic() + "'";
	        Statement statement = DBConnect.getConnection().createStatement();
	        statement.executeUpdate(query);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	public customer1 getOne(customer1 cus) {
		// TODO Auto-generated method stub
		return null;
	}
	
	


}


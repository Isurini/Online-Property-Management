package utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	
	//create database connection
	private static String url = "jdbc:mysql://localhost:3306/onlinepropertymanagement?characterEncoding=utf8";
	private static String username = "root";
	private static String password = "admin123";

	public static Connection getConnection()  {
		 Connection con = null;
		//validate
		try {
		
		Class.forName("com.mysql.jdbc.Driver");
		con =DriverManager.getConnection(url,username,password);
		}
		catch(Exception e) {
			System.out.println("Database Not Connect !");
			e.printStackTrace();
		}
	return con;
	}
}

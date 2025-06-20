package services;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import model.UserModel;
import utils.DBConnect;

public class UserServices {

    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet resu = null;

    // Insert data function
    public static boolean insertdata(String firstname, String lastname, String contactnumber, String email, String password, String confirmpassword) {

        boolean isSuccess = false;

        try {
            // DB connection call
            con = DBConnect.getConnection();
            stmt = con.createStatement();

            // SQL query
            String sql = "insert into user values(0,'" + firstname + "','" + lastname + "','" + contactnumber + "','" + email + "','" + password + "','" + confirmpassword + "')";

            int resu = stmt.executeUpdate(sql);

            if (resu > 0) {
                isSuccess = true;
            } else {
                isSuccess = false;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }

    // login validate
    public static List<UserModel> loginValidate(String email, String password) {

        ArrayList<UserModel> user = new ArrayList<>();

        try {
            // DB connection call
            con = DBConnect.getConnection();
            stmt = con.createStatement();

            String sql = "select * from user where email='" + email + "' and password='" + password + "'";
            resu = stmt.executeQuery(sql); 

            if (resu.next()) {
                int id = resu.getInt(1);
                String firstname = resu.getString(2);
                String lastname = resu.getString(3);
                String contactnumber = resu.getString(4);
                String emailaddress = resu.getString(5);
                String pass = resu.getString(6);
                String confirmpassword = resu.getString(7);

                UserModel u = new UserModel(id, firstname, lastname, contactnumber, emailaddress, pass, confirmpassword);
                user.add(u);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
    
    public static List<UserModel> userprofile (String ID){
        int convertID =Integer.parseInt(ID);
        ArrayList<UserModel> user = new ArrayList<>();
        
        try {
            // DB connection call
            con = DBConnect.getConnection();
            stmt = con.createStatement();
            String sql = "select * from user where id = '"+convertID+"' ";
            resu = stmt.executeQuery(sql); 
            
            if (resu.next()) {
                int id = resu.getInt(1);
                String firstname = resu.getString(2);
                String lastname = resu.getString(3);
                String contactnumber = resu.getString(4);
                String email = resu.getString(5);
                String password = resu.getString(6);
                String confirmpassword = resu.getString(7);

                UserModel u = new UserModel(id, firstname, lastname, contactnumber, email, password, confirmpassword);
                user.add(u);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    // user profile update
    public static boolean updateprofile(String id,String firstname,String lastname,String contactnumber,String email) {
        boolean isSuccess = false;
        try {
            // DBConnection
            con = DBConnect.getConnection();
            stmt = con.createStatement();

            // SQL query
            String sql = "update user set  firstname='"+ firstname +"',lastname='" + lastname + "',contactnumber='" + contactnumber + "',email='" + email + "'where id='"+id+"'";

            int resu = stmt.executeUpdate(sql);

            if (resu > 0) {
                isSuccess = true;
            } else {
                isSuccess = false;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }

    // GetById
    public static List<UserModel> getById (String Id){
        int convertedID =Integer.parseInt(Id);
        ArrayList<UserModel> user = new ArrayList<>();
        
        try {
            // DB connection call
            con = DBConnect.getConnection();
            stmt = con.createStatement();
            
            // Query
            String sql = "select * from user where id = '"+convertedID+"' ";
            resu = stmt.executeQuery(sql); 
            
            while(resu.next()) {
                int id = resu.getInt(1);
                String firstname = resu.getString(2);
                String lastname = resu.getString(3);
                String contactnumber = resu.getString(4);
                String email = resu.getString(5);

                UserModel u = new UserModel(id, firstname, lastname, contactnumber, email, email, email);
                user.add(u);
            }
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    // Delete Account
    public static boolean deleteaccount(String id) {
        int conID=Integer.parseInt(id);
        boolean isSuccess = false;
        try {
            // DBConnection
            con = DBConnect.getConnection();
            stmt = con.createStatement();
            
            String sql = "delete from user where id ='"+conID+"'";
            
            int resu = stmt.executeUpdate(sql);
            
            if (resu > 0) {
                isSuccess = true;
            } else {
                isSuccess = false;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }
    //change password

    public static boolean changePassword(String email, String oldPassword, String newPassword) {
        boolean success = false;

        try (Connection con = DBConnect.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT password FROM user WHERE email=?")) {

            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String currentPassword = rs.getString("password");

                if (currentPassword.equals(oldPassword)) {
                    // Password matched, update both password and confirmpassword
                    try (PreparedStatement updatePs = con.prepareStatement(
                            "UPDATE user SET password=?, confirmpassword=? WHERE email=?")) {

                        updatePs.setString(1, newPassword);
                        updatePs.setString(2, newPassword); // You could keep confirmPassword logic if needed
                        updatePs.setString(3, email);

                        int rows = updatePs.executeUpdate();
                        success = (rows > 0);
                    }
                } else {
                    System.out.println("Old password does not match.");
                }
            } else {
                System.out.println("User with email not found.");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }



}

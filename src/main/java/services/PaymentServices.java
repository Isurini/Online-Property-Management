package services;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import model.Payment;
import utils.DBConnect;

public class PaymentServices {

    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet resu = null;

    // Add a payment record to the database
    public static boolean addPayment(String paymentName, String paymentDate, String paymentTime, double amount, String paymentMethod) {
        boolean isSuccess = false;
        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();

            // SQL Query 
            String sql = "INSERT INTO payments (paymentName, paymentDate, paymentTime, amount, paymentMethod) " +
                         "VALUES ('" + paymentName + "', '" + paymentDate + "', '" + paymentTime + "', " + amount + ", '" + paymentMethod + "')";
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

    // Get all payment records 
    public static List<Payment> getAllPayments() {
        ArrayList<Payment> payments = new ArrayList<>();
        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();

            String sql = "SELECT * FROM payments";
            resu = stmt.executeQuery(sql);

            while (resu.next()) {
                int paymentID = resu.getInt("paymentID"); // assuming the first column is paymentID
                String paymentName = resu.getString("paymentName");
                Date paymentDate = resu.getDate("paymentDate");
                Time paymentTime = resu.getTime("paymentTime");
                double amount = resu.getDouble("amount");
                String paymentMethod = resu.getString("paymentMethod");

                Payment pay = new Payment(paymentID, paymentName, paymentDate, paymentTime, amount, paymentMethod);
                payments.add(pay);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return payments;
    }

    // Get payment by ID 
    public static Payment getPaymentById(String paymentID) {
        Payment payment = null;
        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();

            String sql = "SELECT * FROM payments WHERE paymentID = '" + paymentID + "'";
            resu = stmt.executeQuery(sql);

            if (resu.next()) {
                int id = resu.getInt("paymentID");
                String paymentName = resu.getString("paymentName");
                Date paymentDate = resu.getDate("paymentDate");
                Time paymentTime = resu.getTime("paymentTime");
                double amount = resu.getDouble("amount");
                String paymentMethod = resu.getString("paymentMethod");

                payment = new Payment(id, paymentName, paymentDate, paymentTime, amount, paymentMethod);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return payment;
    }

    // Update payment record in the database
    public static boolean updatePayment(String paymentID, String paymentName, String paymentDate, String paymentTime,
            double amount, String paymentMethod) {
        boolean isSuccess = false;
        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();

            String sql = "UPDATE payments SET " +"paymentName = '" + paymentName + "', " +"paymentDate = '" + paymentDate + "', " +"paymentTime = '" + paymentTime + "', " +"amount = " + amount + ", " +"paymentMethod = '" + paymentMethod + "' "+"WHERE paymentID = " + paymentID;

            int result = stmt.executeUpdate(sql);
            isSuccess = result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isSuccess;
    }

    // Delete payment record from the database
    public static boolean deletePayment(String paymentID) {
        boolean isSuccess = false;
        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();
            String sql = "DELETE FROM payments WHERE paymentID = '" + paymentID + "'";
            int res = stmt.executeUpdate(sql);
            isSuccess = res > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }
}

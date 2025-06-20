package addpromotions;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import utils.DBConnect;

public class addpromotionsCtrl {

    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;

    // Insert promotion
    public static boolean insertPromotion(String title, String description, double discount, LocalDate startDate, LocalDate endDate) {
        boolean isSuccess = false;

        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();

            String sql = "INSERT INTO addpromotions VALUES (0, '" + title + "', '" + description + "', " + discount + ", '" + Date.valueOf(startDate) + "', '" + Date.valueOf(endDate) + "')";
            int result = stmt.executeUpdate(sql);

            isSuccess = result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }

    // Get a promotion by ID
    public static List<addpromotionsModel> getById(String id) {
        int convertedID = Integer.parseInt(id);
        ArrayList<addpromotionsModel> promotions = new ArrayList<>();

        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();

            String sql = "SELECT * FROM addpromotions WHERE id = " + convertedID;
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
            	addpromotionsModel p = new addpromotionsModel(
                    rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getDouble(4),
                    rs.getDate(5).toLocalDate(),
                    rs.getDate(6).toLocalDate()
                );
            	
                promotions.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return promotions;
    }

    // Get all promotions
    public static List<addpromotionsModel> getAllPromotions() {
        ArrayList<addpromotionsModel> promotions = new ArrayList<>();

        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();

            String sql = "SELECT * FROM addpromotions";
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                addpromotionsModel promo = new addpromotionsModel(
                    rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getDouble(4),
                    rs.getDate(5).toLocalDate(),
                    rs.getDate(6).toLocalDate()
                );
                promotions.add(promo);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return promotions;
    }

    // Update promotion
    public static boolean updateaddPromotions(String id, String title, String description, double discount, LocalDate startDate, LocalDate endDate) {
        boolean isSuccess = false;

        try {
            con = DBConnect.getConnection();

            String sql = "UPDATE addpromotions SET title=?, description=?, discount=?, startDate=?, endDate=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, title);
            ps.setString(2, description);
            ps.setDouble(3, discount);
            ps.setDate(4, Date.valueOf(startDate));
            ps.setDate(5, Date.valueOf(endDate));
            ps.setInt(6, Integer.parseInt(id));

            int result = ps.executeUpdate();
            isSuccess = result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }

    // Delete promotion
    public static boolean deleteaddPromotions(String id) {
        boolean isSuccess = false;

        try {
            int conID = Integer.parseInt(id);
            con = DBConnect.getConnection();
            stmt = con.createStatement();

            String sql = "DELETE FROM addpromotions WHERE id = " + conID;
            int result = stmt.executeUpdate(sql);

            isSuccess = result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }
}

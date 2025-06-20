package Property;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import utils.DBConnect;

import java.time.LocalDate;

public class PropertyCtrl {

    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;

    public static boolean insertData(String pName, String location, double price, String description, LocalDate postDate, String ownerName) {
        boolean isSuccess = false;

        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();

            String sql = "INSERT INTO property VALUES (0, '" + pName + "', '" + location + "', " + price + ", '" + description + "', '" + Date.valueOf(postDate) + "', '" + ownerName + "')";
            int result = stmt.executeUpdate(sql);

            isSuccess = result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }

    public static List<PropertyModel> getById(String id) {
        int convertedID = Integer.parseInt(id);
        ArrayList<PropertyModel> property = new ArrayList<>();

        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();
            String sql = "SELECT * FROM property WHERE id = " + convertedID;
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                
                PropertyModel p1 = new PropertyModel(
                    rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getDouble(4),
                    rs.getString(5),
                    rs.getDate(6).toLocalDate(),
                    rs.getString(7)
                );
                property.add(p1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return property;
    }

    public static List<PropertyModel> getAllProperties() {
        ArrayList<PropertyModel> properties = new ArrayList<>();

        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();
            String sql = "SELECT * FROM property";
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                PropertyModel property = new PropertyModel(
                    rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getDouble(4),
                    rs.getString(5),
                    rs.getDate(6).toLocalDate(),
                    rs.getString(7)
                );
                properties.add(property);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return properties;
    }

    public static boolean updatedata(String id, String pName, String location, double price, String description, LocalDate postDate, String ownerName) {
        boolean isSuccess = false;

        try {
            con = DBConnect.getConnection();
            String sql = "UPDATE property SET pName=?, location=?, price=?, description=?, postDate=?, ownerName=? WHERE id=?";
            java.sql.PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, pName);
            ps.setString(2, location);
            ps.setDouble(3, price);
            ps.setString(4, description);
            ps.setDate(5, java.sql.Date.valueOf(postDate));
            ps.setString(6, ownerName);
            ps.setInt(7, Integer.parseInt(id));

            int result = ps.executeUpdate();

            isSuccess = result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }

    public static boolean deleteData(String id) {
        boolean isSuccess = false;

        try {
            int conID = Integer.parseInt(id);
            con = DBConnect.getConnection();
            stmt = con.createStatement();

            String sql = "DELETE FROM property WHERE id = " + conID;
            int result = stmt.executeUpdate(sql);

            isSuccess = result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }
}

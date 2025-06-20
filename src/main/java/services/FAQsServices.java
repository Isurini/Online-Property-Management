package services;

import java.sql.*;
import java.util.*;
import model.FAQs;
import utils.DBConnect;

public class FAQsServices {

    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet resu = null;

    // Add FAQ 
    public static boolean addFAQ(FAQs faq) {
        return addFAQ(faq.getId(), faq.getQuestion(), faq.getAnswer());
    }

    // Add FAQ (by individual fields)
    public static boolean addFAQ(int id, String question, String answer) {
        boolean isSuccess = false;
        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();

            //Insert query
            String sql = "INSERT INTO faqs (id, question, answer) VALUES ('" + id + "', '" + question + "', '" + answer + "')";
            int res = stmt.executeUpdate(sql);
            
            // Check if insert was successful
            isSuccess = res > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }

    // Get all FAQs
    public static List<FAQs> getAllFAQs() {
        List<FAQs> list = new ArrayList<>();

        try {
        	  // Connect and execute select query
            Connection con = DBConnect.getConnection();
            String sql = "SELECT faqsid, id, question, answer FROM faqs";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            // Process result set
            while (rs.next()) {
                int faqsid = rs.getInt("faqsid");
                int id = rs.getInt("id"); // user ID
                String question = rs.getString("question");
                String answer = rs.getString("answer");

                FAQs faq = new FAQs(faqsid, id, question, answer);
                list.add(faq);
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // Get FAQ by faqsid
    public static FAQs getFAQById(String faqsid) {
        FAQs faq = null;
        try {
        	 // Connect and execute select by faqsid
            con = DBConnect.getConnection();
            stmt = con.createStatement();

            String sql = "SELECT * FROM faqs WHERE faqsid = '" + faqsid + "'";
            resu = stmt.executeQuery(sql);

            if (resu.next()) {
                int id = resu.getInt("id");
                String question = resu.getString("question");
                String answer = resu.getString("answer");

                faq = new FAQs(Integer.parseInt(faqsid), id, question, answer);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return faq;
    }

    // Update FAQ 
    public static boolean updateFAQ(FAQs faq) {
        return updateFAQ(String.valueOf(faq.getFaqsid()), faq.getQuestion(), faq.getAnswer());
    }

    // Update FAQ (by fields)
    public static boolean updateFAQ(String faqsid, String question, String answer) {
        boolean isSuccess = false;
        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();

            String sql = "UPDATE faqs SET question = '" + question + "', answer = '" + answer + "' WHERE faqsid = '" + faqsid + "'";
            int res = stmt.executeUpdate(sql);

            isSuccess = res > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }

 // Delete FAQ by faqsid
    public static boolean deleteFAQ(String faqsid) {
        return deleteFAQ(Integer.parseInt(faqsid));
    }

    public static boolean deleteFAQ(int faqsid) {
        boolean isSuccess = false;
        try (Connection con = DBConnect.getConnection();
             PreparedStatement ps = con.prepareStatement("DELETE FROM faqs WHERE faqsid = ?")) {

            ps.setInt(1, faqsid);
            isSuccess = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }


    // Delete FAQ 
    public static boolean deleteFAQ(FAQs faq) {
        return deleteFAQ(String.valueOf(faq.getFaqsid()));
    }
}

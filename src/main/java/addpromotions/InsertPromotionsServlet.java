package addpromotions;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/InsertPromotionServlet")
public class InsertPromotionsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String discountStr = request.getParameter("discount");
        String startDateStr = request.getParameter("startDate");
        String endDateStr = request.getParameter("endDate");

        boolean isSuccess = false;

        try {
            
            double discount = Double.parseDouble(discountStr);
            LocalDate startDate = LocalDate.parse(startDateStr);
            LocalDate endDate = LocalDate.parse(endDateStr);

            
            isSuccess = addpromotionsCtrl.insertPromotion(title, description, discount, startDate, endDate);

            if (isSuccess) {
                String alertMessage = "Promotion successfully added!";
                response.getWriter().println("<script>alert('" + alertMessage + "'); window.location.href='GetAllPromotions';</script>");
            } else {
                RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
                dis2.forward(request, response);
            }

        } catch (NumberFormatException | DateTimeParseException e) {
            e.printStackTrace();
            request.setAttribute("error", "Invalid input format. Please check discount or date.");
            RequestDispatcher dis = request.getRequestDispatcher("wrong.jsp");
            dis.forward(request, response);
        }
    }
}

package addpromotions;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdatePromotionServlet")
public class UpdatePromotionsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String discountStr = request.getParameter("discount");
        String startDateStr = request.getParameter("startDate");
        String endDateStr = request.getParameter("endDate");
        
        try {
            double discount = Double.parseDouble(discountStr);
            LocalDate startDate = LocalDate.parse(startDateStr);
            LocalDate endDate = LocalDate.parse(endDateStr);

            boolean isUpdated = addpromotionsCtrl.updateaddPromotions(id, title, description, discount, startDate, endDate);

            if (isUpdated) {
                List<addpromotionsModel> promotionDetails = addpromotionsCtrl.getById(id);
                request.setAttribute("promotionDetails", promotionDetails);

                String alertMessage = "Promotion updated successfully!";
                response.getWriter().println("<script>alert('" + alertMessage + "'); window.location.href='GetAllPromotions';</script>");
            } else {
                RequestDispatcher dis = request.getRequestDispatcher("wrong.jsp");
                dis.forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Invalid input format or missing data.");
            RequestDispatcher dis = request.getRequestDispatcher("wrong.jsp");
            dis.forward(request, response);
        }
    }
}

package addpromotions;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeletePromotionServlet")
public class DeletePromotionsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Optional redirect if accessed via GET
        response.sendRedirect("GetAllPromotions");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        boolean isTrue = addpromotionsCtrl.deleteaddPromotions(id);

        if (isTrue) {
            String alertMessage = "Promotion deleted successfully!";
            response.getWriter().println("<script>alert('" + alertMessage + "'); window.location.href='GetAllPromotions';</script>");
        } else {
            List<addpromotionsModel> promotionDetails = addpromotionsCtrl.getById(id);
            request.setAttribute("promotionDetails", promotionDetails);

            RequestDispatcher dispatcher = request.getRequestDispatcher("wrong.jsp");
            dispatcher.forward(request, response);
        }
    }
}

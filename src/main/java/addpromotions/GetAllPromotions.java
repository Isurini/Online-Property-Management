package addpromotions;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GetAllPromotions")
public class GetAllPromotions extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Retrieve the list of all promotions
            List<addpromotionsModel> allPromotions = addpromotionsCtrl.getAllPromotions();

            // Set the list as a request attribute to pass it to the JSP
            request.setAttribute("allPromotions", allPromotions);

            // Forward the request to the display JSP page
            RequestDispatcher dispatcher = request.getRequestDispatcher("displayPromotions.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            // Handle any exceptions during the data retrieval or forwarding process
            e.printStackTrace();
            request.setAttribute("error", "Error retrieving promotions. Please try again.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Delegate POST to GET for consistent behavior
        doGet(request, response);
    }
}

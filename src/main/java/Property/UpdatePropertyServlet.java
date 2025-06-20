package Property;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdatePropertyServlet")
public class UpdatePropertyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String pName = request.getParameter("pName");
        String location = request.getParameter("location");
        String priceStr = request.getParameter("price");
        String description = request.getParameter("description");
        String postDateStr = request.getParameter("postDate");
        String ownerName = request.getParameter("ownerName");

        try {
            double price = Double.parseDouble(priceStr);
            LocalDate postDate = LocalDate.parse(postDateStr); // Format: yyyy-MM-dd

            boolean isTrue = PropertyCtrl.updatedata(id, pName, location, price, description, postDate, ownerName);

            if (isTrue) {
                List<PropertyModel> propertyDetails = PropertyCtrl.getById(id);
                request.setAttribute("propertyDetails", propertyDetails);

                String alertMessage = "Property updated successfully!";
                response.getWriter().println("<script>alert('"+alertMessage+"'); window.location.href='GetAllProperties';</script>");
            } else {
                RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
                dis2.forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Invalid input format.");
            RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
            dis2.forward(request, response);
        }
    }
}

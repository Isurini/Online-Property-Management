package Property;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/InsertPropertyServlet")
public class InsertPropertyServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      
        String pName = request.getParameter("pName");
        String location = request.getParameter("location");
        String priceStr = request.getParameter("price");
        String description = request.getParameter("description");
        String postDateStr = request.getParameter("postDate");
        String ownerName = request.getParameter("ownerName");

        boolean isSuccess = false;

        try {
            double price = Double.parseDouble(priceStr);
            LocalDate postDate = LocalDate.parse(postDateStr);

            isSuccess = PropertyCtrl.insertData(pName, location, price, description, postDate, ownerName);

            if (isSuccess) {
                
                String alertMessage = "Property successfully added!";

                response.getWriter().println("<script>alert('" + alertMessage + "'); window.location.href='GetAllProperties';</script>");

            } else {
                
                RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
                dis2.forward(request, response);
            }

        } catch (NumberFormatException | DateTimeParseException e) {
            
            e.printStackTrace();
            request.setAttribute("error", "Invalid input format. Please check price or date.");
            RequestDispatcher dis = request.getRequestDispatcher("wrong.jsp");
            dis.forward(request, response);
        }
    }
}

package Property;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GetAllProperties")
public class GetAllProperties extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            
            List<PropertyModel> allProperties = PropertyCtrl.getAllProperties();

            
            request.setAttribute("allProperties", allProperties);

           
            RequestDispatcher dispatcher = request.getRequestDispatcher("displayProperties.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            
            e.printStackTrace();
            request.setAttribute("error", "Error retrieving properties. Please try again.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        doGet(request, response);
    }
}

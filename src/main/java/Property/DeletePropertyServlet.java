package Property;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeletePropertyServlet")
public class DeletePropertyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.sendRedirect("AllServlet");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");

		boolean isTrue = PropertyCtrl.deleteData(id);

		if (isTrue) {
			String alertMessage = "Property deleted successfully!";
			response.getWriter().println("<script>alert('" + alertMessage + "'); window.location.href='GetAllProperties';</script>");
		} else {
			List<PropertyModel> propertyDetails = PropertyCtrl.getById(id);
			request.setAttribute("propertyDetails", propertyDetails);

			RequestDispatcher dispatcher = request.getRequestDispatcher("wrong.jsp");
			dispatcher.forward(request, response);
		}
	}
}

package servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.Payment;
import services.PaymentServices;

@WebServlet("/ViewPaymentsServlet")
public class ViewPaymentsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetching all payments from the database
        List<Payment> paymentList = PaymentServices.getAllPayments();
        
        // Setting the payments list as a request attribute
        request.setAttribute("paymentList", paymentList);
        
        // Forwarding the request to ViewPayments.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("ViewPayments.jsp");
        dispatcher.forward(request, response);
    }
}

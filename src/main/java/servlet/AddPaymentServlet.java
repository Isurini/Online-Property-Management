package servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import services.PaymentServices;

@WebServlet("/AddPaymentServlet")
public class AddPaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String paymentName = request.getParameter("paymentName");
        String paymentDate = request.getParameter("paymentDate");
        String paymentTime = request.getParameter("paymentTime");
        double amount = Double.parseDouble(request.getParameter("amount"));
        String paymentMethod = request.getParameter("paymentMethod");

        boolean isAdded = PaymentServices.addPayment(paymentName, paymentDate, paymentTime, amount, paymentMethod);

        if (isAdded) {
            response.sendRedirect("ViewPaymentsServlet");
        } else {
            request.setAttribute("error", "Failed to add payment");
            RequestDispatcher dispatcher = request.getRequestDispatcher("AddPayments.jsp");
            dispatcher.forward(request, response);
        }
    }
}

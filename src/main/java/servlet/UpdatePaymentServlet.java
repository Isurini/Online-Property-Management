package servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.Payment;
import services.PaymentServices;

@WebServlet("/UpdatePaymentServlet")
public class UpdatePaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Handle GET request to load the update form with existing data
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String paymentID = request.getParameter("id"); // Assume URL has ?id=...
        Payment payment = PaymentServices.getPaymentById(paymentID);

        if (payment != null) {
            request.setAttribute("payment", payment);
            RequestDispatcher dispatcher = request.getRequestDispatcher("UpdatePayments.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect("ViewPaymentsServlet");
        }
    }

    // Handle POST request to perform the actual update
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String paymentID = request.getParameter("paymentID");
        String paymentName = request.getParameter("paymentName");
        String paymentDate = request.getParameter("paymentDate");
        String paymentTime = request.getParameter("paymentTime");
        double amount = Double.parseDouble(request.getParameter("amount"));
        String paymentMethod = request.getParameter("paymentMethod");

        boolean isUpdated = PaymentServices.updatePayment(paymentID, paymentName, paymentDate, paymentTime, amount, paymentMethod);

        if (isUpdated) {
            response.getWriter().println("<script>alert('Data Update Successful'); window.location.href='ViewPaymentsServlet';</script>");
        } else {
            request.setAttribute("error", "Update Failed");
            RequestDispatcher dispatcher = request.getRequestDispatcher("UpdatePayments.jsp");
            dispatcher.forward(request, response);
        }
    }
}

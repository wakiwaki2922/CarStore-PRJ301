/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.users.UserDTO;

/**
 *
 * @author Kyrov
 */
public class PreLoginController extends HttpServlet {

    private static final String ERROR = "login.html";
    private static final String QL = "manager.jsp";
    private static final String KH = "customer.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;

        // Kiểm tra xem có tồn tại LOGIN_USER không
        UserDTO loginUser = (UserDTO) request.getSession().getAttribute("LOGIN_USER");

        if (loginUser != null) {
            // Nếu LOGIN_USER tồn tại, kiểm tra role để chuyển hướng đúng trang
            String role = loginUser.getRoleID();
            if ("QL".equals(role)) {
                url = QL; // Nếu là quản lý (QL), chuyển hướng tới trang quản lý
            } else if ("KH".equals(role)) {
                url = KH; // Nếu là khách hàng (KH), chuyển hướng tới trang khách hàng
            }
        }

        // Chuyển hướng đến trang tương ứng
        response.sendRedirect(url);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

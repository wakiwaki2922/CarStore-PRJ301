package sample.controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.errors.ProductError;
import sample.products.ProductDAO;
import sample.products.ProductDTO;

public class AddProductController extends HttpServlet {

    private static final String ERROR = "addProduct.jsp";
    private static final String SUCCESS = "managerProduct.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        String url = ERROR;
        ProductDTO productAdd = new ProductDTO();
        ProductError productError = new ProductError();
        ProductDAO productDAO = new ProductDAO();
        boolean checkValidation = true;

        try {

            String nameProduct = request.getParameter("nameProduct");
            double price = Double.parseDouble(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            HttpSession session = request.getSession();
            HashMap<Integer, ProductDTO> listProduct = (HashMap<Integer, ProductDTO>) session.getAttribute("LIST_PRODUCT_FROM_MANAGER");

            // check validation input for update
            if (price <= 0) {
                checkValidation = false;
                productError.setPriceError("Price cannot be negative");
            }

            if (quantity <= 0) {
                checkValidation = false;
                productError.setQuantityError("Quantity cannot be negative");
            }

            if (!productDAO.checkDuplicateName(nameProduct)) {
                checkValidation = false;
                productError.setNameError("Product name is duplicated. Try another name");
            }
            if (checkValidation) {

                productAdd.setPrice(price);
                productAdd.setProductID();
                productAdd.setQuantity(quantity);
                productAdd.setProductName(nameProduct);

                boolean checkAddProduct = productDAO.addProductFromManager(productAdd);

                if (checkAddProduct) {

                    listProduct.put(productAdd.getProductID(), productAdd);
                    session.setAttribute("LIST_PRODUCT_FROM_MANAGER", listProduct);
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("ERROR_ADD", productError);
            }
        } catch (Exception e) {
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }

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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AddProductController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AddProductController.class.getName()).log(Level.SEVERE, null, ex);
        }
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

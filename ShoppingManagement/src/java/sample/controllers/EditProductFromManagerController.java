package sample.controllers;

import java.io.IOException;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.errors.ProductError;
import sample.products.ProductDAO;
import sample.products.ProductDTO;

public class EditProductFromManagerController extends HttpServlet {

    private static final String ERROR = "managerProduct.jsp";
    private static final String SUCCESS = "managerProduct.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String url = ERROR;
        ProductDAO productDAO = new ProductDAO();
        ProductError productError = new ProductError();
        boolean checkValidation = true;
        
        try {

            int productID = Integer.parseInt(request.getParameter("productID"));
            double price = Double.parseDouble(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String productName = (String) request.getParameter("productName");

            HttpSession session = request.getSession();
            HashMap<Integer, ProductDTO> listProduct = (HashMap<Integer, ProductDTO>) session.getAttribute("LIST_PRODUCT_FROM_MANAGER");

            // check validation input for update
            if (price < 0) {
                checkValidation = false;
                productError.setPriceError("Price cannot be negative");
            }

            if (quantity < 0) {
                checkValidation = false;
                productError.setQuantityError("Quantity cannot be negative");
            }

            if (checkValidation) {

                ProductDTO productUpdate = new ProductDTO(productID, productName, price, quantity);
                boolean checkUpdateProduct = productDAO.updateProductFromManager(productUpdate);

                if (checkUpdateProduct) {
                    if (listProduct.containsKey(productID)) {
                        listProduct.replace(productID, listProduct.get(productID), productUpdate);
                        session.setAttribute("LIST_PRODUCT_FROM_MANAGER", listProduct);
                        request.setAttribute("UPDATE_PRODUCT_SUCCESS", "Updating successfully");
                        url = SUCCESS;
                    }
                }
            } else {
                request.setAttribute("ERROR_UPDATE", productError);
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

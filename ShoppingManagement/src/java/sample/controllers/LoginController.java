package sample.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.users.UserDAO;
import sample.users.UserDTO;

public class LoginController extends HttpServlet {

    private static final String ERROR = "login.jsp";

    private static final String MANAGER_PAGE = "manager.jsp";
    private static final String CUSTOMER_PAGE = "customer.jsp";

    private static final String MANAGER = "QL";
    private static final String CUSTOMER = "KH";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String url = ERROR;

        try {
            // Get the current user from the session
            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");

            if (loginUser != null) {
                // User is already logged in, redirect to their respective page based on role
                String roleID = loginUser.getRoleID();
                if (MANAGER.equals(roleID)) {
                    url = MANAGER_PAGE;
                } else if (CUSTOMER.equals(roleID)) {
                    url = CUSTOMER_PAGE;
                } else {
                    request.setAttribute("ERROR", "Your role is not supported");
                }
            } else {
                // User is not logged in, check the form parameters for login
                String userName = request.getParameter("userName");
                String passWord = request.getParameter("passWord");

                UserDAO dao = new UserDAO();
                loginUser = dao.checkLogin(userName, passWord);

                if (loginUser != null) {
                    session.setAttribute("LOGIN_USER", loginUser);
                    String roleID = loginUser.getRoleID();
                    if (MANAGER.equals(roleID)) {
                        url = MANAGER_PAGE;
                    } else if (CUSTOMER.equals(roleID)) {
                        url = CUSTOMER_PAGE;
                    } else {
                        request.setAttribute("ERROR", "Your role is not supported");
                    }
                } else {
                    request.setAttribute("ERROR", "Incorrect username or password");
                }
            }
        } catch (Exception e) {
            log("Error at LoginController" + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

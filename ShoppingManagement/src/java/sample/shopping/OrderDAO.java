package sample.shopping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.utils.DbUtils;

public class OrderDAO {

    private static final String ADD_ORDER_TO_DATABASE = "INSERT INTO Orders(orderID,userID,total,dateOrderNew) VALUES (?,?,?,?) ";
    private static final String GET_MAX_ORDER_ID = "SELECT TOP 1 orderID FROM  Orders ORDER BY orderID DESC";
    private static final String GET_ORDER_LIST = "SELECT B.orderID,B.userID,A.name, B.total,B.dateOrderNew FROM Accounts A,Orders B WHERE A.userID = B.userID";

    public boolean addCartToDataBase(int cartID, int userID, double totalPrice, String orderDateTime) throws SQLException {

        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;

        try {

            conn = DbUtils.getConnection();

            String cartIDAdd = cartID + "";
            String userIDAdd = userID + "";
            String totalAdd = totalPrice + "";

            if (conn != null) {
                ptm = conn.prepareStatement(ADD_ORDER_TO_DATABASE);
                ptm.setString(1, cartIDAdd);
                ptm.setString(2, userIDAdd);
                ptm.setString(3, totalAdd);
                ptm.setString(4, orderDateTime);

                if (ptm.executeUpdate() > 0) {
                    check = true;
                }
            }

        } catch (Exception e) {
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return check;
    }

    public int autoIncreaseID() throws SQLException {
        int orderAutoIncrease = 0;

        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {

            conn = DbUtils.getConnection();
            ptm = conn.prepareStatement(GET_MAX_ORDER_ID);
            rs = ptm.executeQuery();
            if (rs.next()) {
                orderAutoIncrease = Integer.parseInt(rs.getString("orderID")) + 1;
            } else {
                orderAutoIncrease = 1;
            }

        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return orderAutoIncrease;
    }

    public List<OrderDisplayDTO> getOrderList() throws SQLException {
        List<OrderDisplayDTO> orderList = new ArrayList<OrderDisplayDTO>();

        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {

            conn = DbUtils.getConnection();

            ptm = conn.prepareStatement(GET_ORDER_LIST);
            rs = ptm.executeQuery();
            while (rs.next()) {
                String orderID = rs.getString("orderID");
                String userID = rs.getString("userID");
                String name = rs.getString("name");
                double total = Double.parseDouble(rs.getString("total"));
                String dateOrder = rs.getString("dateOrderNew");
                OrderDisplayDTO dto = new OrderDisplayDTO(orderID, userID, name, total, dateOrder);

                orderList.add(dto);

            }

        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return orderList;
    }

}

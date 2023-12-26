package sample.products;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import sample.utils.DbUtils;

    public class ProductDAO {

        private static final String UPDATE_PRODUCT_TODATABASE_FROM_SHOPPING = "UPDATE Products SET quantity = quantity - ? WHERE productID = ? ";
        private static final String GET_PRODUCT_LIST = "SELECT productID,productName,price,quantity FROM Products";
        private static final String UPDATE_PRODUCT_FROM_MANAGER = "UPDATE Products SET quantity = ?, price = ? WHERE productID = ? ";
        private static final String GET_MAX_PRODUCT_ID = "SELECT TOP 1  productID FROM Products  ORDER BY productID DESC";
        private static final String CHECK_DUPLIACTE_PRODUCT_NAME = "SELECT productName FROM Products WHERE productName = ?";
        private static final String ADD_PRODUCT = "INSERT INTO Products(productName,price,quantity) VALUES(?,?,?)";

        public boolean updateProductToDatabase(int productID, int quantity) throws SQLException {

            boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;

        try {

            String producIDUpdate = productID + "";
            String quantityUpdate = quantity + "";

            conn = DbUtils.getConnection();

            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_PRODUCT_TODATABASE_FROM_SHOPPING);
                ptm.setString(1, quantityUpdate);
                ptm.setString(2, producIDUpdate);

                if (ptm.executeUpdate() > 0) {  // debug ow day vi khong phan biet dc execute() vs executeUpdate()
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

    public HashMap<Integer, ProductDTO> getListProduct() throws SQLException {
        HashMap<Integer, ProductDTO> map = new HashMap<>();

        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {

            conn = DbUtils.getConnection();

            if (conn != null) {
                ptm = conn.prepareStatement(GET_PRODUCT_LIST);

                rs = ptm.executeQuery();
                while (rs.next()) {
                    int productID = rs.getInt("productID");
                    String productName = rs.getString("productName");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");

                    ProductDTO newProduct = new ProductDTO(productID, productName, price, quantity);
                    map.put(productID, newProduct);
                }

            }

        } catch (Exception e) {
            e.getStackTrace();
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
        return map;
    }

    public boolean updateProductFromManager(ProductDTO productUpdate) throws SQLException {

        boolean checkUpdateProductFromManager = false;

        Connection conn = null;
        PreparedStatement ptm = null;

        try {

            conn = DbUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_PRODUCT_FROM_MANAGER);
                ptm.setString(1, productUpdate.getQuantity() + "");
                ptm.setString(2, productUpdate.getPrice() + "");
                ptm.setString(3, productUpdate.getProductID() + "");

                checkUpdateProductFromManager = ptm.executeUpdate() > 0 ? true : false;
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

        return checkUpdateProductFromManager;
    }

    public int autoIncreaseProductID() throws SQLException {

        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int productID = 0;

        try {
            conn = DbUtils.getConnection();

            if (conn != null) {
                ptm = conn.prepareStatement(GET_MAX_PRODUCT_ID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    productID = Integer.parseInt(rs.getString("productID"));
                }
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
        return productID;
    }

    public boolean checkDuplicateName(String nameProduct) throws SQLException {

        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        boolean check = true;

        try {

            conn = DbUtils.getConnection();
            ptm = conn.prepareStatement(CHECK_DUPLIACTE_PRODUCT_NAME);
            ptm.setString(1, nameProduct);
            rs = ptm.executeQuery();
            check = rs.next() ? false : true;

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
        return check;
    }

    public boolean addProductFromManager(ProductDTO productUpdate) throws SQLException {

        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;

        try {

            conn = DbUtils.getConnection();
            ptm = conn.prepareStatement(ADD_PRODUCT);
            ptm.setString(1, productUpdate.getProductName());
            ptm.setString(2, productUpdate.getPrice() + "");
            ptm.setString(3, productUpdate.getQuantity() + "");
            check = ptm.executeUpdate() > 0 ? true : false;

        } catch (Exception e) {
        } finally {

            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }

            return check;

        }
    }
}

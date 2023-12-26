package sample.products;

import java.sql.SQLException;

public class ProductDTO {

    private int productID;
    private String productName;
    private double price;
    private int quantity;

    public ProductDTO() {
        this.productID = 0;
        this.productName = "";
        this.price = 0;
        this.quantity = 0;
    }

    public ProductDTO(int productID, String productName, double price, int quantity) {
        this.productID = productID;
        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
    }

    public int getProductID() throws SQLException {

        return this.productID;
    }

    public void setProductID() throws SQLException {
        ProductDAO productDao = new ProductDAO();

        this.productID = productDao.autoIncreaseProductID();

    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}

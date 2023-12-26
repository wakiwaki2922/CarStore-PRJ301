package sample.shopping;

public class OrderDisplayDTO {

    private String orderID;
    private String userID;
    private String name;
    private double total;
    private String dateOrder;

    public OrderDisplayDTO() {
        this.orderID = "";
        this.userID = "";
        this.name = "";
        this.total = 0;
        this.dateOrder = "";
    }

    public OrderDisplayDTO(String orderID, String userID, String name, double total, String dateOrder) {
        this.orderID = orderID;
        this.userID = userID;
        this.name = name;
        this.total = total;
        this.dateOrder = dateOrder;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getDateOrder() {
        return dateOrder;
    }

    public void setDateOrder(String dateOrder) {
        this.dateOrder = dateOrder;
    }

}

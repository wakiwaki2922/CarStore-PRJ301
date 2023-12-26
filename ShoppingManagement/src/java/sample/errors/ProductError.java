package sample.errors;

public class ProductError {

    private String nameError;
    private String priceError;
    private String quantityError;

    public ProductError() {
        this.nameError = "";
        this.priceError = "";
        this.quantityError = "";
    }

    public String getNameError() {
        return nameError;
    }

    public void setNameError(String nameError) {
        this.nameError = nameError;
    }

    public String getPriceError() {
        return priceError;
    }

    public void setPriceError(String priceError) {
        this.priceError = priceError;
    }

    public String getQuantityError() {
        return quantityError;
    }

    public void setQuantityError(String quantityError) {
        this.quantityError = quantityError;
    }

    public ProductError(String nameError, String priceError, String quantityError) {
        this.nameError = nameError;
        this.priceError = priceError;
        this.quantityError = quantityError;
    }

}

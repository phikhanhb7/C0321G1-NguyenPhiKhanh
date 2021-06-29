package models.bean;

public class CustomerType {
    private int CustomerTypeId ;
    private String CustomerTypeName;

    public CustomerType(int customerTypeId, String customerTypeName) {
        CustomerTypeId = customerTypeId;
        CustomerTypeName = customerTypeName;
    }

    public int getCustomerTypeId() {
        return CustomerTypeId;
    }

    public void setCustomerTypeId(int customerTypeId) {
        CustomerTypeId = customerTypeId;
    }

    public String getCustomerTypeName() {
        return CustomerTypeName;
    }

    public void setCustomerTypeName(String customerTypeName) {
        CustomerTypeName = customerTypeName;
    }
}

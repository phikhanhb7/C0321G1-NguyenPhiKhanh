package models.bean;

public class Product {
    private int id;
    private String name;
    private double price;
    private int quantity;
    private String color;
    private String discription;

    public Product(int id, String name, double price, int quantity, String color, String discription) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.color = color;
        this.discription = discription;
    }

    public Product(String name, double price, int quantity, String color, String discription) {
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.color = color;
        this.discription = discription;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getDiscription() {
        return discription;
    }

    public void setDiscription(String discription) {
        this.discription = discription;
    }
}

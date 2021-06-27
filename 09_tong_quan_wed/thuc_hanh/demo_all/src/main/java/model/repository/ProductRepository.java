package model.repository;

import model.bean.Category;
import model.bean.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository {
    BaseRepository baseRepository = new BaseRepository();

    public ProductRepository() {
    }
    private final String SELECT_ALL_PRODUCT = "select * from product;";
    private final String SELECT_ALL_CATAGORY = "select * from catagory;";
    private final String INSERT_INTO_PRODUCT = "insert into product(product_name,product_price,\n" +
            "product_quantity,product_color,product_desciption,catagory_id)\n" +
            "values(?,?,?,?,?,?);";
    private final String FIND_PRODUCT_BY_ID = "select * from product where product_id = ?;";
    private final String UPDATE_PRODUCT = "update product \n" +
            "set  product_name = ?,\n" +
            "product_price = ?,product_quantity = ?,\n" +
            "product_color = ?, product_desciption = ?,\n" +
            "catagory_id = ?\n" +
            "where product_id = ?;";
    private final String DELETE_PRODUCT = "delete from product\n" +
            "where product_id = ?;";
    private final String SEARCH_PRODUCT_BY_NAME = "select * from product where product_name like ?;";

    public List<Product> findAllProduct(){
        List<Product> productList = new ArrayList<>();
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCT);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("product_id");
                String name = resultSet.getString("product_name");
                double price = resultSet.getDouble("product_price");
                int quantity = resultSet.getInt("product_quantity");
                String color = resultSet.getString("product_color");
                String description = resultSet.getString("product_desciption");
                int idCategory = resultSet.getInt("catagory_id");
                Product product = new Product(id,name,price,quantity,color,description,idCategory);
                productList.add(product);
            }
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }
    public List<Category> findAllCategory(){
        List<Category> categoryList = new ArrayList<>();
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CATAGORY);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("catagory_id");
                String name = resultSet.getString("catagory_name");
                Category category = new Category(id,name);
                categoryList.add(category);
            }
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categoryList;
    }
    public boolean insertProduct(Product product){
        boolean rowInsert = false;
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_PRODUCT);
            preparedStatement.setString(1,product.getName());
            preparedStatement.setDouble(2,product.getPrice());
            preparedStatement.setInt(3,product.getQuantity());
            preparedStatement.setString(4,product.getColor());
            preparedStatement.setString(5,product.getDiscription());
            preparedStatement.setInt(6,product.getIdCategory());
            rowInsert = preparedStatement.executeUpdate()>0;
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  rowInsert;
    }
    public Product findProductById(int idProduct){
        Product product = null;
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_PRODUCT_BY_ID);
            preparedStatement.setInt(1,idProduct);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("product_id");
                String name = resultSet.getString("product_name");
                double price = resultSet.getDouble("product_price");
                int quantity = resultSet.getInt("product_quantity");
                String color = resultSet.getString("product_color");
                String description = resultSet.getString("product_desciption");
                int idCategory = resultSet.getInt("catagory_id");
                product = new Product(id,name,price,quantity,color,description,idCategory);

            }
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }
    public boolean updateProduct(int idProduct,Product product){
        boolean rowUpdate = false;
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PRODUCT);
            preparedStatement.setString(1,product.getName());
            preparedStatement.setDouble(2,product.getPrice());
            preparedStatement.setInt(3,product.getQuantity());
            preparedStatement.setString(4,product.getColor());
            preparedStatement.setString(5,product.getDiscription());
            preparedStatement.setInt(6,product.getIdCategory());
            preparedStatement.setInt(7,idProduct);
            rowUpdate = preparedStatement.executeUpdate()>0;
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  rowUpdate;
    }
    public boolean deleteProduct(int id){
        boolean rowDelete = false;
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PRODUCT);
            preparedStatement.setInt(1,id);
            rowDelete = preparedStatement.executeUpdate()>0;
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDelete;
    }
    public List<Product> findProductByName(String nameProduct){
        List<Product> productList = new ArrayList<>();
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_PRODUCT_BY_NAME);
            preparedStatement.setString(1,"%"+nameProduct+"%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("product_id");
                String name = resultSet.getString("product_name");
                double price = resultSet.getDouble("product_price");
                int quantity = resultSet.getInt("product_quantity");
                String color = resultSet.getString("product_color");
                String description = resultSet.getString("product_desciption");
                int idCategory = resultSet.getInt("catagory_id");
                Product product = new Product(id,name,price,quantity,color,description,idCategory);
                productList.add(product);
            }
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }

}
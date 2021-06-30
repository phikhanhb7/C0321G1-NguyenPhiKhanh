package models.repository.product;

import models.bean.Product;
import models.repository.DBConnection;
import models.repository.product.ProductRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepositoryImpl implements ProductRepository {

    @Override
    public List<Product> findAll() {
        List<Product> productList = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        if (connection != null){
            try {
                statement = connection.prepareStatement("select *from product");
                resultSet = statement.executeQuery();

                Product product = null ;
                while (resultSet.next()){
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name");
                    double price = resultSet.getDouble("price");
                    int quantity = resultSet.getInt("quantity");
                    String color = resultSet.getString("color");
                    String discription = resultSet.getString("discription");

                    product = new Product(id,name,price,quantity,color,discription);
                    productList.add(product);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }finally {
                try {
                    resultSet.close();
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }
        return productList ;
    }

    @Override
    public void save(Product product) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;

        if (connection!= null){
            try {
                statement= connection.prepareStatement("insert into product(name , price, quantity , color ,discription) " +
                        "values(?,?,?,?,?) ");
                statement.setString(1,product.getName());
                statement.setDouble(2,product.getPrice());
                statement.setInt(3,product.getQuantity());
                statement.setString(4,product.getColor());
                statement.setString(5,product.getDiscription());

                statement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }finally {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }




    }

    @Override
    public Product findById(int id) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null ;
        ResultSet resultSet = null ;
        Product product = null ;

        if (connection!= null){


            try {
                statement = connection.prepareStatement("select * from product where id = ?");
                statement.setInt(1,id);

                resultSet =  statement.executeQuery();

                while (resultSet.next()){
                    int idProduct = resultSet.getInt("id") ;
                    String name = resultSet.getString("name");
                    double price = resultSet.getDouble("price");
                    int quantity = resultSet.getInt("quantity");
                    String color = resultSet.getString("color");
                    String discription = resultSet.getString("discription");

                    product = new Product(idProduct,name,price,quantity,color,discription);

                }



            } catch (SQLException e) {
                e.printStackTrace();
            }finally {
                try {
                    resultSet.close();
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }

        }
        return product;

        }



    @Override
    public boolean remove(int id) {
        boolean rowRemove = false ;
        Connection connection = DBConnection.getConnection() ;
        PreparedStatement statement = null ;

        try {
            statement = connection.prepareStatement("delete from product where id = ?");
            statement.setInt(1,id);
            rowRemove = statement.executeUpdate() > 0 ;

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            DBConnection.close();
        }

        return rowRemove ;
    }

    @Override
    public boolean updateByID(int id, Product product) {
        boolean rowUpdate = false ;
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null ;


        try {
            statement = connection.prepareStatement("update product  set name = ? , price = ? , quantity = ? , " +
                    "color = ? , discription = ? where id = ? ");
            statement.setString(1,product.getName());
            statement.setDouble(2,product.getPrice());
            statement.setInt(3,product.getQuantity());
            statement.setString(4,product.getColor());
            statement.setString(5,product.getDiscription());
            statement.setInt(6,id);

            rowUpdate = statement.executeUpdate() >0 ;
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            DBConnection.close();
        }
        return rowUpdate;
    }

    @Override
    public List<Product> findByName(String name ) {
        List<Product> productList = new ArrayList<>();
       Connection connection = DBConnection.getConnection();

       PreparedStatement statement = null ;
       ResultSet resultSet = null ;
       Product product = null ;

        try {
            statement = connection.prepareStatement("select * from product where name like ?");
            statement.setString(1,"%"+name+"%");

            resultSet =  statement.executeQuery();

            while (resultSet.next()){
                int id = resultSet.getInt("id") ;
                String nameProduct = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                int quantity = resultSet.getInt("quantity");
                String color = resultSet.getString("color");
                String discription = resultSet.getString("discription");

                product = new Product(id,nameProduct,price,quantity,color,discription);
                productList.add(product);

            }



        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                resultSet.close();
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            DBConnection.close();
        }
        return productList;
    }
}

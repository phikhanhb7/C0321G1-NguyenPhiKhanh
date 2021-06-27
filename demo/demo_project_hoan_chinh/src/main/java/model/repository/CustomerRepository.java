package model.repository;

import model.bean.Customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository {

   BaseRepository baseRepository = new BaseRepository();
   public List<Customer> findAll () throws SQLException {
       Connection connection = baseRepository.connectDataBase();
       List<Customer> customerList = new ArrayList<>();
       PreparedStatement preparedStatement = connection.prepareStatement("select * from customer");
       ResultSet resultSet = preparedStatement.executeQuery();
       while (resultSet.next()){
           int id = resultSet.getInt("id");
           String name  = resultSet.getString("name");
           customerList.add(new Customer(id,name));
       }
       preparedStatement.close();
       connection.close();
       return customerList;
   }
}

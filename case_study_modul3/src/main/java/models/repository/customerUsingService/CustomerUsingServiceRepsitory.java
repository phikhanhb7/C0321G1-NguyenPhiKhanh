package models.repository.customerUsingService;


import models.bean.AttachUsingService;
import models.repository.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.bean.CustomerUsingService;

public class CustomerUsingServiceRepsitory implements ICustomerUsingServiceRepository {
    DBConnection baseRepository = new DBConnection();
    static final String SELECT_ALL_CUSTOMER_USING_SERVICE = "select * from view_customer;";
    static final String SELECT_ALL_ATTACH_SERVICE = "select * from view_contract_detail;";
    static final String SEARCH_BY_NAME = "select * from view_customer where customer_name like ?";
    static final String DELETE_BY_ID = "delete from view_customer where contract_id = ?";


    @Override
    public List<CustomerUsingService> findAll() {
        List<CustomerUsingService> customerUsingServiceList = new ArrayList<>();
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER_USING_SERVICE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int customerId = resultSet.getInt("customer_id");
                String customerName = resultSet.getString("customer_name");
                String customerPhone = resultSet.getString("customer_phone");
                int contractId = resultSet.getInt("contract_id");
                String contractStartDate = resultSet.getString("contract_start_date");
                String contractEndDate = resultSet.getString("contract_end_date");
                String serviceName = resultSet.getString("service_name");
                CustomerUsingService customerUsingService = new CustomerUsingService(customerId,customerName,
                        customerPhone,contractId,contractStartDate,contractEndDate,serviceName);
                customerUsingServiceList.add(customerUsingService);
            }
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerUsingServiceList;
    }


    public List<AttachUsingService> findAllAttachService(){
        List<AttachUsingService> attachUsingServiceList = new ArrayList<>();
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_ATTACH_SERVICE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int attachServiceId = resultSet.getInt("attach_service_id");
                String attachServiceName = resultSet.getString("attach_service_name");
                int contractId = resultSet.getInt("contract_id");
                int quantity = resultSet.getInt("quantity");
                AttachUsingService attachUsingService = new AttachUsingService(attachServiceId,attachServiceName,contractId,quantity);
                attachUsingServiceList.add(attachUsingService);
            }
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return attachUsingServiceList;
    }

    @Override
    public List<CustomerUsingService> searchByName(String name) {
        List<CustomerUsingService> customerUsingServiceList = new ArrayList<>();
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_BY_NAME);
            preparedStatement.setString(1,"%"+name+"%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int customerId = resultSet.getInt("customer_id");
                String customerName = resultSet.getString("customer_name");
                String customerPhone = resultSet.getString("customer_phone");
                int contractId = resultSet.getInt("contract_id");
                String contractStartDate = resultSet.getString("contract_start_date");
                String contractEndDate = resultSet.getString("contract_end_date");
                String serviceName = resultSet.getString("service_name");
                CustomerUsingService customerUsingService = new CustomerUsingService(customerId,customerName,
                        customerPhone,contractId,contractStartDate,contractEndDate,serviceName);
                customerUsingServiceList.add(customerUsingService);
            }
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerUsingServiceList;
    }

    @Override
    public boolean delete(int id) {
        boolean rowUpdate = false;
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_BY_ID);
            preparedStatement.setInt(1,id);
            rowUpdate = preparedStatement.executeUpdate()>0;
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdate;
    }

}

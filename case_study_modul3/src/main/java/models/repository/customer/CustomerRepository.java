package models.repository.customer;

import models.bean.Customer;
import models.bean.CustomerType;
import models.repository.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository{
    private static final String FIND_BY_ID = "select * from customer where customer_id = ?;";
    private static final String SELECT_ALL_CUSTOMER = "SELECT * FROM customer;";
    private static final String SELECT_ALL_TYPE_CUSTOMER = "SELECT * FROM customer_type;";
    private static final String INSERT_INTO_CUSTOMER = "insert into  customer " +
            "( customer_code," +
            "customer_name," +
            "customer_birthday," +
            "customer_gender," +
            "customer_id_card," +
            "customer_phone," +
            "customer_email," +
            "customer_address," +
            "customer_type_id )\n" +
            "values(?,?,?,?,?,?,?,?,?)";
    private static final String DELETE_CUSTOMER_BY_ID = "delete from customer where customer_id = ?;";
    private static final String UPDATE_CUSTOMER_BY_ID = "update customer\n" +
            "            set customer_code = ?,\n" +
            "            customer_name = ?,\n" +
            "            customer_birthday = ?,\n" +
            "            customer_gender = ?,\n" +
            "            customer_id_card = ?,\n" +
            "            customer_phone = ?,\n" +
            "            customer_email = ?,\n" +
            "            customer_address = ?,\n" +
            "            customer_type_id = ? \n" +
            "\twhere customer_id = ? ;";
    private static final String SEARCH_BY_NAME = "select * from customer where customer_name like ?"
            ;
    private static final String SELECT_BY_CODE = "select * from customer where customer_code = ?;";


    @Override
    public List<Customer> findAll() {
        Connection connection = DBConnection.getConnection();
        List<Customer> customerList = new ArrayList<>();
        PreparedStatement statement = null ;
        ResultSet resultSet = null ;

        if (connection != null){
            try {
                statement = connection.prepareStatement(SELECT_ALL_CUSTOMER);
                resultSet = statement.executeQuery();
                Customer customer = null ;

                while (resultSet.next()){
                    int idCustomer = resultSet.getInt("customer_id");
                    String customerCode = resultSet.getString("customer_code");
                    String name = resultSet.getString("customer_name");
                    String dateOfBirth = resultSet.getString("customer_birthday");
                    int sex = resultSet.getInt("customer_gender");
                    String idCard = resultSet.getString("customer_id_card");
                    String phoneNumber = resultSet.getNString("customer_phone");
                    String email = resultSet.getNString("customer_email");
                    String address = resultSet.getNString("customer_address");
                    int idTypeCustomer = resultSet.getInt("customer_type_id");

                    customer = new Customer(idCustomer,customerCode,name,dateOfBirth,sex,idCard,phoneNumber,email,
                            address,idTypeCustomer);
                    customerList.add(customer);
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
        return customerList;
    }

    @Override
    public void save(Customer customer) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
//        customer_code,customer_name,customer_birthday,customer_gender," +
//        "customer_id_card,customer_phone,customer_email,customer_address,customer_type_id

        if (connection!= null) {
            try {
                statement = connection.prepareStatement(INSERT_INTO_CUSTOMER);
                statement.setString(1, customer.getCustomerCode());
                statement.setString(2, customer.getCustomerName());
                statement.setString(3, customer.getCustomerBirthday());
                statement.setInt(4, customer.getCustomerGender());
                statement.setString(5,customer.getCustomerIdCard());
                statement.setString(6,customer.getCustomerPhone());
                statement.setString(7,customer.getCustomerEmail());
                statement.setString(8,customer.getCustomerAddress());
                statement.setInt(9,customer.getCustomerTypeId());


                statement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }

    }

    public Customer findById(int id) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null ;
        ResultSet resultSet = null ;
        Customer customer = null ;

        if (connection!= null){
            try {
                statement = connection.prepareStatement(FIND_BY_ID);
                statement.setInt(1,id);
                resultSet =  statement.executeQuery();
                while (resultSet.next()){
                    int idCustomer = resultSet.getInt("customer_id");
                    String customerCode = resultSet.getString("customer_code");
                    String name = resultSet.getString("customer_name");
                    String dateOfBirth = resultSet.getString("customer_birthday");
                    int sex = resultSet.getInt("customer_gender");
                    String idCard = resultSet.getString("customer_id_card");
                    String phoneNumber = resultSet.getNString("customer_phone");
                    String email = resultSet.getNString("customer_email");
                    String address = resultSet.getNString("customer_address");
                    int idTypeCustomer = resultSet.getInt("customer_type_id");

                    customer = new Customer(idCustomer,customerCode,name,dateOfBirth,sex,idCard,phoneNumber,email,
                            address,idTypeCustomer);

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
        return customer;
    }

    @Override
    public boolean remove(int id) {
        boolean rowRemove = false ;
        Connection connection = DBConnection.getConnection() ;
        PreparedStatement statement = null ;

        try {
            statement = connection.prepareStatement(DELETE_CUSTOMER_BY_ID);
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
    public boolean updateByID(int id, Customer customer) {
        boolean rowUpdate = false ;
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null ;


        try {
            statement = connection.prepareStatement(UPDATE_CUSTOMER_BY_ID);
            statement.setString(1, customer.getCustomerCode());
            statement.setString(2, customer.getCustomerName());
            statement.setString(3, customer.getCustomerBirthday());
            statement.setInt(4, customer.getCustomerGender());
            statement.setString(5,customer.getCustomerIdCard());
            statement.setString(6,customer.getCustomerPhone());
            statement.setString(7,customer.getCustomerEmail());
            statement.setString(8,customer.getCustomerAddress());
            statement.setInt(9,customer.getCustomerTypeId());

            statement.setInt(10,customer.getCustomerId());

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
    public List<Customer> search(String name) {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = DBConnection.getConnection();

        PreparedStatement statement = null ;
        ResultSet resultSet = null ;
        Customer customer = null ;

        try {
            statement = connection.prepareStatement(SEARCH_BY_NAME);
            statement.setString(1,"%"+name+"%");

            resultSet =  statement.executeQuery();

            while (resultSet.next()){
                int idCustomer = resultSet.getInt("customer_id");
                String customerCode = resultSet.getString("customer_code");
                String customerName = resultSet.getString("customer_name");
                String dateOfBirth = resultSet.getString("customer_birthday");
                int sex = resultSet.getInt("customer_gender");
                String idCard = resultSet.getString("customer_id_card");
                String phoneNumber = resultSet.getNString("customer_phone");
                String email = resultSet.getNString("customer_email");
                String address = resultSet.getNString("customer_address");
                int customerTypeId = resultSet.getInt("customer_type_id");

                customer = new Customer(idCustomer,customerCode,customerName,dateOfBirth,sex,idCard,phoneNumber,email,
                        address,customerTypeId);
                customerList.add(customer);
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
        return customerList;
    }

    @Override
    public List<CustomerType> findAllCustomerType() {
        Connection connection = DBConnection.getConnection();
        List<CustomerType> customerTypeList = new ArrayList<>();
        PreparedStatement statement = null ;
        ResultSet resultSet = null ;

        if (connection != null){
            try {
                statement = connection.prepareStatement(SELECT_ALL_TYPE_CUSTOMER);
                resultSet = statement.executeQuery();
                CustomerType customerType = null ;

                while (resultSet.next()){
                    int customerTypeId = resultSet.getInt(1);
                    String customerTypeName = resultSet.getString("customer_type_name");

                    customerType = new CustomerType(customerTypeId,customerTypeName);
                    customerTypeList.add(customerType);
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
        return customerTypeList;

    }


}

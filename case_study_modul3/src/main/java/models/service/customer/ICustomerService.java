package models.service.customer;

import models.bean.Customer;
import models.bean.CustomerType;

import java.util.List;

public interface ICustomerService {
    List<Customer> findAll();

    void save(Customer customer);

    Customer findById(int id );

    boolean remove(int id);

    boolean updateByID(int id, Customer customer);

    List<Customer> search(String name) ;

    List<CustomerType> findAllCustomerType();
}

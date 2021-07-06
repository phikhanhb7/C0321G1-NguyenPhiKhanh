package models.repository.customer;

import models.bean.Customer;
import models.bean.CustomerType;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> findAll();

    void save(Customer customer);

    Customer findById(int id );

    boolean remove(int id);

    boolean updateByID(int id, Customer customer);

    List<Customer> search(String name) ;

    List<CustomerType> findAllCustomerType();

    Customer findByCode(String customerCode);

}

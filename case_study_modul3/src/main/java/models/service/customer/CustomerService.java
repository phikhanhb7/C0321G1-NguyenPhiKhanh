package models.service.customer;

import models.bean.Customer;
import models.bean.CustomerType;
import models.repository.customer.CustomerRepository;
import models.repository.customer.ICustomerRepository;

import java.util.List;

public class CustomerService implements ICustomerService {

    ICustomerRepository customerRepository = new CustomerRepository();
    @Override
    public List<Customer> findAll() {
        return customerRepository.findAll();
    }

    @Override
    public void save(Customer customer) {
        customerRepository.save(customer);
    }

    @Override
    public Customer findById(int id) {
        return customerRepository.findById(id);
    }

    @Override
    public boolean remove(int id) {
        return customerRepository.remove(id);
    }

    @Override
    public boolean updateByID(int id, Customer customer) {
        return customerRepository.updateByID(id,customer);
    }

    @Override
    public List<Customer> search(String name) {
        return customerRepository.search(name);
    }

    @Override
    public List<CustomerType> findAllCustomerType() {
        return customerRepository.findAllCustomerType();
    }
}

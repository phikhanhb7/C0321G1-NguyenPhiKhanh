package models.service.customer;

import models.bean.Customer;
import models.bean.CustomerType;
import models.common.Validate;
import models.repository.customer.CustomerRepository;
import models.repository.customer.ICustomerRepository;

import java.util.ArrayList;
import java.util.List;

public class CustomerService implements ICustomerService {

    ICustomerRepository customerRepository = new CustomerRepository();
    @Override
    public List<Customer> findAll() {
        return customerRepository.findAll();
    }

    @Override
    public List<String> save(Customer customer) {
       List<String> errList = new ArrayList<>();
//           <%--                String customerCode, String customerName, String customerBirthday,
//           int customerGender,--%>
//                <%--                String customerIdCard, String customerPhone, String customerEmail,
//                String customerAddress,--%>
//                <%--                int customerTypeId--%>
       errList.add(Validate.checkCustomerCode(customer.getCustomerCode()));
       errList.add(Validate.checkName(customer.getCustomerName()));
       errList.add(Validate.checkDay(customer.getCustomerBirthday()));
       errList.add(Validate.checkIdCard(customer.getCustomerIdCard()));
       errList.add(Validate.checkPhoneNumber(customer.getCustomerPhone()));
       errList.add(Validate.checkEmail(customer.getCustomerEmail()));
       errList.add(Validate.checkName(customer.getCustomerAddress()));

       int checkFull = 0 ;
       for (String item : errList){
           if (item.equals("")){
               checkFull++ ;
           }
       }
       if (checkFull == 7 ){
           customerRepository.save(customer);
       }
      return errList ;

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

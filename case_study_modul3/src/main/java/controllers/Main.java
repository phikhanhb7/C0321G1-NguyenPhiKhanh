package controllers;

import models.service.contract.ContractService;
import models.service.contract.IContractService;
import models.service.customer.CustomerService;
import models.service.customer.ICustomerService;
import models.service.employee.EmployeeService;
import models.service.employee.IEmployeeService;
import models.service.service.IServiceService;
import models.service.service.ServiceService;

public class Main {
    public static void main(String[] args) {
        IContractService contractService = new ContractService() ;
        ICustomerService customerService = new CustomerService() ;
        IServiceService serviceService = new ServiceService() ;
        IEmployeeService employeeService = new EmployeeService();
        System.out.println(serviceService.findAllService().size());
        System.out.println(employeeService.findAllEmployee().size());

    }

}

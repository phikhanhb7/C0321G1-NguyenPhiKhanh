package models.service.customerUsingService;

import models.bean.AttachService;
import models.bean.AttachUsingService;
import models.bean.CustomerUsingService;
import models.repository.customerUsingService.CustomerUsingServiceRepsitory;
import models.repository.customerUsingService.ICustomerUsingServiceRepository;

import java.util.List;

public class CustomerUsingServiceImpl implements ICustomerUsingService{

    ICustomerUsingServiceRepository repository = new CustomerUsingServiceRepsitory();
    @Override
    public List<CustomerUsingService> findAll() {
        return repository.findAll();
    }

    @Override
    public List<AttachUsingService> findAllAttachService() {
        return repository.findAllAttachService();
    }


    @Override
    public List<CustomerUsingService> searchByName(String name) {
        return repository.searchByName(name);
    }

    @Override
    public boolean delete(int id) {
        return repository.delete(id);
    }
}

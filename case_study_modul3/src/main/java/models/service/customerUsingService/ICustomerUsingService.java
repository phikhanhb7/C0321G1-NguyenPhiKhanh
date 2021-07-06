package models.service.customerUsingService;

import models.bean.AttachService;
import models.bean.AttachUsingService;
import models.bean.CustomerUsingService;

import java.util.List;

public interface ICustomerUsingService {
    List<CustomerUsingService> findAll();
    List<AttachUsingService> findAllAttachService();
    List<CustomerUsingService> searchByName(String name);
    boolean delete(int id);
}

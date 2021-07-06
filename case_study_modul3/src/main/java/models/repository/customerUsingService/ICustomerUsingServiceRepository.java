package models.repository.customerUsingService;


import models.bean.AttachUsingService;
import models.bean.CustomerUsingService;

import java.util.List;

public interface ICustomerUsingServiceRepository {
    List<CustomerUsingService> findAll();
    List<AttachUsingService> findAllAttachService();
    List<CustomerUsingService> searchByName(String name);

    boolean delete(int id);
}

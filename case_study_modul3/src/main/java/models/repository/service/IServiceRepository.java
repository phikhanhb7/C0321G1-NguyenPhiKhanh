package models.repository.service;

import models.bean.Customer;
import models.bean.RentType;
import models.bean.Service;
import models.bean.ServiceType;

import java.util.List;

public interface IServiceRepository {
    List<Service> findAllService();
    void save(Service service);

    Service findById(int id );

    boolean remove(int id);

    List<ServiceType> findServiceType();

    List<RentType> findRentType();
}

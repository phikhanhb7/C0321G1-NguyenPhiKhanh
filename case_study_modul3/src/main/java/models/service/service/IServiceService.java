package models.service.service;

import models.bean.*;

import java.util.List;

public interface IServiceService {
    List<Service> findAllService();
    void save(Service service);

    Service findById(int id );

    boolean remove(int id);

    List<ServiceType> findServiceType();

    List<RentType> findRentType();
}

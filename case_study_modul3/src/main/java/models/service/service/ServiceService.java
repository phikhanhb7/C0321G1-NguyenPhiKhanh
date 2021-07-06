package models.service.service;

import models.bean.*;
import models.repository.service.IServiceRepository;
import models.repository.service.ServiceRepository;

import java.util.List;

public class ServiceService implements IServiceService {
    IServiceRepository repository = new ServiceRepository();

    @Override
    public List<Service> findAllService() {
        return repository.findAllService();
    }

    @Override
    public void save(Service service) {
        repository.save(service);
    }

    @Override
    public Service findById(int id) {
        return repository.findById(id);
    }

    @Override
    public boolean remove(int id) {
        return repository.remove(id);
    }

    @Override
    public List<ServiceType> findServiceType() {
        return repository.findServiceType();
    }

    @Override
    public List<RentType> findRentType() {
        return repository.findRentType();
    }
}

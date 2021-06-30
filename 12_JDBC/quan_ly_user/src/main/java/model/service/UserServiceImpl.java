package model.service;

import model.bean.User;
import model.repository.IUserRepository;
import model.repository.UserRepositoryImpl;

import java.util.List;

public class UserServiceImpl implements IUserService{
    IUserRepository repository = new UserRepositoryImpl() ;

    @Override
    public List<User> findAll() {
        return repository.findAll();
    }

    @Override
    public void save(User user) {
        repository.save(user);
    }

    @Override
    public User findById(int id) {
        return repository.findById(id);
    }

    @Override
    public boolean remove(int id) {
        return repository.remove(id);
    }

    @Override
    public boolean updateByID(int id, User user) {
        return repository.updateByID(id,user);
    }

    @Override
    public List<User> findByCountry(String name) {
        return repository.findByCountry(name);
    }

    @Override
    public List<User> sortByName() {
        return repository.sortByName();
    }
}

package model.repository;

import model.bean.User;

import java.util.List;

public interface IUserRepository {
    List<User> findAll();

    void save(User user);

    User findById(int id );

    boolean remove(int id);

    boolean updateByID(int id, User user);

    List<User> findByCountry(String name) ;

    List<User>  sortByName() ;
}

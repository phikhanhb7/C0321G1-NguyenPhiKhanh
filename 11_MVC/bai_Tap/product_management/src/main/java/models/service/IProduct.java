package models.service;

import models.bean.Product;

import java.util.List;

public interface IProduct {
    List<Product> findAll();

    void save(Product product);


    Product findById(int id);

    boolean updateByID(int id, Product product);


    boolean remove(int id);

    List<Product> findByName(String name);
}

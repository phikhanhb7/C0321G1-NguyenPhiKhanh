package models.repository.product;

import models.bean.Product;

import java.util.List;

public interface ProductRepository {
    List<Product> findAll();

    void save(Product product);

    Product findById(int id );

    boolean remove(int id);

    boolean updateByID(int id, Product product);

    List<Product> findByName(String name) ;
}

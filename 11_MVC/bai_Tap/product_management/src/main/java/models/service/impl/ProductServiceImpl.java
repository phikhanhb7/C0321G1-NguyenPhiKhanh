package models.service.impl;

import models.bean.Product;
import models.repository.product.ProductRepository;
import models.repository.product.ProductRepositoryImpl;
import models.service.IProduct;

import java.util.*;

public class ProductServiceImpl implements IProduct {

    ProductRepository repository = new ProductRepositoryImpl() ;

    @Override
    public List<Product> findAll() {
        return repository.findAll();
    }

    @Override
    public void save(Product product) {
        repository.save(product);
    }

    @Override
    public Product findById(int id) {
        return repository.findById(id);
    }

    @Override
    public boolean updateByID(int id, Product product) {
        return repository.updateByID(id,product);
    }


    @Override
    public boolean remove(int id) {
      return   repository.remove(id);
    }

    @Override
    public List<Product> findByName(String name) {
        return repository.findByName(name);
    }
}

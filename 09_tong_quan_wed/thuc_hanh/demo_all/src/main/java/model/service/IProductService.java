package model.service;

import model.bean.Category;
import model.bean.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAllProduct();
    List<Category> findAllCategory();
    boolean insertProduct(Product product);
    Product findById(int id);
    boolean updateProduct(int id,Product product);
    boolean deleteProduct(int id);
    List<Product> searchByName(String name);
}
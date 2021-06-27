package model.service.impl;

import model.bean.Category;
import model.bean.Product;
import model.repository.ProductRepository;
import model.service.IProductService;

import java.util.List;

public class ProductServiceImpl implements IProductService {
    ProductRepository productRepository = new ProductRepository();
    @Override
    public List<Product> findAllProduct() {
        return productRepository.findAllProduct();
    }

    @Override
    public List<Category> findAllCategory() {
        return productRepository.findAllCategory();
    }

    @Override
    public boolean insertProduct(Product product) {
        return productRepository.insertProduct(product);
    }

    @Override
    public Product findById(int id) {
        return productRepository.findProductById(id);
    }

    @Override
    public boolean updateProduct(int id, Product product) {
        return productRepository.updateProduct(id,product);
    }

    @Override
    public boolean deleteProduct(int id) {
        return productRepository.deleteProduct(id);
    }

    @Override
    public List<Product> searchByName(String name) {
        return productRepository.findProductByName(name);
    }
}
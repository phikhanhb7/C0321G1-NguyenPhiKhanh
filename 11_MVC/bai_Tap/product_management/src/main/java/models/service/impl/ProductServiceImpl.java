package models.service.impl;

import models.bean.Product;
import models.service.IProduct;

import java.util.*;

public class ProductServiceImpl implements IProduct {
 private static Map<Integer,Product> productMap;

 static {
     productMap = new HashMap<>();
     productMap.put(1,new Product(1,"Iphone 5",3000,10,"Yellow","100%"));
     productMap.put(2,new Product(2,"Iphone 6",4000,11,"Black","99%"));
     productMap.put(3,new Product(3,"Iphone 7",5000,12,"While","98%"));
 }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(productMap.values());
    }

    @Override
    public void save(Product product) {
        productMap.put(product.getId(), product);
    }

    @Override
    public Product findById(int id) {
        return productMap.get(id);
    }

    @Override
    public void update(int id, Product product) {
        productMap.put(id, product);
    }

    @Override
    public void remove(int id) {
        productMap.remove(id);
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> productList = new ArrayList<>();
        for( Product item : productMap.values()){
           if( item.getName().contains(name)){
               productList.add(item);
           }
        }
        return productList;
    }
}

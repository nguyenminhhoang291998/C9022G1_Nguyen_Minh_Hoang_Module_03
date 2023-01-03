package service;

import model.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();

    boolean save(Product product);

    List<Product> findByName(String name);

    boolean update(int id, Product product);

    boolean remove(int id);
}

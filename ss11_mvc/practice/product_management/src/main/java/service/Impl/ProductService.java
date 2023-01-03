package service.Impl;

import model.Product;
import repository.IProductRepository;
import repository.Impl.ProductRepository;
import service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    private IProductRepository productRepository = new ProductRepository();
    @Override
    public List<Product> findAll() {
        return this.productRepository.findAll();
    }

    @Override
    public boolean save(Product product) {
        return this.productRepository.save(product);
    }

    @Override
    public List<Product> findByName(String name) {
        return this.productRepository.findByName(name);
    }

    @Override
    public boolean update(int id, Product product) {
        return this.productRepository.update(id,product);
    }

    @Override
    public boolean remove(int id) {
        return this.productRepository.remove(id);
    }
}

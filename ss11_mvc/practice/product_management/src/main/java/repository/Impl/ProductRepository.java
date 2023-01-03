package repository.Impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepository implements IProductRepository {
    private static Map<Integer,Product> productList = new HashMap<>();

    static {
        productList.put(1,new Product(1,"Iphone X",500,"Two eyes","Apple"));
        productList.put(2,new Product(2,"Iphone 11",700,"Three eyes","Apple"));
        productList.put(3,new Product(3,"Xiaomi 8",500,"Two eyes","Xiaomi"));
        productList.put(4,new Product(4,"Galaxy S22 ",800,"Three eyes","SamSung"));
        productList.put(5,new Product(5,"Xiaomi 12",700,"Three eyes","Xiaomi"));
    }


    @Override
    public List<Product> findAll() {
        return new ArrayList<>(productList.values());
    }

    @Override
    public boolean save(Product product) {
        if(productList.containsKey(product.getId())) {
            return false;
        }
        productList.put(product.getId(),product);
        return true;
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> products = new ArrayList<>();
        for (Product product: productList.values()) {
            if(product.getName().equals(name)){
                products.add(product);
            }
        }
        return products;
    }

    @Override
    public boolean update(int id, Product product) {
       if(productList.containsKey(id)){
           productList.put(id,product);
           return true;
       }
       return false;
    }

    @Override
    public boolean remove(int id) {
        if(productList.containsKey(id)){
            productList.remove(id);
            return true;
        }
        return false;
    }
}

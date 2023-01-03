package controller;

import model.Product;
import service.IProductService;
import service.Impl.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/product")
public class ProductServlet extends HttpServlet {
    private IProductService productService = new ProductService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createProduct(request,response);
                break;
            case "update":
                updateProduct(request,response);
                break;
            case "remove":
                removeProduct(request,response);
                break;
            case "detail":
                detailProduct(request,response);
                break;
            default:
                showListProduct(request, response);
        }
    }

    private void detailProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        for (Product product: productService.findAll()) {
            if(product.getId()==id){
                request.setAttribute("product",product);
                break;
            }
        }
        try {
            request.getRequestDispatcher("/view/detail.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void removeProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        for (Product product: productService.findAll()) {
            if(product.getId()==id){
                request.setAttribute("product",product);
                break;
            }
        }
        try {
            request.getRequestDispatcher("/view/remove.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        for (Product product: productService.findAll()) {
            if(product.getId()==id){
                request.setAttribute("product",product);
                break;
            }
        }
        try {
            request.getRequestDispatcher("/view/update.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("/view/create.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showListProduct(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("productList",  productService.findAll());
        try {
            request.getRequestDispatcher("/view/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                addProduct(request,response);
                break;
            case "update":
                editProduct(request,response);
                break;
            case "remove":
                deleteProduct(request,response);
                break;
            case "find":
                findProduct(request,response);
                break;
            default:
        }
    }

    private void findProduct(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        List<Product> products = this.productService.findByName(name);
        String mess = "Find by name successful!";
        if(products.isEmpty()){
            mess = "Not found product!";
        }
        request.setAttribute("mess",mess);
        request.setAttribute("productList", products);
        try {
            request.getRequestDispatcher("/view/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String mess = "Delete successful!";
        boolean check = productService.remove(id);
        if(!check){
            mess = "Delete not successful!";
        }
        request.setAttribute("mess",mess);
        showListProduct(request,response);
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String producer = request.getParameter("producer");
        String mess = "Edit successful!";
        boolean check = productService.update(id,new Product(id,name,price,description,producer));
        if(!check){
            mess = "Edit not successful!";
        }
        request.setAttribute("mess",mess);
        showListProduct(request,response);
    }

    private void addProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String producer = request.getParameter("producer");
        String mess = "Add successful!";
        boolean check = productService.save(new Product(id,name,price,description,producer));
        if(!check){
            mess = "Add not successful!";
        }
        request.setAttribute("mess",mess);
        showListProduct(request,response);
    }
}

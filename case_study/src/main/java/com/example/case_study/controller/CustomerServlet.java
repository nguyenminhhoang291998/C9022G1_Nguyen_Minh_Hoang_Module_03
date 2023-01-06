package com.example.case_study.controller;

import com.example.case_study.models.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.*;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private static final Map<Integer, Customer> customers = new HashMap<>();

    static {
        customers.put(1, new Customer(1, 1, "Nguyễn Văn Nam", "1997/02/05", true, "09432123123", "0905987787", "nam97@gmail.com", "Hà Nội"));
        customers.put(2, new Customer(2, 2, "Nguyễn Thị Tâm", "1992/11/09", false, "98965445412", "0998654564", "tamnguyen@gmail.com", "Nam Định"));
        customers.put(3, new Customer(3, 2, "Trần Chính", "1993/11/12", true, "02439876781", "0909888767", "chinhtran@gmail.com", "Bình Phước"));
        customers.put(4, new Customer(4, 1, "Trần Công Thanh", "1987/09/05", true, "2016787098", "0908034341", "congthanh@gmail.com", "Quảng Nam"));
        customers.put(5, new Customer(5, 1, "Nguyễn Đức", "1987/03/07", true, "1214543987", "0901232323", "duc87@gmail.com", "Hà Tĩnh"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
//            case "add":
//                addCustomer(request, response);
//                break;
//            case "delete":
//                deleteCustomer(request, response);
//                break;
//            case "edit":
//                editCustomer(request, response);
//                break;
            default:
                showListCustomer(request, response);
                break;
        }
    }

    private void showListCustomer(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("customerList", customers.values());
        try {
            request.getRequestDispatcher("view/customer/customer.jsp").forward(request, response);
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
            case "add":
                addCustomer(request, response);
                break;
            case "delete":
                deleteCustomer(request, response);
                break;
            case "edit":
                editCustomer(request, response);
                break;

        }


    }

    private void editCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("editId"));
        int customerTypeId = Integer.parseInt(request.getParameter("editCustomerTypeId"));
        String name = request.getParameter("editName");
        String dayOfBirth = request.getParameter("editDayOfBirth");
        boolean gender = false;
        String editGender = request.getParameter("editGender");
        if(Objects.equals(editGender, "male")){
            gender = true;
        }
        String idCard = request.getParameter("editIdCard");
        String phoneNumber = request.getParameter("editPhoneNumber");
        String email = request.getParameter("editEmail");
        String address = request.getParameter("editAddress");
        if (!customers.containsKey(id)) {
            request.setAttribute("message", "Edit failed because id already not exists!");
        } else {
            customers.put(id, new Customer(id, customerTypeId, name, dayOfBirth, gender, idCard, phoneNumber, email, address));
            request.setAttribute("message", "Edit successful!");
        }
        showListCustomer(request, response);
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("deleteId"));
        customers.remove(id);
        request.setAttribute("message", "Delete successful!");
        showListCustomer(request, response);
    }

    private void addCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("newId"));
        int customerTypeId = Integer.parseInt(request.getParameter("newCustomerTypeId"));
        String name = request.getParameter("newName");
        String dayOfBirth = request.getParameter("newDayOfBirth");
        boolean gender = false;
        String newGender = request.getParameter("newGender");
        if(Objects.equals(newGender, "male")){
            gender = true;
        }
        String idCard = request.getParameter("newIdCard");
        String phoneNumber = request.getParameter("newPhoneNumber");
        String email = request.getParameter("newEmail");
        String address = request.getParameter("newAddress");
        if (customers.containsKey(id)) {
            request.setAttribute("message", "Add failed because id already exists!");
        } else {
            customers.put(id, new Customer(id, customerTypeId, name, dayOfBirth, gender, idCard, phoneNumber, email, address));
            request.setAttribute("message", "Add successful!");
        }
        showListCustomer(request, response);
    }
}

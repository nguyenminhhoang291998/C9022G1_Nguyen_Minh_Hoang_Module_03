package com.example.case_study.controller;

import com.example.case_study.models.Customer;
import com.example.case_study.services.customer.ICustomerService;
import com.example.case_study.services.customer.impl.CustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.*;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    ICustomerService customerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            default:
                showListCustomer(request, response);
                break;
        }
    }

    private void showListCustomer(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("customerList", customerService.findAllCustomerList());
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
        if (Objects.equals(editGender, "male")) {
            gender = true;
        }
        String idCard = request.getParameter("editIdCard");
        String phoneNumber = request.getParameter("editPhoneNumber");
        String email = request.getParameter("editEmail");
        String address = request.getParameter("editAddress");
        if(customerService.findCustomer(id)!=null){
            boolean check = customerService.editCustomer(new Customer(id, customerTypeId, name, dayOfBirth, gender, idCard, phoneNumber, email, address));
            if (!check) {
                request.setAttribute("message", "Edit failed!");
            } else {
                request.setAttribute("message", "Edit successful!");
            }
        }else {
            request.setAttribute("message", "Edit failed because id already not exists!");
        }
        showListCustomer(request, response);
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("deleteId"));
        boolean check = customerService.deleteCustomer(id);
        if (!check) {
            request.setAttribute("message", "Delete failed!");
        } else {
            request.setAttribute("message", "Delete successful!");
        }
        showListCustomer(request, response);
    }

    private void addCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("newId"));
        int customerTypeId = Integer.parseInt(request.getParameter("newCustomerTypeId"));
        String name = request.getParameter("newName");
        String dayOfBirth = request.getParameter("newDayOfBirth");
        boolean gender = false;
        String newGender = request.getParameter("newGender");
        if (Objects.equals(newGender, "male")) {
            gender = true;
        }
        String idCard = request.getParameter("newIdCard");
        String phoneNumber = request.getParameter("newPhoneNumber");
        String email = request.getParameter("newEmail");
        String address = request.getParameter("newAddress");
        if(customerService.findCustomer(id) == null){
            boolean check = customerService.addCustomer(new Customer(id, customerTypeId, name, dayOfBirth, gender, idCard, phoneNumber, email, address));
            if (!check) {
                request.setAttribute("message", "Add failed!");
            } else {
                request.setAttribute("message", "Add successful!");
            }
        }else {
            request.setAttribute("message", "Add failed because id already exists!");
        }

        showListCustomer(request, response);
    }

}

package com.example.display_customer.controller;

import com.example.display_customer.modle.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/CustomerServlet")
public class CustomerServlet extends HttpServlet {

    private static final List<Customer> customerList = new ArrayList<>();
    static {
        customerList.add(new Customer("Mai Văn Hoàn","1983-08-20","Hà Nội","img/kh1.jpg"));
        customerList.add(new Customer("Nguyễn Văn Nam","1988-05-21","Hà Giang","img/kh2.jpg"));
        customerList.add(new Customer("Trần Văn Thái","1993-12-20","Đà Nẵng","img/kh3.jpg"));
        customerList.add(new Customer("Trần Mai Thủy","1988-11-20","Lào Cai","img/kh4.jpg"));
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customerList",customerList);
        request.getRequestDispatcher("view.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

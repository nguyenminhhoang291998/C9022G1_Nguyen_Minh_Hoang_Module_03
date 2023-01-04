package com.example.case_study.controller;

import com.example.case_study.models.Customer;
import com.example.case_study.models.Employee;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "EmployeeServlet", value = "/employee")
public class EmployeeServlet extends HttpServlet {
    private static final Map<Integer, Employee> employeeList = new HashMap<>();

    static {
        employeeList.put(1,new Employee(1,"Nguyễn Thanh","09/08/1998","09897676542",500.5,"0908767676","thanhnguyen@gmail.com","Quảng Trị",1,2,2,"thanhnguyen"));
        employeeList.put(2,new Employee(2,"Trần Quốc","09/10/1998","09897676542",500.5,"0908767676","thanhnguyen@gmail.com","Quảng Trị",1,2,2,"thanhnguyen"));
        employeeList.put(3,new Employee(3,"Nguyễn Thị Thùy","09/08/1998","09897676542",500.5,"0908767676","thanhnguyen@gmail.com","Quảng Trị",1,2,2,"thanhnguyen"));
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
            default:
                showAllList(request, response);
                break;
        }
    }

    private void showAllList(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("employeeList", employeeList.values());
        try {
            request.getRequestDispatcher("view/employee/employee.jsp").forward(request, response);
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
        }
        }
    }


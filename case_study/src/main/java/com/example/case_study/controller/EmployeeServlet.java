package com.example.case_study.controller;

import com.example.case_study.models.Customer;
import com.example.case_study.models.Employee;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

@WebServlet(name = "EmployeeServlet", value = "/employee")
public class EmployeeServlet extends HttpServlet {
    private static final Map<Integer, Employee> employeeList = new HashMap<>();

    static {
        employeeList.put(1, new Employee(1, "Nguyễn Thanh", "09/08/1998", "09897676542", 500.5, "0908767676", "thanhnguyen@gmail.com", "Quảng Trị", 1, 2, 2, "thanhnguyen"));
        employeeList.put(2, new Employee(2, "Trần Quốc", "09/10/1998", "09897676542", 500.5, "0908767676", "thanhnguyen@gmail.com", "Quảng Trị", 1, 2, 2, "thanhnguyen"));
        employeeList.put(3, new Employee(3, "Nguyễn Thị Thùy", "09/08/1998", "09897676542", 500.5, "0908767676", "thanhnguyen@gmail.com", "Quảng Trị", 1, 2, 2, "thanhnguyen"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action){
            default:
                showListEmployee(request, response);
                break;
        }

    }

    private void editEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("editId"));
        String name = request.getParameter("editName");
        String dayOfBirth = request.getParameter("editDayOfBirth");
        String idCard = request.getParameter("editIdCard");
        double salary = Double.parseDouble(request.getParameter("editSalary"));
        String phoneNumber = request.getParameter("editPhoneNumber");
        String email = request.getParameter("editEmail");
        String address = request.getParameter("editAddress");
        int positionId = Integer.parseInt(request.getParameter("editPositionId"));
        int educationDegreeId = Integer.parseInt(request.getParameter("editEducationDegreeId"));
        int division = Integer.parseInt(request.getParameter("editDivisionId"));
        String userName = request.getParameter("editUserName");
        if (!employeeList.containsKey(id)) {
            request.setAttribute("message", "Edit failed because id already not exists!");
        } else {
            employeeList.put(id, new Employee(id, name, dayOfBirth, idCard, salary, phoneNumber, email, address, positionId, educationDegreeId, division, userName));
            request.setAttribute("message", "Edit successful!");
        }
        showListEmployee(request, response);
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("deleteId"));
        employeeList.remove(id);
        request.setAttribute("message", "Delete successful!");
        showListEmployee(request, response);
    }

    private void addEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("newId"));
        String name = request.getParameter("newName");
        String dayOfBirth = request.getParameter("newDayOfBirth");
        String idCard = request.getParameter("newIdCard");
        double salary = Double.parseDouble(request.getParameter("newSalary"));
        String phoneNumber = request.getParameter("newPhoneNumber");
        String email = request.getParameter("newEmail");
        String address = request.getParameter("newAddress");
        int positionId = Integer.parseInt(request.getParameter("newPositionId"));
        int educationDegreeId = Integer.parseInt(request.getParameter("newEducationDegreeId"));
        int divisionId = Integer.parseInt(request.getParameter("newDivisionId"));
        String userName = request.getParameter("newUserName");
        if (employeeList.containsKey(id)) {
            request.setAttribute("message", "Add failed because id already exists!");
        } else {
            employeeList.put(id, new Employee(id, name, dayOfBirth, idCard, salary, phoneNumber, email, address, positionId, educationDegreeId, divisionId, userName));
            request.setAttribute("message", "Add successful!");
        }
        showListEmployee(request, response);
    }

    private void showListEmployee(HttpServletRequest request, HttpServletResponse response) {
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
            case "add":
                addEmployee(request, response);
                break;
            case "delete":
                deleteEmployee(request, response);
                break;
            case "edit":
                editEmployee(request, response);
                break;

        }
    }
}


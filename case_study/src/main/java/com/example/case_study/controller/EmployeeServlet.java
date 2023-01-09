package com.example.case_study.controller;

import com.example.case_study.models.employee.Employee;
import com.example.case_study.services.employee.IEmployeeService;
import com.example.case_study.services.employee.IPositionService;
import com.example.case_study.services.employee.impl.EmployeeService;
import com.example.case_study.services.employee.impl.PositionService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "EmployeeServlet", value = "/employee")
public class EmployeeServlet extends HttpServlet {
    IEmployeeService employeeService = new EmployeeService();

    IPositionService positionService = new PositionService();

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
        if (this.employeeService.findEmployee(id) != null) {
            boolean check = this.employeeService.editEmployee(new Employee(id, name, dayOfBirth, idCard, salary, phoneNumber, email, address, positionId, educationDegreeId, division, userName));
            if (!check) {
                request.setAttribute("message", "Edit failed!");
            } else {
                request.setAttribute("message", "Edit successful!");
            }
        } else {
            request.setAttribute("message", "Edit failed because id already not exists!");
        }
        showListEmployee(request, response);
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("deleteId"));
        if (this.employeeService.findEmployee(id) != null) {
            boolean check = this.employeeService.deleteEmployee(id);
            if (check) {
                request.setAttribute("message", "Delete successful!");
            } else {
                request.setAttribute("message", "Delete failed!");
            }
        } else {
            request.setAttribute("message", "Delete failed because id already not exists!");
        }
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
        if (this.employeeService.findEmployee(id) == null) {
            boolean check = this.employeeService.addEmployee(new Employee(id, name, dayOfBirth, idCard, salary, phoneNumber, email, address, positionId, educationDegreeId, divisionId, userName));
            if (!check) {
                request.setAttribute("message", "Add failed!");
            } else {
                request.setAttribute("message", "Add successful!");
            }
        } else {
            request.setAttribute("message", "Add failed because id already exists!");
        }
        showListEmployee(request, response);
    }

    private void showListEmployee(HttpServletRequest request, HttpServletResponse response) {

        request.setAttribute("employeeList", this.employeeService.findAllEmployeeList());
        request.setAttribute("positionList", this.positionService.findAllPosition());
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


package com.example.case_study.services.employee;

import com.example.case_study.models.employee.Employee;

import java.util.List;

public interface IEmployeeService {
    List<Employee> findAllEmployeeList();
    boolean addEmployee(Employee employee);
    boolean editEmployee(Employee employee);
    boolean deleteEmployee(int id);

    Employee findEmployee(int id);
    List<Employee> findAllEmployeeListByNameAndFacility(String findName, String findAddress);
}

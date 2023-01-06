package com.example.case_study.services.employee.impl;

import com.example.case_study.models.Customer;
import com.example.case_study.models.Employee;
import com.example.case_study.repository.employee.IEmployeeRepository;
import com.example.case_study.repository.employee.impl.EmployeeRepository;
import com.example.case_study.services.employee.IEmployeeService;

import java.util.List;

public class EmployeeService implements IEmployeeService {
    IEmployeeRepository employeeRepository = new EmployeeRepository();
    @Override
    public List<Employee> findAllEmployeeList() {
        return employeeRepository.findAllEmployeeList();
    }

    @Override
    public boolean addEmployee(Employee employee) {
        return employeeRepository.addEmployee(employee);
    }

    @Override
    public boolean editEmployee(Employee employee) {
        return employeeRepository.editEmployee(employee);
    }

    @Override
    public boolean deleteEmployee(int id) {
        return employeeRepository.deleteEmployee(id);
    }

    @Override
    public Employee findEmployee(int id) {
        return employeeRepository.findEmployee(id);
    }
}

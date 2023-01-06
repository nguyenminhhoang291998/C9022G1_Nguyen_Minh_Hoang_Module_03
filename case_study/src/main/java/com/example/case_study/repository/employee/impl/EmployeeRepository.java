package com.example.case_study.repository.employee.impl;

import com.example.case_study.models.Customer;
import com.example.case_study.models.Employee;
import com.example.case_study.repository.BaseRepository;
import com.example.case_study.repository.employee.IEmployeeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepository implements IEmployeeRepository {
    private static final String SELECT_ALL_EMPLOYEE = "select * from employee";
    private static final String INSERT_INTO_EMPLOYEE_LIST = "INSERT INTO employee (id, name, day_of_birth, id_card,salary, phone_number, email, address , position_id, education_degree_id, division_id, username) values(?,?,?,?,?,?,?,?,?,?,?,?)";
    private static final String UPDATE_EMPLOYEE = "UPDATE employee SET name = ?, day_of_birth = ?, id_card = ?, salary = ? , phone_number = ?, email = ?, address = ? ,position_id = ? ,education_degree_id = ? ,division_id = ? ,username = ?  WHERE id = ?";
    private static final String DELETE_EMPLOYEE = "DELETE FROM employee WHERE id = ?";
    private static final String FIND_EMPLOYEE = "SELECT * FROM employee WHERE id = ?";

    @Override
    public List<Employee> findAllEmployeeList() {
        List<Employee> employeeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EMPLOYEE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt(1);
                String name = resultSet.getString(2);
                String dayOfBirth = resultSet.getString(3);
                String idCard = resultSet.getString(4);
                double salary = resultSet.getDouble(5);
                String phoneNumber = resultSet.getString(6);
                String email = resultSet.getString(7);
                String address = resultSet.getString(8);
                int positionId = resultSet.getInt(9);
                int educationDegreeId = resultSet.getInt(10);
                int divisionId = resultSet.getInt(11);
                String userName = resultSet.getString(12);
                employeeList.add(new Employee(id, name, dayOfBirth, idCard, salary, phoneNumber, email, address, positionId, educationDegreeId, divisionId, userName));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return employeeList;
    }

    @Override
    public boolean addEmployee(Employee employee) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_EMPLOYEE_LIST);
            preparedStatement.setInt(1, employee.getId());
            preparedStatement.setString(2, employee.getName());
            preparedStatement.setString(3, employee.getDayOfBirth());
            preparedStatement.setString(4, employee.getIdCard());
            preparedStatement.setDouble(5, employee.getSalary());
            preparedStatement.setString(6, employee.getPhoneNumber());
            preparedStatement.setString(7, employee.getEmail());
            preparedStatement.setString(8, employee.getAddress());
            preparedStatement.setInt(9, employee.getPositionId());
            preparedStatement.setInt(10, employee.getEducationDegreeId());
            preparedStatement.setInt(11, employee.getDivisionId());
            preparedStatement.setString(12, employee.getUserName());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public boolean editEmployee(Employee employee) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_EMPLOYEE);
            preparedStatement.setString(1, employee.getName());
            preparedStatement.setString(2, employee.getDayOfBirth());
            preparedStatement.setString(3, employee.getIdCard());
            preparedStatement.setDouble(4, employee.getSalary());
            preparedStatement.setString(5, employee.getPhoneNumber());
            preparedStatement.setString(6, employee.getEmail());
            preparedStatement.setString(7, employee.getAddress());
            preparedStatement.setInt(8, employee.getPositionId());
            preparedStatement.setInt(9, employee.getEducationDegreeId());
            preparedStatement.setInt(10, employee.getDivisionId());
            preparedStatement.setString(11, employee.getUserName());
            preparedStatement.setInt(12, employee.getId());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public boolean deleteEmployee(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_EMPLOYEE);
            preparedStatement.setInt(1, id);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Employee findEmployee(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_EMPLOYEE);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                String name = resultSet.getString(2);
                String dayOfBirth = resultSet.getString(3);
                String idCard = resultSet.getString(4);
                double salary = resultSet.getDouble(5);
                String phoneNumber = resultSet.getString(6);
                String email = resultSet.getString(7);
                String address = resultSet.getString(8);
                int positionId = resultSet.getInt(9);
                int educationDegreeId = resultSet.getInt(10);
                int divisionId = resultSet.getInt(11);
                String userName = resultSet.getString(12);
                return new Employee(id, name, dayOfBirth, idCard, salary, phoneNumber, email, address, positionId, educationDegreeId, divisionId, userName);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
}

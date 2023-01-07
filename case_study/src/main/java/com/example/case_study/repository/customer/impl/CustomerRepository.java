package com.example.case_study.repository.customer.impl;

import com.example.case_study.models.Customer;
import com.example.case_study.repository.BaseRepository;
import com.example.case_study.repository.customer.ICustomerRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private static final String SELECT_ALL_CUSTOMER = "select * from customer";
    private static final String INSERT_INTO_CUSTOMER_LIST = "INSERT INTO customer (id, customer_type_id, name, day_of_birth, gender, id_card, phone_number, email, address) values(?,?,?,?,?,?,?,?,?)";
    private static final String UPDATE_CUSTOMER = "UPDATE customer SET customer_type_id = ?, name = ?, day_of_birth = ?, gender = ?, id_card = ?, phone_number = ?, email = ?, address = ? WHERE id = ?";
    private static final String DELETE_CUSTOMER = "DELETE FROM customer WHERE id = ?";
    private static final String FIND_CUSTOMER = "SELECT * FROM customer WHERE id = ?";

    @Override
    public List<Customer> findAllCustomerList() {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt(1);
                int customerTypeId = resultSet.getInt(2);
                String name = resultSet.getString(3);
                String dayOfBirth = resultSet.getString(4);
                boolean gender = resultSet.getBoolean(5);
                String idCard = resultSet.getString(6);
                String phoneNumber = resultSet.getString(7);
                String email = resultSet.getString(8);
                String address = resultSet.getString(9);
                customerList.add(new Customer(id, customerTypeId, name, dayOfBirth, gender, idCard, phoneNumber, email, address));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return customerList;
    }

    @Override
    public boolean addCustomer(Customer customer) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_CUSTOMER_LIST);
            preparedStatement.setInt(1, customer.getId());
            preparedStatement.setInt(2, customer.getCustomerTypeId());
            preparedStatement.setString(3, customer.getName());
            preparedStatement.setString(4, customer.getDayOfBirth());
            preparedStatement.setBoolean(5, customer.getGender());
            preparedStatement.setString(6, customer.getIdCard());
            preparedStatement.setString(7, customer.getPhoneNumber());
            preparedStatement.setString(8, customer.getEmail());
            preparedStatement.setString(9, customer.getAddress());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public boolean editCustomer(Customer customer) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CUSTOMER);
            preparedStatement.setInt(1, customer.getCustomerTypeId());
            preparedStatement.setString(2, customer.getName());
            preparedStatement.setString(3, customer.getDayOfBirth());
            preparedStatement.setBoolean(4, customer.getGender());
            preparedStatement.setString(5, customer.getIdCard());
            preparedStatement.setString(6, customer.getPhoneNumber());
            preparedStatement.setString(7, customer.getEmail());
            preparedStatement.setString(8, customer.getAddress());
            preparedStatement.setInt(9, customer.getId());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public boolean deleteCustomer(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CUSTOMER);
            preparedStatement.setInt(1, id);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Customer findCustomer(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_CUSTOMER);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()){
                int customerTypeId = resultSet.getInt(2);
                String name = resultSet.getString(3);
                String dayOfBirth = resultSet.getString(4);
                boolean gender = resultSet.getBoolean(5);
                String idCard = resultSet.getString(6);
                String phoneNumber = resultSet.getString(7);
                String email = resultSet.getString(8);
                String address = resultSet.getString(9);
                return new Customer(id, customerTypeId, name, dayOfBirth, gender, idCard, phoneNumber, email, address);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

}

package com.example.case_study.services.customer;

import com.example.case_study.models.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> findAllCustomerList();
    boolean addCustomer(Customer customer);
    boolean editCustomer(Customer customer);
    boolean deleteCustomer(int id);

    Customer findCustomer(int id);
}

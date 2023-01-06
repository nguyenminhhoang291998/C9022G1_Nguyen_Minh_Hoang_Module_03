package com.example.case_study.services.customer.impl;

import com.example.case_study.models.Customer;
import com.example.case_study.repository.customer.ICustomerRepository;
import com.example.case_study.repository.customer.impl.CustomerRepository;
import com.example.case_study.services.customer.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {
    ICustomerRepository customerRepository = new CustomerRepository();
    @Override
    public List<Customer> findAllCustomerList() {
        return customerRepository.findAllCustomerList();
    }

    @Override
    public boolean addCustomer(Customer customer) {
        return customerRepository.addCustomer(customer);
    }

    @Override
    public boolean editCustomer(Customer customer) {
        return customerRepository.editCustomer(customer);
    }

    @Override
    public boolean deleteCustomer(int id) {
        return customerRepository.deleteCustomer(id);
    }

    public Customer findCustomer(int id){
        return this.customerRepository.findCustomer(id);
    }
}

package com.example.case_study.models.contract;

import com.example.case_study.models.Customer;
import com.example.case_study.models.facility.Facility;
import com.example.case_study.models.contract_detail.ContractDetailVirtual;

import java.sql.Date;
import java.util.List;

public class ContractVirtual {

    private int id;
    private Date startDay;
    private Date endDay;
    private double deposit;
    private int employeeId;
    private Facility facility;
    private Customer customer;
    private double totalCost;

    private List<ContractDetailVirtual> contractDetailVirtualList;


    public List<ContractDetailVirtual> getContractDetailVirtualList() {
        return contractDetailVirtualList;
    }

    public void setContractDetailVirtualList(List<ContractDetailVirtual> contractDetailVirtualList) {
        this.contractDetailVirtualList = contractDetailVirtualList;
    }

    public ContractVirtual(int id, Facility facility, Customer customer, Date startDay, Date endDay, double deposit, double totalCost, List<ContractDetailVirtual> contractDetailVirtualList) {
        this.id = id;
        this.startDay = startDay;
        this.endDay = endDay;
        this.deposit = deposit;
        this.facility = facility;
        this.customer = customer;
        this.totalCost = totalCost;
        this.contractDetailVirtualList = contractDetailVirtualList;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getStartDay() {
        return startDay;
    }

    public void setStartDay(Date startDay) {
        this.startDay = startDay;
    }

    public Date getEndDay() {
        return endDay;
    }

    public void setEndDay(Date endDay) {
        this.endDay = endDay;
    }

    public double getDeposit() {
        return deposit;
    }

    public void setDeposit(double deposit) {
        this.deposit = deposit;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public Facility getFacility() {
        return facility;
    }

    public void setFacility(Facility facility) {
        this.facility = facility;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public double getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(double totalCost) {
        this.totalCost = totalCost;
    }
}

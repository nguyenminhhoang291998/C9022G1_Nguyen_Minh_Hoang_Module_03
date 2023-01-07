package com.example.case_study.repository.contract.impl;

import com.example.case_study.models.Customer;
import com.example.case_study.models.Facility;
import com.example.case_study.models.contract.Contract;
import com.example.case_study.models.contract.ContractVirtual;
import com.example.case_study.repository.BaseRepository;
import com.example.case_study.repository.contract.IContractRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ContractRepository implements IContractRepository {
    private static final String SELECT_ALL_CONTRACT_JOIN = "CALL select_total_cost_by_contract_id()";
    private static final String INSERT_INTO_CONTRACT_LIST = "INSERT INTO customer (id, customer_type_id, name, day_of_birth, gender, id_card, phone_number, email, address) values(?,?,?,?,?,?,?,?,?)";
    private static final String UPDATE_CONTRACT = "UPDATE customer SET customer_type_id = ?, name = ?, day_of_birth = ?, gender = ?, id_card = ?, phone_number = ?, email = ?, address = ? WHERE id = ?";
    private static final String DELETE_CONTRACT = "DELETE FROM customer WHERE id = ?";
    private static final String FIND_CUSTOMER = "SELECT * FROM customer WHERE id = ?";

    @Override
    public List<ContractVirtual> findAllContractVirtualList() {
        List<ContractVirtual> contractVirtualList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CONTRACT_JOIN);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int contractId = resultSet.getInt(1);
                int facilityId = resultSet.getInt(2);
                String facilityName = resultSet.getString(3);
                int customerId = resultSet.getInt(4);
                String customerName = resultSet.getString(5);
                Date startDate = Date.valueOf(resultSet.getDate(6).toLocalDate());
                Date endDate = Date.valueOf(resultSet.getDate(7).toLocalDate());
                double deposit = resultSet.getDouble(8);
                double totalCost = resultSet.getDouble(9);
                contractVirtualList.add(new ContractVirtual(contractId, new Facility(facilityId, facilityName), new Customer(customerId, customerName), startDate, endDate, deposit, totalCost));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return contractVirtualList;
    }



    @Override
    public boolean addContract(Contract contract) {
        return false;
    }

    @Override
    public boolean editContract(Contract contract) {
        return false;
    }

    @Override
    public boolean deleteContract(int id) {
        return false;
    }

    @Override
    public Contract findContract(int id) {
        return null;
    }
}

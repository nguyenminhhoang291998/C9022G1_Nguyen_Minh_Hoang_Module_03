package com.example.case_study.repository.contract.impl;

import com.example.case_study.models.Customer;
import com.example.case_study.models.contract_detail.ContractDetail;
import com.example.case_study.models.facility.Facility;
import com.example.case_study.models.contract.AttachFacility;
import com.example.case_study.models.contract.Contract;
import com.example.case_study.models.contract.ContractVirtual;
import com.example.case_study.models.contract_detail.ContractDetailVirtual;
import com.example.case_study.repository.BaseRepository;
import com.example.case_study.repository.contract.IContractRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ContractRepository implements IContractRepository {
    private static final String SELECT_ALL_CONTRACT_JOIN = "CALL select_total_cost_by_contract_id()";
    private static final String SELECT_LIST_CONTRACT_DETAIL_BY_ID = "CALL select_attach_facility_by_id(?);";
    private static final String INSERT_INTO_CONTRACT_LIST = "INSERT INTO contract (start_date,end_date,deposit,employee_id,customer_id,facility_id)  values (?,?,?,?,?,?);";
    private static final String INSERT_INTO_CONTRACT_DETAIL_LIST = "INSERT INTO contract_detail (contract_id,attach_facility_id,quantity) values (?,?,?);";
    private static final String UPDATE_CONTRACT = "UPDATE customer SET customer_type_id = ?, name = ?, day_of_birth = ?, gender = ?, id_card = ?, phone_number = ?, email = ?, address = ? WHERE id = ?";
    private static final String DELETE_CONTRACT = "DELETE FROM customer WHERE id = ?;";
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
                List<ContractDetailVirtual> contractDetailVirtualList = getListContractVirtualById(contractId);
                contractVirtualList.add(new ContractVirtual(contractId, new Facility(facilityId, facilityName), new Customer(customerId, customerName), startDate, endDate, deposit, totalCost, contractDetailVirtualList));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return contractVirtualList;
    }

    private List<ContractDetailVirtual> getListContractVirtualById(int contractId) {
        List<ContractDetailVirtual> contractDetailVirtualList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_LIST_CONTRACT_DETAIL_BY_ID);
            preparedStatement.setInt(1,contractId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String attachFacilityName = resultSet.getString("attach_facility_name");
                double attachFacilityCost = resultSet.getDouble("attach_facility_cost");
                int quantity = resultSet.getInt("quantity");
                contractDetailVirtualList.add(new ContractDetailVirtual(contractId,new AttachFacility(attachFacilityName,attachFacilityCost),quantity));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return contractDetailVirtualList;
    }


    @Override
    public boolean addContract(Contract contract) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_CONTRACT_LIST);
            preparedStatement.setDate(1,contract.getStartDay());
            preparedStatement.setDate(2,contract.getEndDay());
            preparedStatement.setDouble(3,contract.getDeposit());
            preparedStatement.setInt(4,contract.getEmployeeId());
            preparedStatement.setInt(5,contract.getCustomerId());
            preparedStatement.setInt(6,contract.getFacilityId());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
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

    @Override
    public boolean addContractDetail(ContractDetail contractDetail) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_CONTRACT_DETAIL_LIST);
            preparedStatement.setInt(1,contractDetail.getContractId());
            preparedStatement.setInt(2,contractDetail.getAttachFacilityId());
            preparedStatement.setInt(3,contractDetail.getQuantity());
            return preparedStatement.executeUpdate() >0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}

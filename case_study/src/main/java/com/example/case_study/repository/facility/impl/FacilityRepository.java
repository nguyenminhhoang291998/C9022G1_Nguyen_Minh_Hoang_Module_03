package com.example.case_study.repository.facility.impl;

import com.example.case_study.models.Facility;
import com.example.case_study.repository.BaseRepository;
import com.example.case_study.repository.facility.IFacilityRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FacilityRepository implements IFacilityRepository {
    private static final String SELECT_ALL_FACILITY = "select * from FACILITY";
    private static final String INSERT_INTO_FACILITY_LIST = "INSERT INTO employee (id, name, day_of_birth, id_card,salary, phone_number, email, address , position_id, education_degree_id, division_id, username) values(?,?,?,?,?,?,?,?,?,?,?,?)";
    private static final String UPDATE_FACILITY = "UPDATE employee SET name = ?, day_of_birth = ?, id_card = ?, salary = ? , phone_number = ?, email = ?, address = ? ,position_id = ? ,education_degree_id = ? ,division_id = ? ,username = ?  WHERE id = ?";
    private static final String DELETE_FACILITY = "DELETE FROM employee WHERE id = ?";
    private static final String FIND_FACILITY = "SELECT * FROM employee WHERE id = ?";

    @Override
    public List<Facility> findAllFacilityList() {
        List<Facility> facilityList = new ArrayList<>();
        try {
            Connection connection = BaseRepository.getConnectDB();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_FACILITY);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt(1);
                String name = resultSet.getString(2);
                int area = resultSet.getInt(3);
                double cost = resultSet.getDouble(4);
                int maxPeople = resultSet.getInt(5);
                int rentTypeId = resultSet.getInt(6);
                int facilityTypeId = resultSet.getInt(7);
                String standardRoom = resultSet.getString(8);
                String descriptionOtherConvenience = resultSet.getString(9);
                double poolArea = resultSet.getDouble(10);
                int numberOfFloors = resultSet.getInt(11);
                String facilityFree = resultSet.getString(12);
                facilityList.add(new Facility(id,name,area,cost,maxPeople,rentTypeId,facilityTypeId,standardRoom,descriptionOtherConvenience,poolArea,numberOfFloors,facilityFree));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return facilityList;
    }

    @Override
    public boolean addFacility(Facility facility) {
        return false;
    }

    @Override
    public boolean editFacility(Facility facility) {
        return false;
    }

    @Override
    public boolean deleteFacility(int id) {
        return false;
    }

    @Override
    public Facility findFacility(int id) {
        return null;
    }
}

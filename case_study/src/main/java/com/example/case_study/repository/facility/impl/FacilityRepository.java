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
    private static final String SELECT_ALL_FACILITY = "select * from facility";
    private static final String INSERT_INTO_FACILITY_LIST = "INSERT INTO facility (id, name, area, cost, max_people, rent_type_id, facility_type_id ,standard_room , description_other_convenience, pool_area, number_of_floors, facility_free) values(?,?,?,?,?,?,?,?,?,?,?,?)";
    private static final String UPDATE_FACILITY = "UPDATE facility SET name = ?, area = ?,cost = ?, max_people = ? , rent_type_id = ?, facility_type_id = ?, standard_room = ? ,description_other_convenience = ? ,pool_area = ? ,number_of_floors = ? ,facility_free = ?  WHERE id = ?";
    private static final String DELETE_FACILITY = "DELETE FROM facility WHERE id = ?";
    private static final String FIND_FACILITY = "SELECT * FROM facility WHERE id = ?";

    @Override
    public List<Facility> findAllFacilityList() {
        List<Facility> facilityList = new ArrayList<>();
        try {
            Connection connection = BaseRepository.getConnectDB();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_FACILITY);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
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
                facilityList.add(new Facility(id, name, area, cost, maxPeople, rentTypeId, facilityTypeId, standardRoom, descriptionOtherConvenience, poolArea, numberOfFloors, facilityFree));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return facilityList;
    }



    @Override
    public boolean addFacility(Facility facility) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_FACILITY_LIST);
            preparedStatement.setInt(1, facility.getId());
            preparedStatement.setString(2, facility.getName());
            preparedStatement.setInt(3, facility.getArea());
            preparedStatement.setDouble(4, facility.getCost());
            preparedStatement.setInt(5, facility.getMaxPeople());
            preparedStatement.setInt(6, facility.getRentTypeId());
            preparedStatement.setInt(7, facility.getFacilityTypeId());
            preparedStatement.setString(8, facility.getStandardRoom());
            preparedStatement.setString(9, facility.getDescriptionOtherConvenience());
            preparedStatement.setDouble(10, facility.getPoolArea());
            preparedStatement.setInt(11, facility.getNumberOfFloors());
            preparedStatement.setString(12, facility.getFacilityFree());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    @Override
    public boolean editFacility(Facility facility) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_FACILITY);
            preparedStatement.setString(1, facility.getName());
            preparedStatement.setInt(2, facility.getArea());
            preparedStatement.setDouble(3, facility.getCost());
            preparedStatement.setInt(4, facility.getMaxPeople());
            preparedStatement.setInt(5, facility.getRentTypeId());
            preparedStatement.setInt(6, facility.getFacilityTypeId());
            preparedStatement.setString(7, facility.getStandardRoom());
            preparedStatement.setString(8, facility.getDescriptionOtherConvenience());
            preparedStatement.setDouble(9, facility.getPoolArea());
            preparedStatement.setInt(10, facility.getNumberOfFloors());
            preparedStatement.setString(11, facility.getFacilityFree());
            preparedStatement.setInt(12, facility.getId());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public boolean deleteFacility(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_FACILITY);
            preparedStatement.setInt(1, id);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Facility findFacility(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_FACILITY);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                String name = resultSet.getString(2);
                int area = resultSet.getInt(3);
                double cost = resultSet.getDouble(4);
                int maxPeople =  resultSet.getInt(5);
                int rentTypeId = resultSet.getInt(6);
                int facilityTypeId = resultSet.getInt(7);
                String standardRoom = resultSet.getString(8);
                String descriptionOtherConvenience = resultSet.getString(9);
                double poolArea = resultSet.getDouble(10);
                int numberOfFloors = resultSet.getInt(11);
                String facilityFree =  resultSet.getString(12);
                return new Facility(id,name,area,cost,maxPeople,rentTypeId,facilityTypeId,standardRoom,descriptionOtherConvenience,poolArea,numberOfFloors,facilityFree);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
}
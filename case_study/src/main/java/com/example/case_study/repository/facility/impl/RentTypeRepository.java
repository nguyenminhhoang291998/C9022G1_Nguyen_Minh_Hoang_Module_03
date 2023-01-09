package com.example.case_study.repository.facility.impl;

import com.example.case_study.models.facility.FacilityType;
import com.example.case_study.models.facility.RentType;
import com.example.case_study.repository.BaseRepository;
import com.example.case_study.repository.facility.IRentTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RentTypeRepository implements IRentTypeRepository {
    private static final String SELECT_ALL_RENT_TYPE = "SELECT * from rent_type;";

    @Override
    public List<RentType> findAllRentType() {
        List<RentType> rentTypeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_RENT_TYPE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt(1);
                String name = resultSet.getString(2);
                rentTypeList.add(new RentType(id,name));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rentTypeList;
    }
}

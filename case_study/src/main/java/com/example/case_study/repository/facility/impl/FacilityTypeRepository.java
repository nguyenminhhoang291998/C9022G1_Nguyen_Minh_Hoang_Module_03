package com.example.case_study.repository.facility.impl;

import com.example.case_study.models.facility.FacilityType;
import com.example.case_study.repository.BaseRepository;
import com.example.case_study.repository.facility.IFacilityTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FacilityTypeRepository implements IFacilityTypeRepository {
    private static final String SELECT_ALL_FACILITY_TYPE = "SELECT * from facility_type;";

    @Override
    public List<FacilityType> findAllFacilityType() {
        List<FacilityType> facilityTypeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_FACILITY_TYPE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt(1);
                String name = resultSet.getString(2);
                facilityTypeList.add(new FacilityType(id,name));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return facilityTypeList;
    }
}

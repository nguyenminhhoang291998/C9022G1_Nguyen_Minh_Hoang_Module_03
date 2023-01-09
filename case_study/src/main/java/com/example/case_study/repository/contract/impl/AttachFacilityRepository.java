package com.example.case_study.repository.contract.impl;

import com.example.case_study.models.contract.AttachFacility;
import com.example.case_study.models.employee.Position;
import com.example.case_study.repository.BaseRepository;
import com.example.case_study.repository.contract.IAttachFacilityRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AttachFacilityRepository implements IAttachFacilityRepository {

    private static final String SELECT_ALL_ATTACH_FACILITY = "select id , name from  attach_facility;";
    @Override
    public List<AttachFacility> findAllAttachFacility() {
        List<AttachFacility> attachFacilityList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_ATTACH_FACILITY);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt(1);
                String name = resultSet.getString(2);
                attachFacilityList.add(new AttachFacility(id,name));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return attachFacilityList;
    }
}

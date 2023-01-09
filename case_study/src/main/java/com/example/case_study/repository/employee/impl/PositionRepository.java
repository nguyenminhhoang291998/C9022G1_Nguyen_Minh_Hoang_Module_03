package com.example.case_study.repository.employee.impl;

import com.example.case_study.models.employee.Position;
import com.example.case_study.repository.BaseRepository;
import com.example.case_study.repository.employee.IPositionRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PositionRepository implements IPositionRepository {
    private static final String SELECT_ALL_POSITION = "SELECT * from position;";
    @Override
    public List<Position> findAllPosition() {
        List<Position> positionList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_POSITION);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt(1);
                String name = resultSet.getString(2);
                positionList.add(new Position(id,name));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return positionList;
    }
}

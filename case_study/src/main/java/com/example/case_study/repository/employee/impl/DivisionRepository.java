package com.example.case_study.repository.employee.impl;

import com.example.case_study.models.employee.Division;
import com.example.case_study.models.employee.EducationDegree;
import com.example.case_study.repository.BaseRepository;
import com.example.case_study.repository.employee.IDivisionRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DivisionRepository implements IDivisionRepository {
    private static final String SELECT_ALL_DIVISION = "SELECT * from division;";
    @Override
    public List<Division> findAllDivision() {
        List<Division> divisionList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_DIVISION);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt(1);
                String name = resultSet.getString(2);
                divisionList.add(new Division(id,name));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return divisionList;
    }
}

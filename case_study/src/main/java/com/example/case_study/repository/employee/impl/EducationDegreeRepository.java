package com.example.case_study.repository.employee.impl;

import com.example.case_study.models.employee.EducationDegree;
import com.example.case_study.models.employee.Position;
import com.example.case_study.repository.BaseRepository;
import com.example.case_study.repository.employee.IEducationDegreeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EducationDegreeRepository implements IEducationDegreeRepository {
    private static final String SELECT_ALL_EDUCATION_DEGREE = "SELECT * from education_degree;";

    @Override
    public List<EducationDegree> findAllEducationDegree() {
        List<EducationDegree> educationDegreeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EDUCATION_DEGREE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt(1);
                String name = resultSet.getString(2);
                educationDegreeList.add(new EducationDegree(id,name));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return educationDegreeList;
    }
}

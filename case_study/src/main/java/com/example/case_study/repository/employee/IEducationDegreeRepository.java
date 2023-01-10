package com.example.case_study.repository.employee;

import com.example.case_study.models.employee.EducationDegree;
import com.example.case_study.models.employee.Position;

import java.util.List;

public interface IEducationDegreeRepository {
    List<EducationDegree> findAllEducationDegree();
}

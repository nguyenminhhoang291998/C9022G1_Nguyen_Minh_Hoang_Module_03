package com.example.case_study.repository.employee;

import com.example.case_study.models.employee.Division;
import com.example.case_study.models.employee.Position;

import java.util.List;

public interface IDivisionRepository {
    List<Division> findAllDivision();
}

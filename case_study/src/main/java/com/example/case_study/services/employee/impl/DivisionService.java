package com.example.case_study.services.employee.impl;

import com.example.case_study.models.employee.Division;
import com.example.case_study.repository.employee.IDivisionRepository;
import com.example.case_study.repository.employee.impl.DivisionRepository;

import java.util.List;

public class DivisionService implements IDivisionService{
    IDivisionRepository divisionRepository = new DivisionRepository();
    @Override
    public List<Division> findAllDivision() {
        return this.divisionRepository.findAllDivision();
    }
}

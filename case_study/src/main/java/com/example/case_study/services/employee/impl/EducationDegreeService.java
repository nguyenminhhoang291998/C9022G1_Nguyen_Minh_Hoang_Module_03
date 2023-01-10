package com.example.case_study.services.employee.impl;

import com.example.case_study.models.employee.EducationDegree;
import com.example.case_study.repository.employee.IEducationDegreeRepository;
import com.example.case_study.repository.employee.impl.EducationDegreeRepository;
import com.example.case_study.services.employee.IEducationDegreeService;

import java.util.List;

public class EducationDegreeService implements IEducationDegreeService {
    IEducationDegreeRepository educationDegreeRepository = new EducationDegreeRepository();
    @Override
    public List<EducationDegree> findAllEducationDegree() {
        return this.educationDegreeRepository.findAllEducationDegree();
    }
}

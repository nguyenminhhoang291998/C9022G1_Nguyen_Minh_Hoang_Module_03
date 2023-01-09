package com.example.case_study.services.employee;

import com.example.case_study.models.employee.Position;

import java.util.List;

public interface IPositionService {
    List<Position> findAllPosition();
}

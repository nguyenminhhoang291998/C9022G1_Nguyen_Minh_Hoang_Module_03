package com.example.case_study.services.employee.impl;

import com.example.case_study.models.employee.Position;
import com.example.case_study.repository.employee.IPositionRepository;
import com.example.case_study.repository.employee.impl.PositionRepository;
import com.example.case_study.services.employee.IPositionService;

import java.util.List;

public class PositionService implements IPositionService {
    IPositionRepository positionRepository = new PositionRepository();
    @Override
    public List<Position> findAllPosition() {
        return this.positionRepository.findAllPosition();
    }
}

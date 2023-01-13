package com.example.form.service.impl;

import com.example.form.model.Sach;
import com.example.form.repository.ISachRepository;
import com.example.form.repository.impl.SachRepository;
import com.example.form.service.ISachService;

import java.util.List;

public class SachService implements ISachService {
    ISachRepository sachRepository = new SachRepository();
    @Override
    public List<Sach> danhSachSach() {
        return this.sachRepository.danhSachSach();
    }
}

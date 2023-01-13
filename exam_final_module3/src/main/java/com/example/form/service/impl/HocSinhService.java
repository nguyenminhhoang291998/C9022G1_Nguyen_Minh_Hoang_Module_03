package com.example.form.service.impl;

import com.example.form.model.HocSinh;
import com.example.form.repository.IHocSinhRepository;
import com.example.form.repository.impl.HocSinhRepository;
import com.example.form.service.IHocSinhService;

import java.util.List;

public class HocSinhService implements IHocSinhService {
    IHocSinhRepository hocSinhRepository = new HocSinhRepository();
    @Override
    public List<HocSinh> danhSachHocSinh() {
        return hocSinhRepository.danhSachHocSinh();
    }
}

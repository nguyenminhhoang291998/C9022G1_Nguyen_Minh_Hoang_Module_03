package com.example.form.service.impl;

import com.example.form.model.XuatXu;
import com.example.form.repository.IXuatXuRepository;
import com.example.form.repository.impl.XuatXuRepository;
import com.example.form.service.IXuatXuService;

import java.util.List;

public class XuatXuService implements IXuatXuService {
    IXuatXuRepository xuatXuRepository = new XuatXuRepository();
    @Override
    public List<XuatXu> danhSachXuatXu() {
        return this.xuatXuRepository.danhSachXuatXu();
    }
}

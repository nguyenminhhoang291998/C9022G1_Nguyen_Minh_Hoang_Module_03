package com.example.form.service.impl;

import com.example.form.model.TheMuonSach;
import com.example.form.repository.ITheMuonSachRepository;
import com.example.form.repository.impl.TheMuonSachRepository;
import com.example.form.service.ITheMuonSachService;

import java.util.List;

public class TheMuonSachService implements ITheMuonSachService {
    ITheMuonSachRepository theMuonSachRepository = new TheMuonSachRepository();
    @Override
    public List<TheMuonSach> danhSachTheMuonSach() {
        return this.theMuonSachRepository.danhSachTheMuonSach();
    }

    @Override
    public TheMuonSach theMuonSach(String maSach) {
        return this.theMuonSachRepository.theMuonSach(maSach);
    }
}

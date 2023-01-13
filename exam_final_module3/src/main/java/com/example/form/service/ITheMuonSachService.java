package com.example.form.service;

import com.example.form.model.TheMuonSach;

import java.util.List;

public interface ITheMuonSachService {
    List<TheMuonSach> danhSachTheMuonSach();

    TheMuonSach theMuonSach(String maSach);
}

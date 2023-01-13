package com.example.form.repository;

import com.example.form.model.TheMuonSach;

import java.util.List;

public interface ITheMuonSachRepository {
    List<TheMuonSach> danhSachTheMuonSach();

    TheMuonSach theMuonSach(String maSach);
}

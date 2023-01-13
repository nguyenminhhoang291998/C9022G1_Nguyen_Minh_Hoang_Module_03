package com.example.form.repository.impl;

import com.example.form.model.HocSinh;
import com.example.form.model.Sach;
import com.example.form.model.TheMuonSach;
import com.example.form.repository.BaseRepository;
import com.example.form.repository.ITheMuonSachRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TheMuonSachRepository implements ITheMuonSachRepository {

    private static final String DANH_SACH_MUON = "select t.ma_muon_sach, s.ma_sach ,s.ten_sach, s.tac_gia,h.ma_hoc_sinh, h.ho_ten, h.lop , t.ngay_muon, t.ngay_tra, t.trang_thai\n" +
            "from the_muon_sach t join sach s on t.ma_sach = s.ma_sach \n" +
            "join hoc_sinh h on t.ma_hoc_sinh = h.ma_hoc_sinh;";


    @Override
    public List<TheMuonSach> danhSachTheMuonSach() {
       List<TheMuonSach> danhSachMuon = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try{
            PreparedStatement preparedStatement = connection.prepareStatement(DANH_SACH_MUON);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                String maMuonSach = resultSet.getString(1);
                String maSach = resultSet.getString(2);
                String tenSach = resultSet.getString(3);
                String tacGia = resultSet.getString(4);
                int maHocSinh = resultSet.getInt(5);
                String tenHocSinh = resultSet.getString(6);
                String tenLop = resultSet.getString(7);
                Date ngayMuon = resultSet.getDate(8);
                Date ngayTra = resultSet.getDate(9);
                boolean trangThai = resultSet.getBoolean(10);
                danhSachMuon.add(new TheMuonSach(maMuonSach,new Sach(maSach,tenSach,tacGia),new HocSinh(maHocSinh,tenHocSinh,tenLop),trangThai,ngayMuon,ngayTra));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return danhSachMuon;
    }

    @Override
    public TheMuonSach theMuonSach(String maSach) {
        return null;
    }
}

package com.example.form.repository.impl;

import com.example.form.model.Sach;
import com.example.form.repository.BaseRepository;
import com.example.form.repository.ISachRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SachRepository implements ISachRepository {
    private static final String DANH_SACH_SACH = "select * from sach";
    @Override
    public List<Sach> danhSachSach() {
        List<Sach> danhSachSach = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try{
            PreparedStatement preparedStatement = connection.prepareStatement(DANH_SACH_SACH);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                String maSach = resultSet.getString(1);
                String tenSach = resultSet.getString(2);
                String tacGia = resultSet.getString(3);
                String moTa = resultSet.getString(4);
                int soLuong = resultSet.getInt(5);
                danhSachSach.add(new Sach(maSach,tenSach,tacGia,moTa,soLuong));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return danhSachSach;
    }
}

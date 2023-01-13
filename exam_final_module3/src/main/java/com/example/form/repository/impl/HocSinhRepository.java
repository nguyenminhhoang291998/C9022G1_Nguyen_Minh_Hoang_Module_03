package com.example.form.repository.impl;

import com.example.form.model.HocSinh;
import com.example.form.model.Sach;
import com.example.form.repository.BaseRepository;
import com.example.form.repository.IHocSinhRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HocSinhRepository implements IHocSinhRepository {
    private static final String DANH_SACH_HOC_SINH = "select * from hoc_sinh";
    @Override
    public List<HocSinh> danhSachHocSinh() {
        List<HocSinh> danhSachHocSinh = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try{
            PreparedStatement preparedStatement = connection.prepareStatement(DANH_SACH_HOC_SINH);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int maHocSinh = resultSet.getInt(1);
                String tenHocSinh = resultSet.getString(2);
              danhSachHocSinh.add(new HocSinh(maHocSinh,tenHocSinh));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return danhSachHocSinh;
    }
}

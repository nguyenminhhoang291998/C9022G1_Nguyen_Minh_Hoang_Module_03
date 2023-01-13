package com.example.form.repository.impl;

import com.example.form.model.XuatXu;
import com.example.form.repository.BaseRepository;
import com.example.form.repository.IXuatXuRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class XuatXuRepository implements IXuatXuRepository {
    private final String LAY_DANH_SACH_XUAT_XU = "SELECT * from xuat_xu_heo";

    @Override
    public List<XuatXu> danhSachXuatXu() {
        List<XuatXu> danhSachXuatXu = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(LAY_DANH_SACH_XUAT_XU);
            ResultSet resultSet =preparedStatement.executeQuery();
            while (resultSet.next()){
                int maXuatXu = resultSet.getInt(1);
                String tenXuatXu = resultSet.getString(2);
                danhSachXuatXu.add(new XuatXu(maXuatXu,tenXuatXu));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return danhSachXuatXu;
    }
}

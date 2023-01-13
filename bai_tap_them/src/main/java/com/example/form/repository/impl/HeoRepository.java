package com.example.form.repository.impl;

import com.example.form.model.Heo;
import com.example.form.model.XuatXu;
import com.example.form.repository.BaseRepository;
import com.example.form.repository.IHeoRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class HeoRepository implements IHeoRepository {
    private final String LAY_DANH_SACH_HEO = "select h.* , x.ten_nuoc from heo h join xuat_xu_heo x on h.ma_xuat_xu = x.ma_xuat_xu;";
    private final String TIM_KIEM_DANH_SACH_HEO = "select h.* , x.ten_nuoc from heo h join xuat_xu_heo x on h.ma_xuat_xu = x.ma_xuat_xu \n" +
            "WHErE h.ma_heo like ? and x.ten_nuoc like ?;";
    private final String LAY_HEO_THEO_MA = "select h.* , x.ten_nuoc from heo h join xuat_xu_heo x on h.ma_xuat_xu = x.ma_xuat_xu WHERE ma_heo = ?;";
    private final String SUA_HEO = "update heo set ngay_nhap_chuong = ?, trong_luong_khi_nhap = ?, thoi_gian_xuat_chuong = ?, trong_luong_khi_xuat = ? , ma_xuat_xu = ? where ma_heo = ?; ";
    private final String XOA_HEO = "DELETE from heo where id = ?";

    @Override
    public List<Heo> layDanhSachHeo() {
        List<Heo> danhSachHeo = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(LAY_DANH_SACH_HEO);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                String maHeo = resultSet.getString(1);
                Date ngayNhapChuong = resultSet.getDate(2);
                int trongLuongKhiNhap = resultSet.getInt(3);
                Date ngayXuatChuong = resultSet.getDate(4);
                int trongLuongKhiXuat = resultSet.getInt(5);
                int maXuatXu = resultSet.getInt(6);
                String tenXuatXu = resultSet.getString(7);
                danhSachHeo.add(new Heo(maHeo,ngayNhapChuong,trongLuongKhiNhap,ngayXuatChuong,trongLuongKhiXuat,new XuatXu(maXuatXu,tenXuatXu)));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return danhSachHeo;
    }

    public boolean suaHeo(Heo heo){
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SUA_HEO);
            preparedStatement.setDate(1,heo.getNgayNhapChuong());
            preparedStatement.setInt(2,heo.getTrongLuongKhiNhap());
            preparedStatement.setDate(3,heo.getNgayXuatChuong());
            preparedStatement.setInt(4,heo.getTrongLuongKhiXuat());
            preparedStatement.setInt(5,heo.getXuatXu().getMaXuatXu());
            preparedStatement.setString(6,heo.getMaSo());
            return preparedStatement.executeUpdate() >0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean xoaHeo(String maHeo){
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(XOA_HEO);
            preparedStatement.setString(1,maHeo);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Heo timHeoTheoMa(String maHeo) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(LAY_HEO_THEO_MA);
            preparedStatement.setString(1,maHeo);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()){
                Date ngayNhapChuong = resultSet.getDate(2);
                int trongLuongKhiNhap = resultSet.getInt(3);
                Date ngayXuatChuong = resultSet.getDate(4);
                int trongLuongKhiXuat = resultSet.getInt(5);
                int maXuatXu = resultSet.getInt(6);
                String tenXuatXu = resultSet.getString(7);
                return new Heo(maHeo,ngayNhapChuong,trongLuongKhiNhap,ngayXuatChuong,trongLuongKhiXuat,new XuatXu(maXuatXu,tenXuatXu));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    @Override
    public List<Heo> timKiemHeo(String tinhTrangHeo, String maHeo, String xuatXu) {
        List<Heo> danhSachHeo = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(TIM_KIEM_DANH_SACH_HEO);
//            preparedStatement.setString(1,'%'+tinhTrangHeo+'%');
            preparedStatement.setString(1,'%'+maHeo+'%');
            preparedStatement.setString(2,'%'+xuatXu+'%');
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                String maSoHeo = resultSet.getString(1);
                Date ngayNhapChuong = resultSet.getDate(2);
                int trongLuongKhiNhap = resultSet.getInt(3);
                Date ngayXuatChuong = resultSet.getDate(4);
                int trongLuongKhiXuat = resultSet.getInt(5);
                int maXuatXu = resultSet.getInt(6);
                String tenXuatXu = resultSet.getString(7);
                danhSachHeo.add(new Heo(maSoHeo,ngayNhapChuong,trongLuongKhiNhap,ngayXuatChuong,trongLuongKhiXuat,new XuatXu(maXuatXu,tenXuatXu)));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return danhSachHeo;
    }

}

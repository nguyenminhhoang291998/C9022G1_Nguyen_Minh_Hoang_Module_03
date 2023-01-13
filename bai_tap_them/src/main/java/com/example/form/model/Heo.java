package com.example.form.model;


import java.sql.Date;

public class Heo {
    private String maSo;
    private Date ngayNhapChuong;
    private int trongLuongKhiNhap;
    private Date ngayXuatChuong;
    private int trongLuongKhiXuat;
    private XuatXu xuatXu;

    public Heo(String maSo, Date ngayNhapChuong, int trongLuongKhiNhap, Date ngayXuatChuong, int trongLuongKhiXuat, XuatXu xuatXu) {
        this.maSo = maSo;
        this.ngayNhapChuong = ngayNhapChuong;
        this.trongLuongKhiNhap = trongLuongKhiNhap;
        this.ngayXuatChuong = ngayXuatChuong;
        this.trongLuongKhiXuat = trongLuongKhiXuat;
        this.xuatXu = xuatXu;
    }

    public String getMaSo() {
        return maSo;
    }

    public void setMaSo(String maSo) {
        this.maSo = maSo;
    }

    public Date getNgayNhapChuong() {
        return ngayNhapChuong;
    }

    public void setNgayNhapChuong(Date ngayNhapChuong) {
        this.ngayNhapChuong = ngayNhapChuong;
    }

    public int getTrongLuongKhiNhap() {
        return trongLuongKhiNhap;
    }

    public void setTrongLuongKhiNhap(int trongLuongKhiNhap) {
        this.trongLuongKhiNhap = trongLuongKhiNhap;
    }

    public Date getNgayXuatChuong() {
        return ngayXuatChuong;
    }

    public void setNgayXuatChuong(Date ngayXuatChuong) {
        this.ngayXuatChuong = ngayXuatChuong;
    }

    public int getTrongLuongKhiXuat() {
        return trongLuongKhiXuat;
    }

    public void setTrongLuongKhiXuat(int trongLuongKhiXuat) {
        this.trongLuongKhiXuat = trongLuongKhiXuat;
    }

    public XuatXu getXuatXu() {
        return xuatXu;
    }

    public void setXuatXu(XuatXu xuatXu) {
        this.xuatXu = xuatXu;
    }
}

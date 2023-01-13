package com.example.form.model;

public class HocSinh {
    private int maHocSinh;
    private String tenHocSinh;
    private String lop;

    public HocSinh(int maHocSinh, String tenHocSinh, String lop) {
        this.maHocSinh = maHocSinh;
        this.tenHocSinh = tenHocSinh;
        this.lop = lop;
    }

    public HocSinh(int maHocSinh, String tenHocSinh) {
        this.maHocSinh = maHocSinh;
        this.tenHocSinh = tenHocSinh;
    }

    public int getMaHocSinh() {
        return maHocSinh;
    }

    public void setMaHocSinh(int maHocSinh) {
        this.maHocSinh = maHocSinh;
    }

    public String getTenHocSinh() {
        return tenHocSinh;
    }

    public void setTenHocSinh(String tenHocSinh) {
        this.tenHocSinh = tenHocSinh;
    }

    public String getLop() {
        return lop;
    }

    public void setLop(String lop) {
        this.lop = lop;
    }
}

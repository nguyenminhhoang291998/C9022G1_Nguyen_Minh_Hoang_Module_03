package com.example.form.service;

import com.example.form.model.Heo;

import java.util.List;

public interface IHeoService {
    List<Heo> layDanhSachHeo();

    boolean suaHeo(Heo heo);

    boolean xoaHeo(String maHeo);

    Heo timHeoTheoMa(String maHeo);

    List<Heo> timKiemHeo(String tinhTrangHeo,String maHeo ,String xuatXu );
}

package com.example.form.repository;

import com.example.form.model.Heo;

import java.util.List;

public interface IHeoRepository {
    List<Heo> layDanhSachHeo();

    boolean suaHeo(Heo heo);
    boolean xoaHeo(String maHeo);

    Heo timHeoTheoMa(String maHeo);

    List<Heo> timKiemHeo(String tinhTrangHeo,String maHeo ,String xuatXu );
}

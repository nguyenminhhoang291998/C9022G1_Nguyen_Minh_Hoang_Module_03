package com.example.form.service.impl;

import com.example.form.model.Heo;
import com.example.form.repository.IHeoRepository;
import com.example.form.repository.impl.HeoRepository;
import com.example.form.service.IHeoService;

import java.util.List;

public class HeoService implements IHeoService {
    IHeoRepository heoRepository = new HeoRepository();
    @Override
    public List<Heo> layDanhSachHeo() {
        return this.heoRepository.layDanhSachHeo();
    }

    public boolean suaHeo(Heo heo){
        return this.heoRepository.suaHeo(heo);
    }

    @Override
    public boolean xoaHeo(String maHeo) {
        return this.heoRepository.xoaHeo(maHeo);
    }

    @Override
    public Heo timHeoTheoMa(String maHeo) {
        return this.heoRepository.timHeoTheoMa(maHeo);
    }

    @Override
    public List<Heo> timKiemHeo(String tinhTrangHeo, String maHeo, String xuatXu) {
        return this.heoRepository.timKiemHeo(tinhTrangHeo,maHeo,xuatXu);
    }


}

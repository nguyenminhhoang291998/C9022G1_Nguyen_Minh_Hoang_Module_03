package com.example.form.controller;

import com.example.form.model.Heo;
import com.example.form.model.XuatXu;
import com.example.form.service.IHeoService;
import com.example.form.service.IXuatXuService;
import com.example.form.service.impl.HeoService;
import com.example.form.service.impl.XuatXuService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;


@WebServlet(name = "heoServlet", value = "/heo")
public class heoServlet extends HttpServlet {
    IHeoService heoService = new HeoService();
    IXuatXuService xuatXuService = new XuatXuService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "edit":
                hienThiSuaHeo(request,response);
                break;
            default:
                hienThiDanhSachHeo(request,response);
                break;
        }
    }

    private void hienThiSuaHeo(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("danhSachXuatXu",this.xuatXuService.danhSachXuatXu());
        String maHeo = request.getParameter("id");
        request.setAttribute("heo", this.heoService.timHeoTheoMa(maHeo));
        try {
            request.getRequestDispatcher("view/detail.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void hienThiDanhSachHeo(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("danhSachXuatXu",this.xuatXuService.danhSachXuatXu());
        request.setAttribute("danhSachHeo",this.heoService.layDanhSachHeo());
        try {
            request.getRequestDispatcher("view/home.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "delete":
                xoaHeo(request,response);
                break;
            case "edit":
                suaHeo(request,response);
                break;
            case "find":
                timHeo(request,response);
                break;
            default:
                hienThiDanhSachHeo(request,response);
                break;
        }
    }

    private void timHeo(HttpServletRequest request, HttpServletResponse response) {
        String tinhTrangHeo = request.getParameter("tinhTrangHeo");
        String maHeo = request.getParameter("maHeo");
        String xuatXu = request.getParameter("xuatXu");
        request.setAttribute("danhSachHeo",this.heoService.timKiemHeo(tinhTrangHeo,maHeo,xuatXu));
        try {
            request.getRequestDispatcher("view/home.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void suaHeo(HttpServletRequest request, HttpServletResponse response) {
        String maHeo = request.getParameter("maHeo");
        Date ngayNhapChuong = java.sql.Date.valueOf(request.getParameter("ngayNhapChuong"));
        int trongLuongKhiNhap = Integer.parseInt(request.getParameter("trongLuongKhiNhap"));
        Date ngayXuatChuong = Date.valueOf(request.getParameter("ngayXuatChuong"));
        int trongLuongKhiXuat = Integer.parseInt(request.getParameter("trongLuongKhiXuat"));
        int maXuatXu = Integer.parseInt(request.getParameter("xuatXu"));
         boolean check = this.heoService.suaHeo(new Heo(maHeo,ngayNhapChuong,trongLuongKhiNhap,ngayXuatChuong,trongLuongKhiXuat,new XuatXu(maXuatXu,"")));
        if(check){
            request.setAttribute("message", "Sửa thành công.");
        }else {
            request.setAttribute("message", "Sửa không thành công.");
        }
        hienThiDanhSachHeo(request,response);
    }

    private void xoaHeo(HttpServletRequest request, HttpServletResponse response) {
        String idXoa = request.getParameter("deleteId");
        boolean check = this.heoService.xoaHeo(idXoa);
        if(check){
            request.setAttribute("message", "Xóa thành công.");
        }else {
            request.setAttribute("message", "Xóa không thành công.");
        }
        hienThiDanhSachHeo(request,response);
    }
}

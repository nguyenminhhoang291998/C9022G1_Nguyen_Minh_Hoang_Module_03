package com.example.form.controller;

import com.example.form.model.Sach;
import com.example.form.service.IHocSinhService;
import com.example.form.service.ISachService;
import com.example.form.service.ITheMuonSachService;
import com.example.form.service.impl.HocSinhService;
import com.example.form.service.impl.SachService;
import com.example.form.service.impl.TheMuonSachService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SachServlet", value = "/sach")
public class SachServlet extends HttpServlet {
    ISachService sachService = new SachService();
    IHocSinhService hocSinhService = new HocSinhService();
    ITheMuonSachService theMuonSachService = new TheMuonSachService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
         action = "";
        }
        switch (action){
            case "muon":
                hienTHiMuonSach(request, response);
            case "danhSachMuon":
                hienTHiDanhSachMuon(request,response);
            default:
                hienThiSach(request,response);
                break;
        }
    }

    private void hienTHiDanhSachMuon(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("danhSachMuonSach", this.theMuonSachService.danhSachTheMuonSach());
        try {
            request.getRequestDispatcher("view/danhSachMuon.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void hienTHiMuonSach(HttpServletRequest request, HttpServletResponse response) {
        String maSach = request.getParameter("id");
        String tenSach = request.getParameter("name");
        request.setAttribute("sachMuon",new Sach(maSach,tenSach));
        request.setAttribute("danhSachHocSinh", this.hocSinhService.danhSachHocSinh());

        try {
            request.getRequestDispatcher("view/muonSach.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void hienThiSach(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("danhSachSach", this.sachService.danhSachSach());
        try {
            request.getRequestDispatcher("view/home.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            default:
                hienThiSach(request,response);
                break;
            case "muon":
                themMuonSach(request,response);
                break;
        }
    }

    private void themMuonSach(HttpServletRequest request, HttpServletResponse response) {

    }
}

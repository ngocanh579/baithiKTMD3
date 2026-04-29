package com.quanly_matbang.controller;

import com.quanly_matbang.model.MatBang;
import com.quanly_matbang.service.MatBangService;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "MatBangServlet", value = "/mat-bang")
public class MatBangServlet extends HttpServlet {

    private final MatBangService service = new MatBangService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");

        try {
            if (action == null) action = "list";

            switch (action) {

                case "list":
                    list(request, response);
                    break;

                case "delete":
                    delete(request, response);
                    break;

                case "search":
                    search(request, response);
                    break;

                case "create":
                    request.getRequestDispatcher("/view/create.jsp").forward(request, response);
                    break;

                default:
                    response.sendRedirect(request.getContextPath() + "/mat-bang?action=list");
                    break;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");

        try {
            if (action == null) action = "";

            switch (action) {
                case "add":
                    add(request, response);
                    break;
                default:
                    response.sendRedirect(request.getContextPath() + "/mat-bang?action=list");
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/view/create.jsp").forward(request, response);
        }
    }

    private void add(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        String maMatBang = null, trangThai = null, dienTichStr = null, tangStr = null;
        String loaiMatBang = null, giaTienStr = null, ngayBatDauStr = null, ngayKetThucStr = null;

        MatBang matbang = new MatBang();

        try {
            maMatBang = request.getParameter("maMatBang");
            trangThai = request.getParameter("trangThai");
            dienTichStr = request.getParameter("dienTich");
            tangStr = request.getParameter("tang");
            loaiMatBang = request.getParameter("loaiMatBang");
            giaTienStr = request.getParameter("giaTien");
            ngayBatDauStr = request.getParameter("ngayBatDau");
            ngayKetThucStr = request.getParameter("ngayKetThuc");

            if (maMatBang == null || maMatBang.trim().isEmpty()) {
                throw new Exception("Mã mặt bằng không được để trống");
            }
            if (ngayBatDauStr == null || ngayBatDauStr.trim().isEmpty()) {
                throw new Exception("Ngày bắt đầu không được để trống");
            }
            if (ngayKetThucStr == null || ngayKetThucStr.trim().isEmpty()) {
                throw new Exception("Ngày kết thúc không được để trống");
            }

            matbang.setMaMatBang(maMatBang.trim());
            matbang.setTrangThai(trangThai);
            matbang.setDienTich(Double.parseDouble(dienTichStr));
            matbang.setTang(Integer.parseInt(tangStr));
            matbang.setLoaiMatBang(loaiMatBang);
            matbang.setGiaTien(Double.parseDouble(giaTienStr));

            LocalDate start = LocalDate.parse(ngayBatDauStr.trim());
            LocalDate end = LocalDate.parse(ngayKetThucStr.trim());
            matbang.setNgayBatDau(Date.valueOf(start));
            matbang.setNgayKetThuc(Date.valueOf(end));

            service.add(matbang);

            response.sendRedirect(request.getContextPath() + "/mat-bang?action=list");

        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());

            request.setAttribute("maMatBang", maMatBang);
            request.setAttribute("trangThai", trangThai);
            request.setAttribute("dienTich", dienTichStr);
            request.setAttribute("tang", tangStr);
            request.setAttribute("loaiMatBang", loaiMatBang);
            request.setAttribute("giaTien", giaTienStr);
            request.setAttribute("ngayBatDau", ngayBatDauStr);
            request.setAttribute("ngayKetThuc", ngayKetThucStr);

            request.getRequestDispatcher("/view/create.jsp").forward(request, response);
        }
    }

    private void list(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        List<MatBang> list = service.getAll();

        if (list == null) list = new ArrayList<>();

        request.setAttribute("list", list);
        request.getRequestDispatcher("/view/list.jsp").forward(request, response);
    }

    private void search(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        String loai = request.getParameter("loai");
        String giaStr = request.getParameter("gia");
        String tangStr = request.getParameter("tang");

        Double gia = null;
        if (giaStr != null && !giaStr.trim().isEmpty()) {
            gia = Double.parseDouble(giaStr);
        }

        Integer tang = null;
        if (tangStr != null && !tangStr.trim().isEmpty()) {
            tang = Integer.parseInt(tangStr);
        }

        if (loai != null && loai.trim().isEmpty()) loai = null;

        request.setAttribute("searchLoai", loai);
        request.setAttribute("searchGia", giaStr);
        request.setAttribute("searchTang", tangStr);

        List<MatBang> list = service.search(loai, gia, tang);
        request.setAttribute("list", list != null ? list : new ArrayList<>());

        request.getRequestDispatcher("/view/list.jsp").forward(request, response);
    }

    private void delete(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        String ma = request.getParameter("ma");

        service.delete(ma);

        response.sendRedirect(request.getContextPath() + "/mat-bang?action=list");
    }
}
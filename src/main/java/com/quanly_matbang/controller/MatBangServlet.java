package com.quanly_matbang.controller;

import com.quanly_matbang.model.MatBang;
import com.quanly_matbang.service.MatBangService;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
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
        System.out.println("POST action = " + action);

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

        MatBang matbang = new MatBang();

        matbang.setMaMatBang(request.getParameter("maMatBang"));
        matbang.setTrangThai(request.getParameter("trangThai"));
        matbang.setDienTich(Double.parseDouble(request.getParameter("dienTich")));
        matbang.setTang(Integer.parseInt(request.getParameter("tang")));
        matbang.setLoaiMatBang(request.getParameter("loaiMatBang"));
        matbang.setGiaTien(Double.parseDouble(request.getParameter("giaTien")));

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");

        LocalDate start = LocalDate.parse(request.getParameter("ngayBatDau"), formatter);
        LocalDate end = LocalDate.parse(request.getParameter("ngayKetThuc"), formatter);

        matbang.setNgayBatDau(Date.valueOf(start));
        matbang.setNgayKetThuc(Date.valueOf(end));

        service.add(matbang);

        response.sendRedirect(request.getContextPath() + "/mat-bang?action=list");
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
        if (loai != null && loai.isEmpty()) loai = null;

        Double gia = null;
        String giaStr = request.getParameter("gia");
        if (giaStr != null && !giaStr.isEmpty()) {
            gia = Double.parseDouble(giaStr);
        }

        Integer tang = null;
        String tangStr = request.getParameter("tang");
        if (tangStr != null && !tangStr.isEmpty()) {
            tang = Integer.parseInt(tangStr);
        }

        List<MatBang> list = service.search(loai, gia, tang);

        if (list == null) list = new ArrayList<>();

        request.setAttribute("list", list);
        request.getRequestDispatcher("/view/list.jsp").forward(request, response);
    }

    private void delete(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        String ma = request.getParameter("ma");

        service.delete(ma);

        response.sendRedirect(request.getContextPath() + "/mat-bang?action=list");
    }
}
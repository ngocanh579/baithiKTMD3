package com.quanly_matbang.service;

import com.quanly_matbang.dao.MatBangDAO;
import com.quanly_matbang.model.MatBang;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.List;

public class MatBangService {
    MatBangDAO dao = new MatBangDAO();

    public void add(MatBang matbang) throws Exception {
        if (dao.isExist(matbang.getMaMatBang())) {
            throw new Exception("Mã đã tồn tại");
        }
        java.sql.Date ngayBatDau = matbang.getNgayBatDau();
        java.sql.Date ngayKetThuc = matbang.getNgayKetThuc();

        if (ngayBatDau == null || ngayKetThuc == null) {
            throw new Exception("Ngày không được để trống");
        }

        LocalDate start = ngayBatDau.toLocalDate();
        LocalDate end = ngayKetThuc.toLocalDate();

        System.out.println("Service dates: " + start + " → " + end);

        if (end.isBefore(start.plusMonths(6))) {
            throw new Exception("Ngày kết thúc phải sau ngày bắt đầu ít nhất 6 tháng");
        }

        System.out.println("== BEFORE DAO ==");
        dao.insert(matbang);
        System.out.println("== AFTER DAO ==");
    }
    public List<MatBang> search(String loai, Double gia, Integer tang) throws Exception {
        return dao.search(loai, gia, tang);
    }

    public void delete(String ma) throws Exception {
        dao.delete(ma);
    }

    public List<MatBang> getAll() throws Exception {
        return dao.getAll();
    }
}

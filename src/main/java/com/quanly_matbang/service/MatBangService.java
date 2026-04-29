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

        LocalDate start = matbang.getNgayBatDau().toInstant()
                .atZone(ZoneId.systemDefault())
                .toLocalDate();

        LocalDate end = matbang.getNgayKetThuc().toInstant()
                .atZone(ZoneId.systemDefault())
                .toLocalDate();

        if (java.time.temporal.ChronoUnit.MONTHS.between(start, end) < 6) {
            throw new Exception("Ngày bắt đầu phải nhỏ hơn ngày kết thúc ít nhất 6 tháng");
        }

        dao.insert(matbang);
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

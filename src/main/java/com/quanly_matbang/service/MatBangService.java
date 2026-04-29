package com.quanly_matbang.service;

import com.quanly_matbang.dao.MatBangDAO;
import com.quanly_matbang.model.MatBang;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

public class MatBangService {
    MatBangDAO dao = new MatBangDAO();

    public void add(MatBang matbang) throws Exception {
        if (dao.isExist(matbang.getMaMatBang())) {
            throw new Exception("Mã mặt bằng đã tồn tại");
        }

        java.sql.Date ngayBatDau = matbang.getNgayBatDau();
        java.sql.Date ngayKetThuc = matbang.getNgayKetThuc();

        if (ngayBatDau == null || ngayKetThuc == null) {
            throw new Exception("Ngày bắt đầu và ngày kết thúc không được để trống");
        }

        LocalDate start = ngayBatDau.toLocalDate();
        LocalDate end = ngayKetThuc.toLocalDate();

        if (end.isBefore(start.plusMonths(6))) {
            throw new Exception("Thời hạn hợp đồng tối thiểu 6 tháng");
        }

        dao.insert(matbang);
    }
    public List<MatBang> search(String loai, Double gia, Integer tang) throws Exception {
        List<MatBang> all = getAll();
        List<MatBang> result = new ArrayList<>();

        for (MatBang matbang : all) {
            boolean check = true;

            if (loai != null && !loai.trim().isEmpty()) {
                check &= matbang.getLoaiMatBang().equals(loai);
            }

            if (gia != null) {
                check &= matbang.getGiaTien() == gia;
            }

            if (tang != null) {
                check &= matbang.getTang() == tang;
            }

            if (check) {
                result.add(matbang);
            }
        }

        result.sort(Comparator.comparingDouble(MatBang::getDienTich));
        return result;
    }

    public void delete(String ma) throws Exception {
        dao.delete(ma);
    }

    public List<MatBang> getAll() throws Exception {
        return dao.getAll();
    }
}

package com.quanly_matbang.dao;

import com.quanly_matbang.model.MatBang;
import com.quanly_matbang.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.ArrayList;

public class MatBangDAO {
    Connection conn = DBConnection.getConnection();

    public List<MatBang> getAll() throws Exception {

        String sql = "select * from mat_bang order by dien_tich asc";
        PreparedStatement ps = conn.prepareStatement(sql);

        ResultSet rs = ps.executeQuery();

        List<MatBang> list = new ArrayList<>();

        while (rs.next()) {
            MatBang matbang = new MatBang();

            matbang.setMaMatBang(rs.getString("ma_mat_bang"));
            matbang.setTrangThai(rs.getString("trang_thai"));
            matbang.setDienTich(rs.getDouble("dien_tich"));
            matbang.setTang(rs.getInt("tang"));
            matbang.setLoaiMatBang(rs.getString("loai_mat_bang"));
            matbang.setGiaTien(rs.getDouble("gia_tien"));
            matbang.setNgayBatDau(rs.getDate("ngay_bat_dau"));
            matbang.setNgayKetThuc(rs.getDate("ngay_ket_thuc"));

            list.add(matbang);
        }

        return list;
    }

    public void insert(MatBang matbang) throws Exception {
        String sql = "insert into mat_bang " +
                "(ma_mat_bang, trang_thai, dien_tich, tang, loai_mat_bang, gia_tien, ngay_bat_dau, ngay_ket_thuc) " +
                "values (?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(sql);

        ps.setString(1, matbang.getMaMatBang());
        ps.setString(2, matbang.getTrangThai());
        ps.setDouble(3, matbang.getDienTich());
        ps.setInt(4, matbang.getTang());
        ps.setString(5, matbang.getLoaiMatBang());
        ps.setDouble(6, matbang.getGiaTien());
        ps.setDate(7, matbang.getNgayBatDau());
        ps.setDate(8, matbang.getNgayKetThuc());

        ps.executeUpdate();
    }
    public boolean isExist(String ma) throws Exception {
        String sql = "select count(*) from mat_bang where ma_mat_bang = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, ma);

        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return rs.getInt(1) > 0;
        }
        return false;
    }

    public List<MatBang> search(String loai, Double gia, Integer tang) throws Exception {

        String sql = "select * from mat_bang where 1=1";
        if (loai != null && !loai.isEmpty()) {
            sql += " and loai_mat_bang = ?";
        }
        if (gia != null) {
            sql += " and gia_tien <= ?";
        }
        if (tang != null) {
            sql += " and tang = ?";
        }

        sql += " order by dien_tich asc";
        PreparedStatement ps = conn.prepareStatement(sql);

        int i = 1;
        if (loai != null && !loai.isEmpty()) ps.setString(i++, loai);
        if (gia != null) ps.setDouble(i++, gia);
        if (tang != null) ps.setInt(i++, tang);

        ResultSet rs = ps.executeQuery();

        List<MatBang> list = new ArrayList<>();

        while (rs.next()) {
            MatBang matbang = new MatBang();

            matbang.setMaMatBang(rs.getString("ma_mat_bang"));
            matbang.setTrangThai(rs.getString("trang_thai"));
            matbang.setDienTich(rs.getDouble("dien_tich"));
            matbang.setTang(rs.getInt("tang"));
            matbang.setLoaiMatBang(rs.getString("loai_mat_bang"));
            matbang.setGiaTien(rs.getDouble("gia_tien"));
            matbang.setNgayBatDau(rs.getDate("ngay_bat_dau"));
            matbang.setNgayKetThuc(rs.getDate("ngay_ket_thuc"));

            list.add(matbang);
        }
        return list;
    }
    public void delete(String ma) throws Exception {
        String sql = "delete from mat_bang where ma_mat_bang = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, ma);
        ps.executeUpdate();
    }
}

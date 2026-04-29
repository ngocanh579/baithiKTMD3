package com.quanly_matbang.model;

import java.sql.Date;

public class MatBang {
    private int id;
    private String maMatBang;
    private String trangThai;
    private double dienTich;
    private int tang;
    private String loaiMatBang;
    private double giaTien;
    private Date ngayBatDau;
    private Date ngayKetThuc;

    public MatBang() {
    }

    public MatBang(int id, String maMatBang, String trangThai, double dienTich, int tang, String loaiMatBang, double giaTien, Date ngayBatDau, Date ngayKetThuc) {
        this.id = id;
        this.maMatBang = maMatBang;
        this.trangThai = trangThai;
        this.dienTich = dienTich;
        this.tang = tang;
        this.loaiMatBang = loaiMatBang;
        this.giaTien = giaTien;
        this.ngayBatDau = ngayBatDau;
        this.ngayKetThuc = ngayKetThuc;
    }

    public MatBang(String maMatBang, String trangThai, double dienTich, int tang, String loaiMatBang, double giaTien, Date ngayBatDau, Date ngayKetThuc) {
        this.maMatBang = maMatBang;
        this.trangThai = trangThai;
        this.dienTich = dienTich;
        this.tang = tang;
        this.loaiMatBang = loaiMatBang;
        this.giaTien = giaTien;
        this.ngayBatDau = ngayBatDau;
        this.ngayKetThuc = ngayKetThuc;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMaMatBang() {
        return maMatBang;
    }

    public void setMaMatBang(String maMatBang) {
        this.maMatBang = maMatBang;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }

    public double getDienTich() {
        return dienTich;
    }

    public void setDienTich(double dienTich) {
        this.dienTich = dienTich;
    }

    public int getTang() {
        return tang;
    }

    public void setTang(int tang) {
        this.tang = tang;
    }

    public String getLoaiMatBang() {
        return loaiMatBang;
    }

    public void setLoaiMatBang(String loaiMatBang) {
        this.loaiMatBang = loaiMatBang;
    }

    public double getGiaTien() {
        return giaTien;
    }

    public void setGiaTien(double giaTien) {
        this.giaTien = giaTien;
    }

    public Date getNgayBatDau() {
        return ngayBatDau;
    }

    public void setNgayBatDau(Date ngayBatDau) {
        this.ngayBatDau = ngayBatDau;
    }

    public Date getNgayKetThuc() {
        return ngayKetThuc;
    }

    public void setNgayKetThuc(Date ngayKetThuc) {
        this.ngayKetThuc = ngayKetThuc;
    }

    @Override
    public String toString() {
        return "MatBang{" +
                "id=" + id +
                ", maMatBang='" + maMatBang + '\'' +
                ", trangThai='" + trangThai + '\'' +
                ", dienTich=" + dienTich +
                ", tang=" + tang +
                ", loaiMatBang='" + loaiMatBang + '\'' +
                ", giaTien=" + giaTien +
                ", ngayBatDau=" + ngayBatDau +
                ", ngayKetThuc=" + ngayKetThuc +
                '}';
    }
}

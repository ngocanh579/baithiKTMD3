<%--
  Created by IntelliJ IDEA.
  User: Welcome to Windows10
  Date: 04/29/2026
  Time: 7:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm mặt bằng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
<h2>THÊM MẶT BẰNG</h2>

<c:if test="${not empty error}">
    <div class="alert alert-danger">
        <strong>Lỗi:</strong> ${error}
    </div>
</c:if>

<form action="${pageContext.request.contextPath}/mat-bang" method="post" accept-charset="UTF-8">
    <input type="hidden" name="action" value="add">

    <div class="mb-3">
        <label class="form-label">Mã mặt bằng</label>
        <input type="text" class="form-control" name="maMatBang"
               value="${maMatBang}" required
               pattern="^[A-Z0-9]{2,3}-[A-Z0-9]{2}-[A-Z0-9]{2}$">
    </div>

    <div class="mb-3">
        <label class="form-label">Trạng thái</label>
        <select class="form-select" name="trangThai" required>
            <option value="">Chọn trạng thái</option>
            <option value="Trống" ${trangThai == 'Trống' ? 'selected' : ''}>Trống</option>
            <option value="Hạ tầng" ${trangThai == 'Hạ tầng' ? 'selected' : ''}>Hạ tầng</option>
            <option value="Đầy đủ" ${trangThai == 'Đầy đủ' ? 'selected' : ''}>Đầy đủ</option>
        </select>
    </div>

    <div class="mb-3">
        <label class="form-label">Diện tích</label>
        <input type="number" class="form-control" name="dienTich"
               value="${dienTich}" min="21" step="0.01" required>
    </div>

    <div class="mb-3">
        <label class="form-label">Tầng</label>
        <input type="number" class="form-control" name="tang"
               value="${tang}" min="1" max="15" required>
    </div>

    <div class="mb-3">
        <label class="form-label">Loại mặt bằng</label>
        <select class="form-select" name="loaiMatBang" required>
            <option value="">Chọn loại</option>
            <option value="Văn phòng chia sẻ" ${loaiMatBang == 'Văn phòng chia sẻ' ? 'selected' : ''}>Văn phòng chia sẻ</option>
            <option value="Văn phòng trọn gói" ${loaiMatBang == 'Văn phòng trọn gói' ? 'selected' : ''}>Văn phòng trọn gói</option>
        </select>
    </div>

    <div class="mb-3">
        <label class="form-label">Giá tiền</label>
        <input type="number" class="form-control" name="giaTien"
               value="${giaTien}" min="1000001" step="1000" required>
    </div>

    <div class="mb-3">
        <label class="form-label">Ngày bắt đầu</label>
        <input type="date" class="form-control" name="ngayBatDau"
               value="${ngayBatDau}" required>
    </div>

    <div class="mb-3">
        <label class="form-label">Ngày kết thúc</label>
        <input type="date" class="form-control" name="ngayKetThuc"
               value="${ngayKetThuc}" required>
    </div>

    <div class="mt-3">
        <button type="submit" class="btn btn-primary">Lưu</button>
        <a href="${pageContext.request.contextPath}/mat-bang?action=list" class="btn btn-secondary">Quay lại</a>
    </div>
</form>
</body>
</html>
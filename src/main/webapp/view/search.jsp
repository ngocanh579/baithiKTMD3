<%--
  Created by IntelliJ IDEA.
  User: Welcome to Windows10
  Date: 04/29/2026
  Time: 7:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>Tìm kiếm mặt bằng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${ctx}/style.css">
</head>
<body class="container">
<h2>🔍 TÌM KIẾM MẶT BẰNG</h2>

<div class="search-form">
    <form action="${ctx}/mat-bang" method="get">
        <input type="hidden" name="action" value="search">

        <div class="row g-3 mb-3">
            <div class="col-md-4">
                <label class="form-label fw-bold">Loại mặt bằng</label>
                <select name="loai" class="form-control">
                    <option value="">--Tất cả--</option>
                    <option value="Văn phòng chia sẻ" ${loai == 'Văn phòng chia sẻ' ? 'selected' : ''}>Văn phòng chia sẻ</option>
                    <option value="Văn phòng trọn gói" ${loai == 'Văn phòng trọn gói' ? 'selected' : ''}>Văn phòng trọn gói</option>
                </select>
            </div>

            <div class="col-md-4">
                <label class="form-label fw-bold">Giá tối đa</label>
                <input type="number" name="gia" class="form-control"
                       placeholder="VD: 5000000"
                       value="${gia}">
            </div>

            <div class="col-md-4">
                <label class="form-label fw-bold">Tầng</label>
                <input type="number" name="tang" class="form-control"
                       min="1" max="15"
                       value="${tang}">
            </div>
        </div>

        <div class="d-flex gap-2">
            <button type="submit" class="btn btn-primary search-btn">
                🔍 Tìm kiếm
            </button>
            <a href="${ctx}/mat-bang?action=list" class="btn btn-secondary">Reset</a>
        </div>
    </form>
</div>


<c:if test="${not empty list}">
    <div class="table-container mt-4">
        <h4 class="mb-3">📋 Kết quả tìm kiếm (<c:out value="${list.size()}"/> mặt bằng)</h4>
        <table>
            <tr>
                <th>Mã</th><th>Trạng thái</th><th>Diện tích</th><th>Tầng</th>
                <th>Loại</th><th>Giá</th><th>Ngày bắt đầu</th><th>Ngày kết thúc</th><th>Hành động</th>
            </tr>
            <c:forEach var="mb" items="${list}">
                <tr>
                    <td>${mb.maMatBang}</td>
                    <td>${mb.trangThai}</td>
                    <td>${mb.dienTich} m²</td>
                    <td>${mb.tang}</td>
                    <td>${mb.loaiMatBang}</td>
                    <td>${mb.giaTien:,} VNĐ</td>
                    <td>${mb.ngayBatDau}</td>
                    <td>${mb.ngayKetThuc}</td>
                    <td>
                        <a href="${ctx}/mat-bang?action=delete&ma=${mb.maMatBang}"
                           class="btn btn-danger btn-sm"
                           onclick="return confirm('Xóa ${mb.maMatBang}?')">
                            🗑️ Xóa
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</c:if>

<c:if test="${empty list}">
    <div class="alert alert-info text-center mt-4">
        <h5> Không tìm thấy mặt bằng nào!</h5>
        <p>Thử thay đổi điều kiện tìm kiếm.</p>
    </div>
</c:if>

<div class="btn-group mt-4">
    <a href="${ctx}/mat-bang?action=list" class="btn btn-secondary">← Quay lại danh sách</a>
    <a href="${ctx}/mat-bang?action=create" class="btn btn-primary">+ Thêm mới</a>
</div>
</body>
</html>
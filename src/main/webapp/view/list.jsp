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
    <title>Danh sách mặt bằng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${ctx}/style.css">
</head>
<body class="container">
<h2>QUẢN LÝ MẶT BẰNG</h2>

<div class="search-form mb-4">
    <form action="${ctx}/mat-bang" method="get">
        <input type="hidden" name="action" value="search">

        <div class="row g-3 mb-3">
            <div class="col-md-4">
                <label class="form-label fw-bold">Loại mặt bằng</label>
                <select name="loai" class="form-control">
                    <option value="">--Tất cả--</option>
                    <option value="Văn phòng chia sẻ" ${searchLoai == 'Văn phòng chia sẻ' ? 'selected' : ''}>Văn phòng chia sẻ</option>
                    <option value="Văn phòng trọn gói" ${searchLoai == 'Văn phòng trọn gói' ? 'selected' : ''}>Văn phòng trọn gói</option>
                </select>
            </div>

            <div class="col-md-4">
                <label class="form-label fw-bold">Giá tiền</label>
                <input type="number" name="gia" class="form-control"
                       placeholder="VD: 5000000"
                       min="1000000"
                       value="${searchGia}">
            </div>

            <div class="col-md-4">
                <label class="form-label fw-bold">Tầng</label>
                <input type="number" name="tang" class="form-control"
                       min="1" max="15"
                       value="${searchTang}">
            </div>
        </div>

        <div class="d-flex gap-2">
            <button type="submit" class="btn btn-primary">
                 Tìm kiếm
            </button>
            <a href="${ctx}/mat-bang?action=list" class="btn btn-secondary">↻ Reset</a>
        </div>
    </form>
</div>

<c:if test="${not empty param.action && param.action == 'search' && empty list}">
    <div class="alert alert-info text-center mb-4">
        <h5>Không tìm thấy mặt bằng nào!</h5>
        <p>Thử thay đổi điều kiện tìm kiếm.</p>
    </div>
</c:if>

<c:if test="${not empty param.action && param.action == 'search' && not empty list}">
    <div class="alert alert-success mb-4">
        <h5>Kết quả tìm kiếm (<c:out value="${list.size()}"/> mặt bằng)</h5>
    </div>
</c:if>

<div class="mb-3">
    <a href="${ctx}/mat-bang?action=create" class="btn btn-primary">+ Thêm mới</a>
</div>

<div class="table-container">
    <table class="table table-striped table-hover">
        <thead class="table-dark">
        <tr>
            <th>Mã</th>
            <th>Trạng thái</th>
            <th>Diện tích</th>
            <th>Tầng</th>
            <th>Loại</th>
            <th>Giá</th>
            <th>Ngày bắt đầu</th>
            <th>Ngày kết thúc</th>
            <th>Hành động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="mb" items="${list}">
            <tr>
                <td><strong>${mb.maMatBang}</strong></td>
                <td>
                    <span class="badge ${mb.trangThai == 'Trống' ? 'bg-success' : 'bg-warning'}">
                            ${mb.trangThai}
                    </span>
                </td>
                <td>${mb.dienTich} m²</td>
                <td>${mb.tang}</td>
                <td>${mb.loaiMatBang}</td>
                <td class="text-end fw-bold text-primary">${mb.giaTien} VNĐ</td>
                <td>${mb.ngayBatDau}</td>
                <td>${mb.ngayKetThuc}</td>
                <td>
                    <a href="${ctx}/mat-bang?action=delete&ma=${mb.maMatBang}"
                       class="btn btn-danger btn-sm"
                       onclick="return confirm('Bạn có chắc muốn xóa ${mb.maMatBang}?')">
                        Xóa
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<c:if test="${empty list}">
    <div class="alert alert-warning text-center mt-4">
        <h5>Chưa có dữ liệu mặt bằng nào!</h5>
        <p><a href="${ctx}/mat-bang?action=create" class="btn btn-primary">Thêm mặt bằng đầu tiên</a></p>
    </div>
</c:if>

</body>
</html>
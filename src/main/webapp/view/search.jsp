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
</head>
<body class="container mt-5">
<div class="row justify-content-center">
    <div class="col-md-8">
        <div class="card shadow">
            <div class="card-header bg-primary text-white text-center">
                <h3>🔍 Tìm kiếm mặt bằng</h3>
            </div>
            <div class="card-body">
                <form action="${ctx}/mat-bang" method="get" class="row g-3">
                    <input type="hidden" name="action" value="search">

                    <div class="col-md-4">
                        <label class="form-label fw-bold">Loại mặt bằng</label>
                        <select name="loai" class="form-select">
                            <option value="">--Tất cả--</option>
                            <option value="Văn phòng chia sẻ">Văn phòng chia sẻ</option>
                            <option value="Văn phòng trọn gói">Văn phòng trọn gói</option>
                        </select>
                    </div>

                    <div class="col-md-4">
                        <label class="form-label fw-bold">Giá tối đa</label>
                        <input type="number" name="gia" class="form-control" placeholder="VD: 5000000">
                    </div>

                    <div class="col-md-4">
                        <label class="form-label fw-bold">Tầng</label>
                        <input type="number" name="tang" class="form-control" min="1" max="15">
                    </div>

                    <div class="col-12 mt-3">
                        <div class="d-flex gap-2 justify-content-center">
                            <button type="submit" class="btn btn-primary btn-lg">
                                <i class="bi bi-search"></i> Tìm kiếm
                            </button>
                            <a href="${ctx}/mat-bang?action=list" class="btn btn-secondary btn-lg">← Danh sách</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
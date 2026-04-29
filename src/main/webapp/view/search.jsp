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

<body class="container">

<h3>TÌM KIẾM MẶT BẰNG</h3>

<form action="${ctx}/mat-bang" method="get">
    <input type="hidden" name="action" value="search"/>

    <div class="mb-2">
        <label>Loại mặt bằng</label>
        <select name="loai" class="form-control">
            <option value="" ${param.loai == null || param.loai == '' ? 'selected' : ''}>--Tất cả--</option>
            <option value="Văn phòng chia sẻ" ${param.loai == 'Văn phòng chia sẻ' ? 'selected' : ''}>Văn phòng chia sẻ</option>
            <option value="Văn phòng trọn gói" ${param.loai == 'Văn phòng trọn gói' ? 'selected' : ''}>Văn phòng trọn gói</option>
        </select>
    </div>

    <input type="number" name="gia" class="form-control"
           placeholder="Nhập giá"
           value="${param.gia}">

    <input type="number" name="tang" class="form-control"
           min="1" max="15"
           value="${param.tang}">

    <button type="submit" class="btn btn-primary">Tìm kiếm</button>
    <a href="${ctx}/mat-bang" class="btn btn-secondary">Reset</a>
</form>

</body>
</html>
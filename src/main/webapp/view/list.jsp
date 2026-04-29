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
    <link rel="stylesheet" href="style.css">
</head>
<body>

<h2>QUẢN LÝ MẶT BẰNG</h2>

<form action="${ctx}/mat-bang" method="get">
    <input type="hidden" name="action" value="search">

    Loại:
    <select name="loai">
        <option value="">--All--</option>
        <option value="Văn phòng chia sẻ">Văn phòng chia sẻ</option>
        <option value="Văn phòng trọn gói">Văn phòng trọn gói</option>
    </select>

    Giá:
    <input type="number" name="gia">

    Tầng:
    <input type="number" name="tang">

    <button type="submit">Search</button>
</form>

<br>

<a href="${ctx}/mat-bang?action=create">+ Thêm mới</a>
<a href="${ctx}/mat-bang?action=list">Reset</a>

<br><br>

<table border="1" cellpadding="5">
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

    <c:forEach var="mb" items="${list}">
        <tr>
            <td>${mb.maMatBang}</td>
            <td>${mb.trangThai}</td>
            <td>${mb.dienTich}</td>
            <td>${mb.tang}</td>
            <td>${mb.loaiMatBang}</td>
            <td>${mb.giaTien}</td>
            <td>${mb.ngayBatDau}</td>
            <td>${mb.ngayKetThuc}</td>

            <td>
                <a href="${ctx}/mat-bang?action=delete&ma=${mb.maMatBang}"
                   onclick="return confirm('Bạn có chắc muốn xóa ${mb.maMatBang}?')">
                    Delete
                </a>
            </td>
        </tr>
    </c:forEach>

</table>

</body>
</html>

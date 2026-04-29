<%--
  Created by IntelliJ IDEA.
  User: Welcome to Windows10
  Date: 04/29/2026
  Time: 7:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Thêm mặt bằng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>

<body class="container">

<h2>THÊM MẶT BẰNG</h2>

<c:if test="${not empty error}">
    <div style="color:red">${error}</div>
</c:if>

<form action="${pageContext.request.contextPath}/mat-bang" method="post">
    <input type="hidden" name="action" value="add">

    <div>
        <label>Mã mặt bằng</label>
        <input type="text"
               name="maMatBang"
               required
               pattern="^[A-Z0-9]{2,3}-[A-Z0-9]{2}-[A-Z0-9]{2}$"
               title="XXX-XX-XX (A-Z, 0-9)">
    </div>

    <div>
        <label>Trạng thái</label>
        <select name="trangThai" required>
            <option value="Trống">Trống</option>
            <option value="Hạ tầng">Hạ tầng</option>
            <option value="Đầy đủ">Đầy đủ</option>
        </select>
    </div>

    <div>
        <label>Diện tích</label>
        <input type="number" name="dienTich" min="21" required>
    </div>

    <div>
        <label>Tầng</label>
        <input type="number" name="tang" min="1" max="15" required>
    </div>

    <div>
        <label>Loại mặt bằng</label>
        <select name="loaiMatBang" required>
            <option value="Văn phòng chia sẻ">Văn phòng chia sẻ</option>
            <option value="Văn phòng trọn gói">Văn phòng trọn gói</option>
        </select>
    </div>

    <div>
        <label>Giá tiền</label>
        <input type="number" name="giaTien" min="1000001" required>
    </div>

    <div>
        <label>Ngày bắt đầu</label>
        <input type="text"
               name="ngayBatDau"
               placeholder="dd/mm/yyyy"
               pattern="^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/[0-9]{4}$"
               required>
    </div>

    <div>
        <label>Ngày kết thúc</label>
        <input type="text"
               name="ngayKetThuc"
               placeholder="dd/mm/yyyy"
               pattern="^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/[0-9]{4}$"
               required>
    </div>

    <br>

    <button type="submit">Lưu</button>
    <a href="${ctx}/mat-bang?action=list">Quay lại</a>

</form>

</body>
</html>
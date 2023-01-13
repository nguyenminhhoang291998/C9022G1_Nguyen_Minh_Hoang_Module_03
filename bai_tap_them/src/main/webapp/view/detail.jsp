<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 1/11/2023
  Time: 11:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <link rel="stylesheet" href="../bootstrap-5.1.3-dist/css/bootstrap.css">

</head>
<body>

<%--form edit--%>
<form class="container" style="width: 600px; border: 1px solid black;border-radius: 5px; background-color: #ded2d2" action="/heo?action=edit" method="post">
  <h2 class="text-center text-black">Chỉnh sửa thông tin</h2>

  <div class="form-group row m-2">
    <div class="col-md-6 col-form-label">Mã Heo</div>
    <div class="col-sm-6">
      <input type="text" class="form-control" name="maHeo" value="${heo.maSo}" readonly>
    </div>
  </div>

  <div class="form-group row m-2">
    <div class="col-md-6 col-form-label">Ngày nhập</div>
    <div class="col-sm-6">
      <input type="date" class="form-control" name="ngayNhapChuong" value="${heo.ngayNhapChuong}">
    </div>
  </div>

  <div class="form-group row m-2">
    <div class="col-md-6 col-form-label">Trọng lượng khi nhập</div>
    <div class="col-sm-6">
      <input type="number" oninput="checkTrongLuong(this.value)" class="form-control" name="trongLuongKhiNhap" value="${heo.trongLuongKhiNhap}">
      <span id="errorTrongLuong"></span>
    </div>
  </div>

  <div class="form-group row m-2">
    <div class="col-md-6 col-form-label">Ngày Xuất</div>
    <div class="col-sm-6">
      <input type="date" class="form-control" name="ngayXuatChuong" value="${heo.ngayXuatChuong}">
    </div>
  </div>

  <div class="form-group row m-2">
    <div class="col-md-6 col-form-label">Trọng lượng khi xuất</div>
    <div class="col-sm-6">
      <input type="text" required pattern="^[1-9]\d*$" title="Sai" class="form-control" name="trongLuongKhiXuat" value="${heo.trongLuongKhiXuat}">
    </div>
  </div>

  <div class="form-group row m-2">
    <div class="col-md-6 col-form-label">Xuất xứ</div>
    <div class="col-sm-6">
      <select class="form-control" name="xuatXu">
        <option value="${heo.xuatXu.maXuatXu}">${heo.xuatXu.tenXuatXu}</option>
        <c:forEach var="xuatXu" items="${danhSachXuatXu}">
          <option value="${xuatXu.tenXuatXu}">${xuatXu.tenXuatXu}</option>
        </c:forEach>
      </select>
    </div>
  </div>

  <div class="justify-content-center d-flex m-2">
    <button type="submit" id="btnSave" class="btn btn-primary m-2">Save</button>
    <form action="/heo?action=list" method="post"><button class="btn btn-dark m-2" type="submit">Cancel</button></form>
  </div>
</form>


<script src="../bootstrap-5.1.3-dist/js/bootstrap.js"></script>
<script>
  function checkTrongLuong(a){
    // let regName = /^[A-Z][a-z]*(\s[A-Z][a-z]*)+$/;
    // let checkedName = regName.exec(name);
    if(a < 10){
      document.getElementById("errorTrongLuong").innerText = "Lớn hơn 10";
      document.getElementById("btnSave").disabled = true;
    }else {
      document.getElementById("errorTrongLuong").innerText = "";
      document.getElementById("btnSave").disabled = false;
    }
  }
</script>

<%--required pattern="^\d{9}(\d{3})?$" title="Số CMND chưa đúng định dạng"--%>
<%--required pattern="^([(]84[)][+])?09[0-1]\d{7}$" title="Số điện thoại chưa đúng định dạng"--%>
<%--required pattern="^[a-zA-Z0-9]+@[a-zA-Z0-9]+([.][a-zA-Z0-9]+)+$" title="Email chưa đúng định dạng"--%>
</body>
</html>

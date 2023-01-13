<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 1/12/2023
  Time: 9:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <link rel="stylesheet" href="../bootstrap-5.1.3-dist/css/bootstrap.css">

</head>
<body>
<form class="container" style="width: 600px; border: 1px solid black;border-radius: 5px; background-color: #ded2d2" action="/sach?action=muon" method="post">
  <h2 class="text-center text-black">Mượn sách</h2>

  <div class="form-group row m-2">
    <div class="col-md-6 col-form-label">Mã Mượn sách</div>
    <div class="col-sm-6">
      <input type="text" class="form-control" required pattern="MS-(\d){4}" title="Sai định dạng" name="maHeo">
    </div>
  </div>

  <div class="form-group row m-2">
    <div class="col-md-6 col-form-label">Tên sách</div>
    <div class="col-sm-6">
      <input name="maSach"  value="${sachMuon.maSach}" hidden>
      <input type="text" class="form-control" name="tenSach" value="${sachMuon.tenSach}" readonly>
    </div>
  </div>

  <div class="form-group row m-2">
    <div class="col-md-6 col-form-label">Tên Học sinh</div>
    <div class="col-sm-6">
      <select class="form-control" name="hocSinh">
        <c:forEach var="hocSinh" items="${danhSachHocSinh}">
          <option value="${hocSinh.maHocSinh}">${hocSinh.tenHocSinh}</option>
        </c:forEach>
      </select>
    </div>
  </div>

  <div class="form-group row m-2">
    <div class="col-md-6 col-form-label">Ngày mượn sách</div>
    <div class="col-sm-6">
      <input type="date" class="form-control" name="ngayMuon" value="2023-12-01" readonly>
    </div>
  </div>

  <div class="form-group row m-2">
    <div class="col-md-6 col-form-label">Ngày trả sách</div>
    <div class="col-sm-6">
      <input type="date" class="form-control" min="2023-12-01" value="2023-12-01" name="ngayTra">
    </div>
  </div>

  <div class="justify-content-center d-flex m-2">
    <button type="submit" id="btnSave" class="btn btn-primary m-2">Mượn sách</button>
    <form action="/sach?action=zzzz" method="post"><button class="btn btn-dark m-2" type="submit">Hủy</button></form>
  </div>

</form>


<script src="../bootstrap-5.1.3-dist/js/bootstrap.js"></script>

</body>
</html>

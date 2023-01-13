<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 1/12/2023
  Time: 10:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <link rel="stylesheet" href="../bootstrap-5.1.3-dist/css/bootstrap.css">
  <%--    <link rel="stylesheet" href="../view/css-home.css">--%>
  <%--  phân trang--%>
  <link rel="stylesheet" href="../bootstrap520/css/bootstrap.min.css">
  <link rel="stylesheet" href="../datatables/css/dataTables.bootstrap5.min.css">

</head>
<body>
<h2 class="text-center">Danh sách Sách</h2>

<h2>${message}</h2>

<div class="table-responsive">
  <table class="table table-striped" id="tableMain">
    <thead style="vertical-align: top; text-align: center">
    <tr>
      <th scope="col">Mã Mượn Sách</th>
      <th scope="col">Tên sách</th>
      <th scope="col">Tác giả</th>
      <th scope="col">Tên Học Sinh</th>
      <th scope="col">Lớp</th>
      <th scope="col">Ngày Mượn</th>
      <th scope="col">Ngày Trả</th>
      <th scope="col"></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="muonSach" items="${danhSachMuonSach}">
      <tr>
        <td>${muonSach.maMuonSach}</td>
        <td>${muonSach.sach.tenSach}</td>
        <td>${muonSach.sach.tacGia}</td>
        <td>${muonSach.hocSinh.tenHocSinh}</td>
        <td>${muonSach.hocSinh.lop}</td>
        <td>${muonSach.ngayMuon}</td>
        <td>${muonSach.ngayTra}</td>
        <td>
          <button onclick="infoDelete('${muonSach.hocSinh.tenHocSinh}','${muonSach.sach.tenSach}')" type="button"
                  class="btn btn-danger" data-bs-toggle="modal"
                  data-bs-target="#deleteModal">Trả Sách
          </button>
        </td>

      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>

<div class="modal fade" id="deleteModal" tabindex="-1"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Xóa Heo</h5>
      </div>
      <form action="#" method="post">
        <div class="modal-body">
          <span>Học sinh <span id="deleteHocSinh"></span>
          thực hiện trả sách <span id="deleteTenSach"></span>
          </span>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
          <button type="submit" class="btn btn-primary">Delete</button>
        </div>
      </form>
    </div>
  </div>
</div>

<div class="text-center"><a href="/sach?action=lisss"><button class="btn btn-success">Quay lại</button></a></div>


<script src="../bootstrap-5.1.3-dist/js/bootstrap.js"></script>
<%--Phân trang--%>
<script src="../jquery/jquery-3.5.1.min.js"></script>
<script src="../datatables/js/jquery.dataTables.min.js"></script>
<script src="../datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
  $(document).ready(function () {
    $('#tableMain').dataTable({
      "dom": 'lrtip',
      "lengthChange": false,
      "pageLength": 5
    });
  });

  function infoDelete(hocSinh, tenSach) {
    document.getElementById("deleteHocSinh").value = hocSinh;
    document.getElementById("deleteTenSach").innerText = tenSach;
  }

  function checkDeposit(deposit) {
    if (deposit < 0) {
      document.getElementById("errorDeposit").innerText = "Tiền đặt cọc phải là số dương"
      document.getElementById("buttonCreate").disabled = true;
    } else {
      document.getElementById("errorDeposit").innerText = ""
      document.getElementById("buttonCreate").disabled = false;
    }
  }

</script>
</body>
</html>

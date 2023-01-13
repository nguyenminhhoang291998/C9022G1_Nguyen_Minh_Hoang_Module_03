<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 1/10/2023
  Time: 8:01 PM
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
            <th scope="col">Mã sách</th>
            <th scope="col">Tên sách</th>
            <th scope="col">Tác giả</th>
            <th scope="col">Số lượng</th>
            <th scope="col">Mô tả</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="sach" items="${danhSachSach}">
            <tr>
                <td>${sach.maSach}</td>
                <td>${sach.tenSach}</td>
                <td>${sach.tacGia}</td>
                <td>${sach.soLuong}</td>
                <td>${sach.moTa}</td>
                <td>
                    <a href="/sach?action=muon&id=${sach.maSach}&name=${sach.tenSach}">
                        <button class="btn btn-primary">Mượn</button>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>





<%--modal delete--%>
<div class="modal fade" id="deleteModal" tabindex="-1"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Xóa Heo</h5>
            </div>
            <form action="#" method="post">
                <div class="modal-body">
                    <span>Are you sure you want to delete facility </span>
                    <input id="deleteId" name="deleteId" readonly
                           style="width: 100px;background-color: #79808a; text-align: center">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">Delete</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="text-center"><a href="/sach?action=danhSachMuon"><button class="btn btn-success">Danh Sách Mượn</button></a></div>

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

    function infoDelete(id, name) {
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").innerText = name;
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

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
    <link rel="stylesheet" href="../view/css-home.css">
    <%--  phân trang--%>
    <link rel="stylesheet" href="../bootstrap520/css/bootstrap.min.css">
    <link rel="stylesheet" href="../datatables/css/dataTables.bootstrap5.min.css">
</head>
<body>
<h2>Quản Lý Heo</h2>

<h2>${message}</h2>

<form action="/heo?action=find" method="post">
    <div class="form-control justify-content-center d-flex container w-75">
        <select class="form-control mx-2" name="tinhTrangHeo">
            <option value="">Tình trạng heo</option>
            <option value="">Chưa bán</option>
            <option value="">Đã bán</option>
        </select>

        <input class="form-control mx-2" type="text" name="maHeo" placeholder="Tìm theo mã Heo">

        <select class="form-control mx-2" name="xuatXu">
            <option value="">Xuất xứ</option>
            <c:forEach var="xuatXu" items="${danhSachXuatXu}">
                <option value="${xuatXu.tenXuatXu}">${xuatXu.tenXuatXu}</option>
            </c:forEach>
        </select>

        <button type="submit" class="btn btn-success mx-2" style="width: 300px">Tìm Kiếm</button>
    </div>
</form>


<div class="table-responsive">
    <table class="table table-striped" id="tableMain">
        <thead style="vertical-align: top; text-align: center">
        <tr>
            <th scope="col">Stt</th>
            <th scope="col">Mã Số Heo</th>
            <th scope="col">Ngày Nhập chuồng</th>
            <th scope="col">Trọng lượng khi nhập chuồng</th>
            <th scope="col">Thời gian xuất chuồng</th>
            <th scope="col">Trọng lượng khi xuất chuồng</th>
            <th scope="col">Xuất Xứ</th>
            <th scope="col">Xuất chuồng</th>
            <th scope="col">Chi tiết</th>
            <th scope="col">Xóa</th>

        </tr>
        </thead>
        <tbody>
        <c:forEach var="heo" items="${danhSachHeo}" varStatus="vt">
            <tr>
                <td>${vt.count}</td>
                <td>${heo.maSo}</td>
                <td>${heo.ngayNhapChuong}</td>
                <td>${heo.trongLuongKhiNhap}</td>
                <c:choose>
                    <c:when test="${heo.ngayXuatChuong != null}">
                        <td>${heo.ngayXuatChuong}</td>
                    </c:when>
                    <c:otherwise>
                        <td>Chưa đủ ký</td>
                    </c:otherwise>
                </c:choose>

                <c:choose>
                    <c:when test="${heo.ngayXuatChuong != null}">
                        <td>${heo.trongLuongKhiXuat}</td>
                    </c:when>
                    <c:otherwise>
                        <td>${heo.trongLuongKhiNhap}</td>
                    </c:otherwise>
                </c:choose>

                <td>${heo.xuatXu.tenXuatXu}</td>
                <td>
                    <c:choose>
                        <c:when test="${heo.ngayXuatChuong != null}">
                            <button class="btn btn-primary" disabled>Đã Bán</button>
                        </c:when>
                        <c:otherwise>
                            <button class="btn btn-danger">Bán</button>

                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <a href="/heo?action=edit&id=${heo.maSo}">
                        <button class="btn btn-primary">Edit</button>
                    </a>
                </td>

                <td>
                    <button onclick="infoDelete('${heo.maSo}')" type="button"
                            class="btn btn-danger" data-bs-toggle="modal"
                            data-bs-target="#deleteModal">Delete
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
            <form action="/heo?action=delete" method="post">
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


<script src="../bootstrap-5.1.3-dist/js/bootstrap.js"></script>
<%--Phân trang--%>
<script src="../jquery/jquery-3.5.1.min.js"></script>
<script src="../datatables/js/jquery.dataTables.min.js"></script>
<script src="../datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    function infoDelete(id) {
        document.getElementById("deleteId").value = id;
    }

    $(document).ready(function () {
        $('#tableMain').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });

    });
</script>
</body>
</html>

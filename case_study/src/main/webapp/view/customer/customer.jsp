<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/31/2022
  Time: 3:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer</title>
    <link rel="stylesheet" href="../../bootstrap-5.1.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="../../css-home.css">
    <link rel="stylesheet" href="../../css-form.css">
    <%--  phân trang--%>
    <link rel="stylesheet" href="../../bootstrap520/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../datatables/css/dataTables.bootstrap5.min.css">
</head>
<body>
<c:import url="../home/navbar.jsp"></c:import>
<h2>Customer</h2>
<h3 class="message">${message}</h3>

<div class="table-list">
    <div class="table-responsive">
        <table class="table table-striped w-100" id="tableCustomer">
            <thead style="vertical-align: top; text-align: center">
            <tr>
                <th scope="col" class="text-center">ID</th>
<%--                <th scope="col" class="text-center">Customer Type ID</th>--%>
                <th scope="col" class="text-center">Name</th>
                <th scope="col" class="text-center">Day Of Birth</th>
                <th scope="col" class="text-center">Gender</th>
<%--                <th scope="col" class="text-center">ID card</th>--%>
                <th scope="col" class="text-center">Phone Number</th>
                <th scope="col" class="text-center">Email</th>
                <th scope="col" class="text-center">Address</th>
                <th scope="col"></th>
                <th scope="col"></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="customer" items="${customerList}">
                <tr>
                    <td>${customer.id}</td>
<%--                    <td>${customer.customerTypeId}</td>--%>
                    <td>${customer.name}</td>
                    <td>${customer.dayOfBirth}</td>
                    <c:if test="${customer.gender}">
                        <td>Nam</td>
                    </c:if>
                    <c:if test="${!customer.gender}">
                        <td>Nữ</td>
                    </c:if>
<%--                    <td>${customer.idCard}</td>--%>
                    <td>${customer.phoneNumber}</td>
                    <td>${customer.email}</td>
                    <td>${customer.address}</td>
                    <td>
                        <button onclick="infoEdit('${customer.id}','${customer.customerTypeId}','${customer.name}','${customer.dayOfBirth}',
                                '${customer.gender}','${customer.idCard}','${customer.phoneNumber}','${customer.email}','${customer.address}',)"
                                type="button" class="btn btn-primary" data-bs-toggle="modal"
                                data-bs-target="#editModal">Edit
                        </button>
                    </td>
                    <td>
                        <button onclick="infoDelete('${customer.id}','${customer.name}')" type="button" class="btn btn-danger" data-bs-toggle="modal"
                                data-bs-target="#deleteModal">Delete
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<div class="justify-content-center d-flex">
    <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addModal">Add new Customer</button>

</div>

<%--Modal add--%>
<div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="">Add Customer</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body m-0 p-0">

                <form class="form-horizontal" action="/customer?action=add" method="post">

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4">
                            <label class="control-label" for="newId">ID:</label></div>
                        <div class="col-sm-8">
                            <input type="number" class="form-control" name="newId" id="newId"
                                   placeholder="Enter ID">
                        </div>
                    </div>

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4"><label class="control-label" for="newCustomerTypeId">Customer Type
                            Id:</label></div>
                        <div class="col-sm-8">
                            <input type="number" class="form-control" id="newCustomerTypeId"
                                   name="newCustomerTypeId" placeholder="Enter customer type id">
                        </div>
                    </div>

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4"><label class="control-label" for="newName">Name:</label></div>
                        <div class="col-sm-8">
                            <input required pattern="^[A-Z][a-z]*(\s[A-Z][a-z]*)+$" title="Tên chưa đúng định dạng" type="text" class="form-control" id="newName" name="newName"
                                   placeholder="Enter name">
                        </div>
                    </div>

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4"><label class="control-label" for="newDayOfBirth">Day Of
                            Birth:</label></div>
                        <div class="col-sm-8">
                            <input type="date" class="form-control" id="newDayOfBirth" name="newDayOfBirth"
                                   placeholder="Enter day of birth">
                        </div>
                    </div>

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4"><label class="control-label">Gender:</label></div>
                        <div class="col-sm-8">
                            <label for="gender1"><input class="ms-3 me-1" checked type="radio" name="newGender" id="gender1" value="1">Nam</label>
                            <label for="gender2"><input class="ms-3 me-1" type="radio" name="newGender" id="gender2" value="0">Nữ</label>
                        </div>
                    </div>

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4"><label class="control-label" for="newIdCard">ID card:</label></div>
                        <div class="col-sm-8">
                            <input  required pattern="^\d{9}(\d{3})?$" title="Số CMND chưa đúng định dạng" type="number" minlength="9" maxlength="12" class="form-control"
                                   name="newIdCard" id="newIdCard" placeholder="Enter ID card">
                        </div>
                    </div>

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4"><label class="control-label" for="newPhoneNumber">Phone
                            number:</label></div>
                        <div class="col-sm-8">
                            <input  required pattern="^([(]84[)][+])?09[0-1]\d{7}$" title="Số điện thoại chưa đúng định dạng" type="number" maxlength="10" minlength="9" class="form-control"
                                   name="newPhoneNumber" id="newPhoneNumber" placeholder="Enter phone number">
                        </div>
                    </div>

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4"><label class="control-label" for="newEmail">Email:</label></div>
                        <div class="col-sm-8">
                            <input required pattern="^[a-zA-Z0-9]+@[a-zA-Z0-9]+([.][a-zA-Z0-9]+)+$" title="Email chưa đúng định dạng" type="email" class="form-control" id="newEmail" name="newEmail"
                                   placeholder="Enter email">
                        </div>
                    </div>

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4"><label class="control-label" for="newAddress">Address:</label></div>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="newAddress" name="newAddress"
                                   placeholder="Enter address">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="d-flex justify-content-center">
                            <button type="submit" class="btn btn-success">Save</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%--Modal edit--%>
<div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Edit Customer</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body m-0 p-0">

                <form class="form-horizontal" action="/customer?action=edit" method="post">

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4">
                            <label class="control-label" for="editId">ID:</label></div>
                        <div class="col-sm-8">
                            <input type="number" class="form-control" id="editId" name="editId" readonly>
                        </div>
                    </div>

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4"><label class="control-label" for="editCustomerTypeId">Customer Type
                            Id:</label></div>
                        <div class="col-sm-8">
                            <input type="number" class="form-control" name="editCustomerTypeId" id="editCustomerTypeId">
                        </div>
                    </div>

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4"><label class="control-label" for="editName">Name:</label></div>
                        <div class="col-sm-8">
                            <input required pattern="^[A-Z][a-z]*(\s[A-Z][a-z]*)+$" title="Tên chưa đúng định dạng" type="text" class="form-control" id="editName" name="editName">
                        </div>
                    </div>

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4"><label class="control-label" for="editDayOfBirth">Day Of
                            Birth:</label></div>
                        <div class="col-sm-8">
                            <input type="date" class="form-control" id="editDayOfBirth" name="editDayOfBirth">
                        </div>
                    </div>

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4"><label class="control-label">Gender:</label></div>
                        <div class="col-sm-8">
                            <label for="male"><input class="ms-3 me-1" type="radio" name="editGender" id="male" value="1">Nam</label>
                            <label for="female"><input class="ms-3 me-1" type="radio" name="editGender" id="female" value="0">Nữ</label>
                        </div>
                    </div>

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4"><label class="control-label" for="editIdCard">ID card:</label></div>
                        <div class="col-sm-8">
                            <input  required pattern="^\d{9}(\d{3})?$" title="Số CMND chưa đúng định dạng" type="number" minlength="9" maxlength="12" class="form-control" name="editIdCard" id="editIdCard">
                        </div>
                    </div>

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4"><label class="control-label" for="editPhoneNumber">Phone
                            number:</label></div>
                        <div class="col-sm-8">
                            <input  required pattern="^([(]84[)][+])?09[0-1]\d{7}$" title="Số điện thoại chưa đúng định dạng" type="number" maxlength="10" minlength="9" class="form-control" name="editPhoneNumber" id="editPhoneNumber">
                        </div>
                    </div>

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4"><label class="control-label" for="editEmail">Email:</label></div>
                        <div class="col-sm-8">
                            <input required pattern="^[a-zA-Z0-9]+@[a-zA-Z0-9]+([.][a-zA-Z0-9]+)+$" title="Email chưa đúng định dạng" type="email" class="form-control" id="editEmail" name="editEmail">
                        </div>
                    </div>

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4"><label class="control-label" for="editAddress">Address:</label></div>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="editAddress" name="editAddress">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="d-flex justify-content-center">
                            <button type="submit" class="btn btn-success">Save</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%--Modal delete--%>
<div class="modal fade" id="deleteModal" tabindex="-1"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Delete customer</h5>
            </div>
            <form action="/customer?action=delete" method="post">
            <div class="modal-body">
                <input id="deleteId" name="deleteId" hidden>
                <span>Are you sure you want to delete customer </span>
                <span id="deleteName"></span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary">Delete</button>
            </div>
            </form>
        </div>
    </div>
</div>
<script>
    function infoDelete(id,name){
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").innerText = name;
    }
    function infoEdit(id,customerTypeId,name,dayOfBirth,gender,idCard,phoneNumber,email,address){
        document.getElementById("editId").value = id;
        document.getElementById("editCustomerTypeId").value = customerTypeId;
        document.getElementById("editName").value = name;
        document.getElementById("editDayOfBirth").value = dayOfBirth;
        document.getElementById("editIdCard").value = idCard;
        document.getElementById("editPhoneNumber").value = phoneNumber;
        document.getElementById("editEmail").value = email;
        document.getElementById("editAddress").value = address;
        if(gender === "true"){
            document.getElementById("male").checked = true;
            document.getElementById("female").checked = false;
        }else {
            document.getElementById("male").checked = false;
            document.getElementById("female").checked = true;
        }
    }
</script>
<script src="../../bootstrap-5.1.3-dist/js/bootstrap.js"></script>
<%--Phân trang--%>
<script src="../../jquery/jquery-3.5.1.min.js"></script>
<script src="../../datatables/js/jquery.dataTables.min.js"></script>
<script src="../../datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function (){
        $('#tableCustomer').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });

    });
</script>
</body>
</html>

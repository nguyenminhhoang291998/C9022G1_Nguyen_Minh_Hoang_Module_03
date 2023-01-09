<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 1/4/2023
  Time: 9:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee</title>
    <link rel="stylesheet" href="../../bootstrap-5.1.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="../../css-form.css">
    <%--  phân trang--%>
    <link rel="stylesheet" href="../../bootstrap520/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../datatables/css/dataTables.bootstrap5.min.css">

</head>
<body>
<c:import url="../home/navbar.jsp"></c:import>
<h2>Employee</h2>
<h3 class="message">${message}</h3>


<div class="table-list">
    <div class="table-responsive">
        <table class="table table-striped w-100" id="tableEmployee">
            <thead style="vertical-align: top; text-align: center">
            <tr>
                <th scope="col" class="text-center">ID</th>
                <th scope="col" class="text-center">Name</th>
                <th scope="col" class="text-center">Day Of Birth</th>
<%--                <th scope="col" class="text-center">ID card</th>--%>
<%--                <th scope="col" class="text-center">Salary</th>--%>
                <th scope="col" class="text-center">Phone Number</th>
                <th scope="col" class="text-center">Email</th>
                <th scope="col" class="text-center">Address</th>
                <th scope="col"></th>
                <th scope="col"></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="employee" items="${employeeList}">
                <tr>
                    <td>${employee.id}</td>
                    <td>${employee.name}</td>
                    <td>${employee.dayOfBirth}</td>
<%--                    <td>${employee.idCard}</td>--%>
<%--                    <td>${employee.salary}</td>--%>
                    <td>${employee.phoneNumber}</td>
                    <td>${employee.email}</td>
                    <td>${employee.address}</td>
                    <td>
                        <button onclick="infoEdit('${employee.id}','${employee.name}','${employee.dayOfBirth}',
                                '${employee.idCard}','${employee.salary}','${employee.phoneNumber}','${employee.email}',
                                '${employee.address}','${employee.positionId}','${employee.educationDegreeId}','${employee.divisionId}',
                                '${employee.userName}',)" type="button" class="btn btn-primary" data-bs-toggle="modal"
                                data-bs-target="#editModal">Edit
                        </button>
                    </td>
                    <td>
                        <button onclick="infoDelete('${employee.id}','${employee.name}')" type="button" class="btn btn-danger" data-bs-toggle="modal"
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
    <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addModal">Add new Employee</button>
</div>



<%--Modal add--%>
<div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="">Add Employee</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body m-0 p-0">

                <form class="form-horizontal" action="/employee?action=add" method="post">

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4">
                            <label class="control-label" for="newId">ID:</label></div>
                        <div class="col-sm-8">
                            <input type="number" class="form-control" name="newId" id="newId"
                                   placeholder="Enter ID">
                        </div>
                    </div>

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4"><label class="control-label" for="newName">Name:</label></div>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="newName" name="newName"
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
                        <div class=" col-sm-4"><label class="control-label" for="newIdCard">ID card:</label></div>
                        <div class="col-sm-8">
                            <input type="number" minlength="9" maxlength="12" class="form-control"
                                   name="newIdCard" id="newIdCard" placeholder="Enter ID card">
                        </div>
                    </div>

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4"><label class="control-label" for="newSalary">Phone
                            number:</label></div>
                        <div class="col-sm-8">
                            <input type="number" maxlength="10" minlength="9" class="form-control"
                                   name="newSalary" id="newSalary" placeholder="Enter salary">
                        </div>
                    </div>

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4"><label class="control-label" for="newPhoneNumber">Phone
                            number:</label></div>
                        <div class="col-sm-8">
                            <input type="number" maxlength="10" minlength="9" class="form-control"
                                   name="newPhoneNumber" id="newPhoneNumber" placeholder="Enter phone number">
                        </div>
                    </div>

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4"><label class="control-label" for="newEmail">Email:</label></div>
                        <div class="col-sm-8">
                            <input type="email" class="form-control" id="newEmail" name="newEmail"
                                   placeholder="Enter email">
                        </div>
                    </div>

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4"><label class="control-label" >Position Id:</label></div>
                        <div class="col-sm-8">
                            <select class="form-control">
                                <option value="0">Chon vị trí</option>
                                <c:forEach var="position" items="${positionList}">
                                    <option value="${position.id}">${position.name}</option>
                                </c:forEach>

                            </select>
                        </div>
                    </div>

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4"><label class="control-label" for="newEducationDegreeId">Education Degree Id:</label></div>
                        <div class="col-sm-8">
                            <input type="number" class="form-control" id="newEducationDegreeId" name="newEducationDegreeId"
                                   placeholder="Enter education degree id">
                        </div>
                    </div>

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4"><label class="control-label" for="newDivisionId">Division Id:</label></div>
                        <div class="col-sm-8">
                            <input type="number" class="form-control" id="newDivisionId" name="newDivisionId"
                                   placeholder="Enter division id">
                        </div>
                    </div>

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4"><label class="control-label" for="newUserName">User Name:</label></div>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="newUserName" name="newUserName"
                                   placeholder="Enter user name">
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
                <h5 class="modal-title">Edit Employee</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body m-0 p-0">

                <form class="form-horizontal" action="/employee?action=edit" method="post">

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4">
                            <label class="control-label" for="editId">ID:</label></div>
                        <div class="col-sm-8">
                            <input type="number" class="form-control" id="editId" name="editId" readonly>
                        </div>
                    </div>

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4"><label class="control-label" for="editName">Name:</label></div>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="editName" name="editName">
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
                        <div class=" col-sm-4"><label class="control-label" for="editIdCard">ID card:</label></div>
                        <div class="col-sm-8">
                            <input type="number" minlength="9" maxlength="12" class="form-control" name="editIdCard" id="editIdCard">
                        </div>
                    </div>

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4"><label class="control-label" for="editSalary">Salary:</label></div>
                        <div class="col-sm-8">
                            <input type="text" minlength="9" maxlength="12" class="form-control" name="editSalary" id="editSalary">
                        </div>
                    </div>

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4"><label class="control-label" for="editPhoneNumber">Phone
                            number:</label></div>
                        <div class="col-sm-8">
                            <input type="number" maxlength="10" minlength="9" class="form-control" name="editPhoneNumber" id="editPhoneNumber">
                        </div>
                    </div>

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4"><label class="control-label" for="editEmail">Email:</label></div>
                        <div class="col-sm-8">
                            <input type="email" class="form-control" id="editEmail" name="editEmail">
                        </div>
                    </div>

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4"><label class="control-label" for="editAddress">Address:</label></div>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="editAddress" name="editAddress">
                        </div>
                    </div>

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4"><label class="control-label" for="editPositionId">Position Id:</label></div>
                        <div class="col-sm-8">
                            <input type="number" class="form-control" id="editPositionId" name="editPositionId">
                        </div>
                    </div>

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4"><label class="control-label" for="editEducationDegreeId">Education Degree Id:</label></div>
                        <div class="col-sm-8">
                            <input type="number" class="form-control" id="editEducationDegreeId" name="editEducationDegreeId">
                        </div>
                    </div>

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4"><label class="control-label" for="editDivisionId">Division Id:</label></div>
                        <div class="col-sm-8">
                            <input type="number" class="form-control" id="editDivisionId" name="editDivisionId">
                        </div>
                    </div>

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4"><label class="control-label" for="editUserName">Address:</label></div>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="editUserName" name="editUserName">
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
            <form action="/employee?action=delete" method="post">
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
    function infoEdit(id,name,dayOfBirth,idCard,salary,phoneNumber,email,address,positionId,educationDegreeId,divisionId,userName){
        document.getElementById("editId").value = id;
        document.getElementById("editName").value = name;
        document.getElementById("editDayOfBirth").value = dayOfBirth;
        document.getElementById("editIdCard").value = idCard;
        document.getElementById("editSalary").value = salary;
        document.getElementById("editPhoneNumber").value = phoneNumber;
        document.getElementById("editEmail").value = email;
        document.getElementById("editAddress").value = address;
        document.getElementById("editPositionId").value = positionId;
        document.getElementById("editEducationDegreeId").value = educationDegreeId;
        document.getElementById("editDivisionId").value = divisionId;
        document.getElementById("editUserName").value = userName;
    }
</script>

<script src="../../bootstrap-5.1.3-dist/js/bootstrap.js"></script>
<%--Phân trang--%>
<script src="../../jquery/jquery-3.5.1.min.js"></script>
<script src="../../datatables/js/jquery.dataTables.min.js"></script>
<script src="../../datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function (){
        $('#tableEmployee').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });

    });
</script>
</body>
</html>

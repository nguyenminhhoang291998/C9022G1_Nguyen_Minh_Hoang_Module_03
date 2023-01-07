<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/31/2022
  Time: 8:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Service</title>
    <link rel="stylesheet" href="../../bootstrap-5.1.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="../../css-home.css">
    <link rel="stylesheet" href="../../css-facility.css">
    <%--  phân trang--%>
    <link rel="stylesheet" href="../../bootstrap520/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../datatables/css/dataTables.bootstrap5.min.css">
</head>
<body>
<c:import url="../home/navbar.jsp"></c:import>
<h2>Facility</h2>
<div class="table-responsive">
    <table class="table table-striped">
        <thead style="vertical-align: top; text-align: center">
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Area</th>
            <th scope="col">Cost</th>
            <th scope="col">Max People</th>
            <th scope="col">Standard Room</th>
            <th scope="col">Description Other Convenience</th>
            <th scope="col">Facility Free</th>
            <th></th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="facility" items="${facilityList}">
        <tr>
            <td>${facility.id}</td>
            <td>${facility.name}</td>
            <td>${facility.area}</td>
            <td>${facility.cost}</td>
            <td>${facility.maxPeople}</td>
            <td>${facility.standardRoom}</td>
            <td>${facility.descriptionOtherConvenience}</td>
            <td>${facility.facilityFree}</td>
            <td>
                <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                        data-bs-target="#editFacilityModal">Edit
                </button>
            </td>
            <td>
                <button onclick="infoDelete('${facility.id}','${facility.name}')" type="button" class="btn btn-danger" data-bs-toggle="modal"
                        data-bs-target="#deleteFacilityModal">Delete
                </button>
            </td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div class="justify-content-center d-flex">
    <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addFacilityModal">Add</button>

</div>
<%--modal edit--%>

<%--modal add--%>
<div class="modal fade" id="addFacilityModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header justify-content-center m-2 p-0">
                <h3 class="text-center text-primary">Facility</h3>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" action="/facility?action=add" method="post">
                <div class="m-2 row">
                    <label class="col-sm-4 form-label">Facility Type</label>
                    <div class="col-sm-8 justify-content-center">
                        <input hidden type="text" name="facility_type_id" id="facilityTypeId">
                        <button class="btn btn-primary w-25 mx-1" onclick="addVilla()">Villa</button>
                        <button class="btn btn-primary w-25 mx-1" onclick="addHouse()">House</button>
                        <button class="btn btn-primary w-25 mx-1" onclick="addRoom()">Room</button>
                    </div>
                </div>


                <div class="m-2 row">
                    <label class="col-sm-4 col-form-label">Facility Name</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="name" name="name">
                    </div>
                </div>

                <div class="m-2 row">
                    <label class="col-sm-4 col-form-label">Area</label>
                    <div class="col-sm-8">
                        <input type="number" class="form-control" id="area" name="area">
                    </div>
                </div>

                <div class="m-2 row">
                    <label class="col-sm-4 col-form-label">Cost</label>
                    <div class="col-sm-8">
                        <input type="number" class="form-control" id="cost" name="cost">
                    </div>
                </div>

                <div class="m-2 row">
                    <label class="col-sm-4 col-form-label">Max People</label>
                    <div class="col-sm-8">
                        <input type="number" class="form-control" id="maxPeople" name="maxPeople">
                    </div>
                </div>

                <div class="m-2 row">
                    <label class="col-sm-4 col-form-label">Rent Type Name</label>
                    <div class="col-sm-8">
                        <select class="form-control" name="rentType" id="rentType">
                            <c:forEach var="rt" items="${rentTypeList}">
                                <option value="${rt.id}" readonly>${rt.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div id="standardRoom">
                    <div class="m-2 row">
                        <label class="col-sm-4 col-form-label">Standard Room</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="standardRoom">
                        </div>
                    </div>
                </div>

                <div id="description">
                    <div class="m-2 row align-items-center">
                        <label class="col-sm-4 col-form-label">Description Other Convenience</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="description">
                        </div>
                    </div>
                </div>

                <div id="poolArea">
                    <div class="m-2 row">
                        <label class="col-sm-4 col-form-label">Pool area</label>
                        <div class="col-sm-8">
                            <input type="number" class="form-control" name="poolArea">
                        </div>
                    </div>
                </div>

                <div id="numberOfFloors">
                    <div class="m-2 row align-items-center">
                        <label class="col-sm-4 col-form-label">Number Of Floors</label>
                        <div class="col-sm-8">
                            <input type="number" class="form-control" name="numberOfFloors">
                        </div>
                    </div>
                </div>
                <div id="facilityFree">
                    <div class="m-2 row">
                        <label class="col-sm-4 col-form-label">Facility free</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="facilityFree">
                        </div>
                    </div>
                </div>
                </form>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Add</button>
            </div>
        </div>
    </div>
</div>

<%--modal delete--%>
<div class="modal fade" id="deleteFacilityModal" tabindex="-1"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Delete facility</h5>
            </div>
            <form action="/facility?action=delete" method="post">
                <div class="modal-body">
                    <input id="deleteId" name="deleteId" hidden>
                    <span>Are you sure you want to delete facility </span>
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
    function addVilla() {
        document.getElementById("facilityTypeId").value = 1;
        document.getElementById("standardRoom").style.display = 'block';
        document.getElementById("description").style.display = 'block';
        document.getElementById("poolArea").style.display = 'block';
        document.getElementById("numberOfFloor").style.display = 'block';
        document.getElementById("facilityFree").style.display = 'none';
    }

    function addHouse() {
        document.getElementById("facilityTypeId").value = 2;
        document.getElementById("standardRoom").style.display = 'block';
        document.getElementById("description").style.display = 'block';
        document.getElementById("poolArea").style.display = 'none';
        document.getElementById("numberOfFloor").style.display = 'block';
        document.getElementById("facilityFree").style.display = 'none';
    }

    function addRoom() {
        document.getElementById("facilityTypeId").value = 3;
        document.getElementById("standardRoom").style.display = 'none';
        document.getElementById("description").style.display = 'none';
        document.getElementById("poolArea").style.display = 'none';
        document.getElementById("numberOfFloor").style.display = 'none';
        document.getElementById("facilityFree").style.display = 'block';
    }

</script>
<script src="../../bootstrap-5.1.3-dist/js/bootstrap.js"></script>
<%--Phân trang--%>
<script src="../../jquery/jquery-3.5.1.min.js"></script>
<script src="../../datatables/js/jquery.dataTables.min.js"></script>
<script src="../../datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableContract').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });

    });

    function infoDelete(id,name){
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").innerText = name;
    }
</script>
</body>

</html>

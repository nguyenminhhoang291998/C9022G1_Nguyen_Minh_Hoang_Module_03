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
    <link rel="stylesheet" href="../../css-form.css">
    <link rel="stylesheet" href="../../css-facility.css">
    <%--  phân trang--%>
    <link rel="stylesheet" href="../../bootstrap520/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../datatables/css/dataTables.bootstrap5.min.css">
</head>
<body>
<c:import url="../home/navbar.jsp"></c:import>
<h3 class="message">${message}</h3>
<h2>Facility</h2>
<div class="table-responsive">
    <table class="table table-striped" id="tableFacility">
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
                    <button onclick="infoEdit('${facility.id}','${facility.name}','${facility.area}',
                            '${facility.cost}','${facility.maxPeople}','${facility.rentTypeId}','${facility.facilityTypeId}',
                            '${facility.standardRoom}','${facility.descriptionOtherConvenience}','${facility.poolArea}','${facility.numberOfFloors}',
                            '${facility.facilityFree}')" type="button" class="btn btn-primary" data-bs-toggle="modal"
                            data-bs-target="#editFacilityModal">Edit
                    </button>
                </td>

                <td>
                    <button onclick="infoDelete('${facility.id}','${facility.name}')" type="button"
                            class="btn btn-danger" data-bs-toggle="modal"
                            data-bs-target="#deleteFacilityModal">Delete
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div class="justify-content-center d-flex">
    <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addFacilityModal">Add new Facility</button>

</div>

<%--modal edit--%>
<div class="modal fade" id="editFacilityModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form class="form-horizontal" action="/facility?action=edit" method="post">
                <div class="modal-header justify-content-center m-2 p-0">
                    <h3 class="text-center text-primary">Edit Facility</h3>
                </div>

                <div class="modal-body">
                    <div class="m-2 row">
                        <label class="col-sm-4 form-label">Facility Type</label>
                        <div class="col-sm-8 justify-content-center">
                            <input readonly class="form-control" name="idEdit" id="idEdit">
                        </div>
                    </div>


                    <div class="m-2 row">
                        <label class="col-sm-4 col-form-label">Facility Name</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="nameEdit" name="nameEdit">
                        </div>
                    </div>

                    <div class="m-2 row">
                        <label class="col-sm-4 col-form-label">Area</label>
                        <div class="col-sm-8">
                            <input type="number" class="form-control" id="areaEdit" name="areaEdit">
                        </div>
                    </div>

                    <div class="m-2 row">
                        <label class="col-sm-4 col-form-label">Cost</label>
                        <div class="col-sm-8">
                            <input required pattern="^\d*([.]\d+)?$" title="Giá phải là số dương" type="number" class="form-control" id="costEdit" name="costEdit">
                        </div>
                    </div>

                    <div class="m-2 row">
                        <label class="col-sm-4 col-form-label">Max People</label>
                        <div class="col-sm-8">
                            <input type="number" class="form-control" id="maxPeopleEdit" name="maxPeopleEdit">
                        </div>
                    </div>

                    <div class="m-2 row">
                        <label class="col-sm-4 col-form-label">Rent Type Name</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="rentTypeEdit" name="rentTypeEdit">
                        </div>
                    </div>

                    <div class="m-2 row">
                        <label class="col-sm-4 col-form-label">Facility Type Id</label>
                        <div class="col-sm-8">
                            <input type="number" class="form-control" id="facilityTypeIdEdit" name="facilityTypeIdEdit">
                        </div>
                    </div>

                    <div id="formStandardRoomEdit">
                        <div class="m-2 row">
                            <label class="col-sm-4 col-form-label">Standard Room</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="standardRoomEdit" name="standardRoomEdit">
                            </div>
                        </div>
                    </div>

                    <div id="formDescriptionEdit">
                        <div class="m-2 row align-items-center">
                            <label class="col-sm-4 col-form-label">Description Other Convenience</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="descriptionOtherConvenienceEdit" name="descriptionEdit">
                            </div>
                        </div>
                    </div>

                    <div id="formPoolAreaEdit">
                        <div class="m-2 row">
                            <label class="col-sm-4 col-form-label">Pool area</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="poolAreaEdit" name="poolAreaEdit">
                            </div>
                        </div>
                    </div>

                    <div id="formNumberOfFloorsEdit">
                        <div class="m-2 row align-items-center">
                            <label class="col-sm-4 col-form-label">Number Of Floors</label>
                            <div class="col-sm-8">
                                <input required pattern="^[1-9]\d*$" title="Số tầng phải là số nguyên dương" type="number" class="form-control" id="numberOfFloorsEdit" name="numberOfFloorsEdit">
                            </div>
                        </div>
                    </div>

                    <div id="formFacilityFreeEdit">
                        <div class="m-2 row">
                            <label class="col-sm-4 col-form-label">Facility free</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="facilityFreeEdit" name="facilityFreeEdit">
                            </div>
                        </div>
                    </div>

                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save</button>
                </div>
            </form>
        </div>
    </div>
</div>


<%--modal add--%>
<div class="modal fade" id="addFacilityModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form class="form-horizontal" action="/facility?action=add" method="post">
                <div class="modal-header justify-content-center m-2 p-0">
                    <h3 class="text-center text-primary">Facility</h3>
                </div>

                <div class="modal-body">
                    <div class="m-2 row">
                        <label class="col-sm-4 form-label">Facility Type</label>
                        <div class="col-sm-8 justify-content-center">
                            <input hidden type="text" name="facilityTypeId" id="facilityTypeId">
                            <button type="button" class="btn btn-primary w-25 mx-1" onclick="addVilla()">Villa</button>
                            <button type="button" class="btn btn-primary w-25 mx-1" onclick="addHouse()">House</button>
                            <button type="button" class="btn btn-primary w-25 mx-1" onclick="addRoom()">Room</button>
                        </div>
                    </div>

                    <div class="m-2 row">
                        <label class="col-sm-4 col-form-label">Facility id</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="id" name="id">
                        </div>
                    </div>

                    <div class="m-2 row">
                        <label class="col-sm-4 col-form-label">Facility Name</label>
                        <div class="col-sm-8">
                            <input required pattern="^[A-Z][a-z0-9\s]*$" title="Tên chưa đúng định dạng" type="text" class="form-control" id="name" name="name">
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
                            <input  required pattern="^\d*([.]\d+)?$" title="Tiền phải là số dương" type="number" class="form-control" id="cost" name="cost">
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
                                <option value="0" readonly>Chọn kiểu thuê</option>
                                <c:forEach var="rentType" items="${rentTypeList}">
                                    <option value="${rentType.id}" readonly>${rentType.name}</option>
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
                                <input type="number" value="0" class="form-control" name="poolArea">
                            </div>
                        </div>
                    </div>

                    <div id="numberOfFloors">
                        <div class="m-2 row align-items-center">
                            <label class="col-sm-4 col-form-label">Number Of Floors</label>
                            <div class="col-sm-8">
                                <input  required pattern="^[1-9]\d*$" title="Số tầng phải là số nguyên dương"  type="number" class="form-control" name="numberOfFloors">
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

                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Add</button>
                </div>
            </form>
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


<script src="../../bootstrap-5.1.3-dist/js/bootstrap.js"></script>
<%--Phân trang--%>
<script src="../../jquery/jquery-3.5.1.min.js"></script>
<script src="../../datatables/js/jquery.dataTables.min.js"></script>
<script src="../../datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableFacility').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });

    });

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

    function infoEdit(id, name, area, cost, maxPeople, rentTypeId, facilityTypeId, standardRoom, descriptionOtherConvenience, poolArea, numberOfFloors, facilityFree) {
        document.getElementById("idEdit").value = id;
        document.getElementById("nameEdit").value = name;
        document.getElementById("areaEdit").value = area;
        document.getElementById("costEdit").value = cost;
        document.getElementById("maxPeopleEdit").value = maxPeople;
        document.getElementById("rentTypeEdit").value = rentTypeId;
        document.getElementById("facilityTypeIdEdit").value = facilityTypeId;
        document.getElementById("standardRoomEdit").value = standardRoom;
        document.getElementById("descriptionOtherConvenienceEdit").value = descriptionOtherConvenience;
        document.getElementById("poolAreaEdit").value = poolArea;
        document.getElementById("numberOfFloorsEdit").value = numberOfFloors;
        document.getElementById("facilityFreeEdit").value = facilityFree;
        if(facilityTypeId ==1 ){
            document.getElementById("formStandardRoomEdit").style.display = 'block';
            document.getElementById("formDescriptionEdit").style.display = 'block';
            document.getElementById("formPoolAreaEdit").style.display = 'block';
            document.getElementById("formNumberOfFloorsEdit").style.display = 'block';
            document.getElementById("formFacilityFreeEdit").style.display = 'none';
        }else if(facilityTypeId ==2){
            document.getElementById("formStandardRoomEdit").style.display = 'block';
            document.getElementById("formDescriptionEdit").style.display = 'block';
            document.getElementById("formPoolAreaEdit").style.display = 'none';
            document.getElementById("formNumberOfFloorsEdit").style.display = 'block';
            document.getElementById("formFacilityFreeEdit").style.display = 'none';
        }else if(facilityTypeId ==3){
            document.getElementById("formStandardRoomEdit").style.display = 'none';
            document.getElementById("formDescriptionEdit").style.display = 'none';
            document.getElementById("formPoolAreaEdit").style.display = 'none';
            document.getElementById("formNumberOfFloorsEdit").style.display = 'none';
            document.getElementById("formFacilityFreeEdit").style.display = 'block';
        }
    }
    function infoDelete(id,name){
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").innerText = name;
    }
</script>
</body>

</html>

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
            <th scope="col">Rent type</th>
            <th scope="col">Facility Type ID</th>
            <th scope="col">Standard Room</th>
            <th scope="col">Description Other Convenience</th>
            <th scope="col">Pool Area</th>
            <th scope="col">Number Of floors</th>
            <th scope="col">Facility Free</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th scope="row">1</th>
            <td>Zon</td>
            <td>100</td>
            <td>55.5</td>
            <td>4</td>
            <td>1</td>
            <td>1</td>
            <td>3 Star</td>
            <td>Wifi free</td>
            <td>20</td>
            <td>2</td>
            <td>Cycle</td>
            <td><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editModal">Edit</button>
                <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">

                            </div>
                            <div class="modal-body">
                                <div class="m-2 row">
                                    <label class="col-sm-3 form-label"> Facility Type</label>
                                    <div class="col-sm-9">
                                        <input hidden type="text" name="facility_type_id" id="facilityTypeIdAdd">
                                        <button type="button" onclick="addVilla()">Villa</button>
                                        <button type="button" onclick="addHouse()">House</button>
                                        <button type="button" onclick="addRoom()">Room</button>
                                    </div>
                                </div>


                                <div class="m-2 row">
                                    <label class="col-sm-3 col-form-label">Facility Name</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="nameAdd" name="name">
                                    </div>
                                </div>

                                <div class="m-2 row">
                                    <label class="col-sm-3 col-form-label">Area</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="areaAdd" name="area">
                                    </div>
                                </div>

                                <div class="m-2 row">
                                    <label class="col-sm-3 col-form-label">Cost</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="costAdd" name="cost">
                                    </div>
                                </div>

                                <div class="m-2 row">
                                    <label class="col-sm-3 col-form-label">Max People</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="maxPeopleAdd" name="max_people">
                                    </div>
                                </div>

                                <div class="m-2 row">
                                    <label class="col-sm-3 col-form-label">Rent Type Name</label>
                                    <div class="col-sm-9">
                                        <select class="form-select" name="rent_type_id" id="rentTypeAdd">
                                            <c:forEach var="rt" items="${rentTypeList}">
                                                <option value="${rt.id}">${rt.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div id="standardRoomAdd">
                                    <div class="m-2 row">
                                        <label class="col-sm-3 col-form-label">Standard Room</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" name="standard_room">
                                        </div>
                                    </div>
                                </div>

                                <div id="descriptionAdd">
                                    <div class="m-2 row" >
                                        <label class="col-sm-3 col-form-label">Description Other Convenience</label>
                                        <div class="col-sm-9 ">
                                            <input type="text" class="form-control" name="description_other_convenience">
                                        </div>
                                    </div>
                                </div>
                                <div id="poolAreaAdd">
                                    <div class="m-2 row" >
                                        <label class="col-sm-3 col-form-label">Pool Area</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" name="pool_area">
                                        </div>
                                    </div>
                                </div>
                                <div class="m-2 row" id="numberOfFloorsAdd">
                                    <label class="col-sm-3 col-form-label">Number of Floors</label>
                                    <div class="col-sm-9 ">
                                        <input type="text" class="form-control" name="number_of_floors">
                                    </div>
                                </div>
                                <div class="m-2 row" id="facilityFreeAdd">
                                    <label class="col-sm-3  col-form-label">Facility Free</label>
                                    <div class="col-sm-9 ">
                                        <input type="text" class="form-control" name="facility_free">
                                    </div>
                                </div>

                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary">Save changes</button>
                            </div>
                        </div>
                    </div>
                </div>
            </td>

            <td><button type="button" class="btn btn-danger">Delete</button></td>

        </tr>
        <tr>
            <th scope="row">2</th>
            <td>Miu</td>
            <td>150</td>
            <td>150.5</td>
            <td>10</td>
            <td>2</td>
            <td>2</td>
            <td>5 Star</td>
            <td>Wifi free</td>
            <td>30</td>
            <td>2</td>
            <td>Car</td>
            <td><button type="button" class="btn btn-primary">Edit</button></td>
            <td><button type="button" class="btn btn-danger">Delete</button></td>
        </tr>
        <tr>
            <th scope="row">3</th>
            <td>Ken</td>
            <td>120</td>
            <td>101</td>
            <td>6</td>
            <td>3</td>
            <td>3</td>
            <td>4 Star</td>
            <td>Wifi free</td>
            <td>20</td>
            <td>2</td>
            <td>Motobike</td>
            <td><button type="button" class="btn btn-primary">Edit</button></td>
            <td><button type="button" class="btn btn-danger">Delete</button></td>
        </tr>
        </tbody>
    </table>
</div>
<div class="justify-content-center d-flex">
    <button type="button" class="btn btn-success"  data-bs-toggle="modal" data-bs-target="#addModal">Add</button>

    <div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="">Add Service</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body m-0 p-0">

                    <form class="form-horizontal" action="/facility">
                        <div class="row form-group align-items-center m-2">
                            <div class=" col-sm-2">
                                <label class="control-label" for="id">ID:</label></div>
                            <div class="col-sm-10">
                                <input type="email" class="form-control w-75" id="id" placeholder="Enter email">
                            </div>
                        </div>
                        <div class="row form-group align-items-center m-2">
                            <div class=" col-sm-2"><label class="control-label" for="name">Name:</label></div>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" id="name" placeholder="Enter email">
                            </div>
                        </div>
                        <div class="row form-group align-items-center m-2">
                            <div class=" col-sm-2"><label class="control-label" for="area">Area:</label></div>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" id="area" placeholder="Enter email">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="d-flex justify-content-center">
                                <button type="submit" class="btn btn-success">Submit</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
    <script>
    function addVilla() {
        document.getElementById("facilityTypeIdAdd").value = 1;
        document.getElementById("standardRoomAdd").style.display = 'block';
        document.getElementById("descriptionAdd").style.display = 'block';
        document.getElementById("poolAreaAdd").style.display = 'block';
        document.getElementById("numberOfFloorAdd").style.display = 'block';
        document.getElementById("facilityFreeAdd").style.display = 'none';
    }

    function addHouse() {
        document.getElementById("facilityTypeIdAdd").value = 2;
        document.getElementById("standardRoomAdd").style.display = 'block';
        document.getElementById("descriptionAdd").style.display = 'block';
        document.getElementById("poolAreaAdd").style.display = 'none';
        document.getElementById("numberOfFloorAdd").style.display = 'block';
        document.getElementById("facilityFreeAdd").style.display = 'none';
    }

    function addRoom() {
        document.getElementById("facilityTypeIdAdd").value = 3;
        document.getElementById("standardRoomAdd").style.display = "none";
        document.getElementById("descriptionAdd").style.display = "none";
        document.getElementById("poolAreaAdd").style.display = "none";
        document.getElementById("numberOfFloorAdd").style.display = "none";
        document.getElementById("facilityFreeAdd").style.display = "block";
    }

</script>
<script src="../../bootstrap-5.1.3-dist/js/bootstrap.js"></script>

</body>

</html>

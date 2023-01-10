<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 1/5/2023
  Time: 8:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Contract</title>
    <link rel="stylesheet" href="../../bootstrap-5.1.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="../../css-home.css">
    <link rel="stylesheet" href="../../css-form.css">

    <%--  phân trang--%>
    <link rel="stylesheet" href="../../bootstrap520/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../datatables/css/dataTables.bootstrap5.min.css">

</head>
<body>

<c:import url="../home/navbar.jsp"></c:import>
<h2>Contract</h2>
<h3 class="message">${message}</h3>
<div class="table-list">
    <div class="table-responsive">
        <table class="table table-striped w-100" id="tableContract">
            <thead style="vertical-align: top; text-align: center">
            <tr class="text-center">
                <th scope="col">#</th>
                <th scope="col" class="text-center">Facility Name</th>
                <th scope="col" class="text-center">Customer Name</th>
                <th scope="col" class="text-center">Start day</th>
                <th scope="col" class="text-center">End day</th>
                <th scope="col" class="text-center">Deposit</th>
                <th scope="col" class="text-center">Total cost</th>
                <th scope="col" class="text-center">Attach facility</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="contractVirtual" items="${contractVirtualList}">
                <tr>
                    <td>${contractVirtual.getId()}</td>
                    <td>${contractVirtual.getFacility().getName()}</td>
                    <td>${contractVirtual.getCustomer().getName()}</td>
                    <td>${contractVirtual.getStartDay()}</td>
                    <td>${contractVirtual.getEndDay()}</td>
                    <td>${contractVirtual.getDeposit()}</td>
                    <td>${contractVirtual.getTotalCost()}</td>
                    <td>
                        <button type="button" onclick="showAttachFacility(${contractVirtual.id})" class="btn btn-primary" data-bs-toggle="modal"
                                data-bs-target="#newAttachFacilityModal">+
                        </button>
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                data-bs-target="#attachFacilityList${contractVirtual.id}">Attach facility list
                        </button>
                    </td>
                </tr>

                <%--modal attach  Facility List--%>

                <div class="modal fade" id="attachFacilityList${contractVirtual.id}" tabindex="-1"
                     aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Attach Facility List Id ${contractVirtual.id}</h5>
                            </div>

                                <div class="modal-body p-3">
                                    <div class="row">
                                    <div class="col-md-2 border-end border-bottom text-center text-bg-primary">Id</div>
                                    <div class="col-md-4 border-end border-bottom text-center text-bg-primary">Name</div>
                                    <div class="col-md-4 border-end border-bottom text-center text-bg-primary">Cost</div>
                                    <div class="col-md-2 border-end border-bottom text-center text-bg-primary">Quantity</div>
                                    </div>
                                    <c:forEach var="contractDetailVirtual" items="${contractVirtual.contractDetailVirtualList}">
                                        <div class="row">
                                            <div class="col-md-2 border-end border-bottom text-center">${contractDetailVirtual.contractId}</div>
                                            <div class="col-md-4 border-end border-bottom text-center">${contractDetailVirtual.attachFacility.name}</div>
                                            <div class="col-md-4 border-end border-bottom text-center">${contractDetailVirtual.attachFacility.cost}</div>
                                            <div class="col-md-2 border-bottom text-center">${contractDetailVirtual.quantity}</div>
                                        </div>
                                    </c:forEach>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Ok
                                    </button>
                                </div>
                                </div>
                        </div>
                    </div>
                </div>



            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<div class="justify-content-center d-flex">
    <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addModal">Add New Contract</button>
</div>



<%--modal add contract--%>
<div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body m-0 p-0">

                <form class="form-horizontal" action="/contract?action=add" method="post">

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4">
                            <label class="control-label" for="startDate">Start date:</label></div>
                        <div class="col-sm-8">
                            <input type="date" class="form-control" id="startDate" name="startDate">
                        </div>
                    </div>

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4">
                            <label class="control-label" for="endDate">End date:</label></div>
                        <div class="col-sm-8">
                            <input type="date" class="form-control" id="endDate" name="endDate">
                        </div>
                    </div>

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4">
                            <label class="control-label" for="deposit">Deposit:</label></div>
                        <div class="col-sm-8">
                            <input required oninput="checkDeposit(this.value)" type="number" class="form-control" id="deposit" name="deposit">
                            <span id="errorDeposit" class="ms-5"></span>
                        </div>
                    </div>

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4">
                            <label class="control-label" for="totalCost">Total cost:</label></div>
                        <div class="col-sm-8">
                            <input type="number" class="form-control" id="totalCost" name="totalCost" readonly>
                        </div>
                    </div>

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4">
                            <label class="control-label">Customers rent service:</label></div>
                        <div class="col-sm-8">
                            <select class="form-control" name="customerId">
                                <option value="0">Chọn khách hàng</option>
                                <c:forEach var="customer" items="${customerList}">
                                    <option value="${customer.id}">${customer.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4">
                            <label class="control-label">Service:</label></div>
                        <div class="col-sm-8">
                            <select class="form-control" name="facilityId">
                                <option value="0">Chọn dịch vụ</option>
                                <c:forEach var="facility" items="${facilityList}">
                                    <option value="${facility.id}">${facility.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

<%--                    <div class="row form-group align-items-center m-2">--%>
<%--                        <div class=" col-sm-4">--%>
<%--                            <label class="control-label" for="attachFacilityId">Attach facility:</label></div>--%>
<%--                        <div class="col-sm-8">--%>
<%--                            <button class="btn btn-primary mx-4" id="attachFacilityId" name="attachFacilityId">+</button>--%>
<%--                        </div>--%>
<%--                    </div>--%>

                    <div class="form-group">
                        <div class="d-flex justify-content-center">
                            <button type="button" class="btn btn-secondary m-1" data-bs-dismiss="modal">Cancel
                            </button>
                            <button type="submit" id="buttonCreate" disabled class="btn btn-primary m-1">Create contract
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%--modal add contract detail--%>
<div class="modal fade" id="newAttachFacilityModal" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form class="form-horizontal" action="/contract?action=addAF" method="post">
            <div class="modal-header d-flex justify-content-center">
                <span>Add Attach Facility Into Contract Id </span>
                <input class="bg-primary mx-2 text-center text-light" id="contractId" name="contractId" readonly style="width: 30px">
            </div>
            <div class="modal-body m-0 p-0">
                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4">
                            <label class="control-label">Attach Facility:</label></div>
                        <div class="col-sm-8">
                            <select class="form-control" name="idAttachFacility">
                                <option value="0">Chọn dịch vụ đi kèm</option>
                                <c:forEach var="attachFacility" items="${attachFacilityList}">
                                    <option value="${attachFacility.id}">${attachFacility.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4">
                            <label class="control-label">Quantity:</label></div>
                        <div class="col-sm-8">
                            <input required pattern="^[1-9]\d*$" title="Số lượng phải là số nguyên dương" type="number" class="form-control" id="quantity" name="quantity">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="d-flex justify-content-center">
                            <button type="button" class="btn btn-secondary m-1" data-bs-dismiss="modal">Cancel
                            </button>
                            <button type="submit" class="btn btn-primary m-1">Add
                            </button>
                        </div>
                    </div>

            </div>
            </form>
        </div>
    </div>
</div>




<script src="../../bootstrap-5.1.3-dist/js/bootstrap.js"></script>
<%-- phân trang--%>
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

    function showAttachFacility(id) {
        document.getElementById("contractId").value = id;
    }
    function checkDeposit(deposit){
        if(deposit < 0){
            document.getElementById("errorDeposit").innerText = "Tiền đặt cọc phải là số dương"
            document.getElementById("buttonCreate").disabled = true;
        }else {
            document.getElementById("errorDeposit").innerText = ""
            document.getElementById("buttonCreate").disabled = false;
        }
    }
</script>
</body>
</html>

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
    <link rel="stylesheet" href="../../css-customer.css">

    <%--  phân trang--%>
    <link rel="stylesheet" href="../../bootstrap520/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../datatables/css/dataTables.bootstrap5.min.css">

</head>
<body>
<c:import url="../home/navbar.jsp"></c:import>
<h2>Contract</h2>
<p class="message">
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<div class="table-list">
    <div class="table-responsive">
        <table class="table table-striped w-100" id="tableContract">
            <thead style="vertical-align: top; text-align: center">
            <tr class="text-center">
                <th scope="col">#</th>
                <th scope="col" class="text-center">Facility</th>
                <th scope="col" class="text-center">Customer</th>
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
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                data-bs-target="#newContractDetailModal">+
                        </button>
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                data-bs-target="#attachFacilityList">Attach facility list
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<%--modal edit--%>
<div class="modal fade" id="newContractDetailModal" tabindex="-1" aria-labelledby="exampleModalLabel"
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
                            <input type="number" class="form-control" id="deposit" name="deposit">
                        </div>
                    </div>

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4">
                            <label class="control-label" for="totalCost">Total cost:</label></div>
                        <div class="col-sm-8">
                            <input type="number" class="form-control" id="totalCost" name="totalCost">
                        </div>
                    </div>

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4">
                            <label class="control-label" for="customerId">Customers rent service:</label></div>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="customerId" name="customerId">
                        </div>
                    </div>

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4">
                            <label class="control-label" for="facilityId">Service:</label></div>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="facilityId" name="facilityId">
                        </div>
                    </div>

                    <div class="row form-group align-items-center m-2">
                        <div class=" col-sm-4">
                            <label class="control-label" for="attachFacilityId">Attach facility:</label></div>
                        <div class="col-sm-8">
                            <button class="btn btn-primary mx-4" id="attachFacilityId" name="attachFacilityId">+</button>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="d-flex justify-content-center">
                            <button type="button" class="btn btn-secondary m-1" data-bs-dismiss="modal">Cancel
                            </button>
                            <button type="submit" class="btn btn-primary m-1">Create contract
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%--modal attach  Facility List--%>

<div class="modal fade" id="attachFacilityList" tabindex="-1"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Attach Facility List</h5>
            </div>
            <div class="modal-body">
                ...
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel
                </button>
                <form action="#" method="post">
                    <button type="submit" class="btn btn-primary">Ok
                    </button>
                </form>
            </div>
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
</script>
</body>
</html>

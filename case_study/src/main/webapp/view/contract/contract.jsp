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
    <table class="table table-striped">
      <thead style="vertical-align: top; text-align: center">
      <tr>
        <th scope="col">#</th>
        <th scope="col">Facility</th>
        <th scope="col">Customer</th>
        <th scope="col">Start day</th>
        <th scope="col">End day</th>
        <th scope="col">Deposit</th>
        <th scope="col">Total cost</th>
        <th colspan="2" scope="col">Attach facility</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="contract" items="${contractList}" varStatus="vt">
        <tr>
          <td>${vt.count}</td>
          <td>${contract.facilityId}</td>
          <td>${contract.customerId}</td>
          <td>${contract.startDay}</td>
          <td>${contract.endDay}</td>
          <td>${contract.deposit}</td>
          <td></td>
          <td>
            <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                    data-bs-target="#editModal${contract.id}">+
            </button>
          </td>
          <td>
            <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                    data-bs-target="#deleteModal${contract.id}">Attach facility list
            </button>

          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>
</div>
<%--modal edit--%>
<div class="modal fade" id="editModal${employee.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Edit Customer</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body m-0 p-0">

        <form class="form-horizontal" action="/customer?action=edit&id=${employee.id}" method="post">

          <div class="row form-group align-items-center m-2">
            <div class=" col-sm-4">
              <label class="control-label" for="edit-id">ID:</label></div>
            <div class="col-sm-8">
              <p type="number" class="form-control" id="edit-id" name="${employee.id}">${employee.id}</p>
            </div>
          </div>

          <div class="row form-group align-items-center m-2">
            <div class=" col-sm-4"><label class="control-label" for="edit-customer-type-id">Customer Type
              Id:</label></div>
            <div class="col-sm-8">
              <input type="number" class="form-control" id="edit-customer-type-id"
                     name="new-customer-type-id" value="${employee.customerTypeId}">
            </div>
          </div>

          <div class="row form-group align-items-center m-2">
            <div class=" col-sm-4"><label class="control-label" for="edit-name">Name:</label></div>
            <div class="col-sm-8">
              <input type="text" class="form-control" id="edit-name" name="new-name"
                     value="${employee.name}">
            </div>
          </div>

          <div class="row form-group align-items-center m-2">
            <div class=" col-sm-4"><label class="control-label" for="edit-day-of-birth">Day Of
              Birth:</label></div>
            <div class="col-sm-8">
              <input type="date" class="form-control" id="edit-day-of-birth" name="new-day-of-birth"
                     value="${employee.dayOfBirth}">
            </div>
          </div>

          <div class="row form-group align-items-center m-2">
            <div class=" col-sm-4"><label class="control-label">Gender:</label></div>
            <div class="col-sm-8">
              <select class="form-control w-25" name="edit-gender value="${employee.gender}">
              <option value="male">Male</option>
              <option value="female">Female</option>
              </select>
            </div>
          </div>

          <div class="row form-group align-items-center m-2">
            <div class=" col-sm-4"><label class="control-label" for="edit-id-card">ID card:</label></div>
            <div class="col-sm-8">
              <input type="number" minlength="9" maxlength="12" class="form-control"
                     name="new-id-card" id="edit-id-card" value="${employee.idCard}">
            </div>
          </div>

          <div class="row form-group align-items-center m-2">
            <div class=" col-sm-4"><label class="control-label" for="edit-phone-number">Phone
              number:</label></div>
            <div class="col-sm-8">
              <input type="number" maxlength="10" minlength="9" class="form-control"
                     name="new-phone-number" id="edit-phone-number" value="${employee.phoneNumber}">
            </div>
          </div>

          <div class="row form-group align-items-center m-2">
            <div class=" col-sm-4"><label class="control-label" for="edit-email">Email:</label></div>
            <div class="col-sm-8">
              <input type="email" class="form-control" id="edit-email" name="new-email"
                     value="${employee.email}">
            </div>
          </div>

          <div class="row form-group align-items-center m-2">
            <div class=" col-sm-4"><label class="control-label" for="edit-address">Address:</label></div>
            <div class="col-sm-8">
              <input type="text" class="form-control" id="edit-address" name="new-address"
                     value="${employee.address}">
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
<%--modal delete--%>

<div class="modal fade" id="deleteModal${employee.id}" tabindex="-1"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Delete customer</h5>
      </div>
      <div class="modal-body">
        Are you sure you want to delete customer ${employee.name}?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel
        </button>
        <form action="/customer?action=delete&id=${employee.id}" method="post"><button type="submit" class="btn btn-primary">Delete
        </button></form>
      </div>
    </div>
  </div>
</div>

</body>
</html>

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
    <link rel="stylesheet" href="../bootstrap-5.1.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="../css-home.css">
    <link rel="stylesheet" href="../css-customer.css">
</head>
<body>
<c:import url="navbar.jsp"></c:import>
<h2>Customer</h2>
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
                <th scope="col">ID</th>
                <th scope="col">Customer Type ID</th>
                <th scope="col">Name</th>
                <th scope="col">Day Of Birth</th>
                <th scope="col">Gender</th>
                <th scope="col">ID card</th>
                <th scope="col">Phone Number</th>
                <th scope="col">Email</th>
                <th scope="col">Address</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="customer" items="${customerList}">
                <tr>
                    <td>${customer.id}</td>
                    <td>${customer.customerTypeId}</td>
                    <td>${customer.name}</td>
                    <td>${customer.dayOfBirth}</td>
                    <c:if test="${customer.gender}">
                        <td>Nam</td>
                    </c:if>
                    <c:if test="${!customer.gender}">
                        <td>Nữ</td>
                    </c:if>
                    <td>${customer.idCard}</td>
                    <td>${customer.phoneNumber}</td>
                    <td>${customer.email}</td>
                    <td>${customer.address}</td>
                    <td>
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                data-bs-target="#editModal${customer.id}">Edit
                        </button>

                        <div class="modal fade" id="editModal${customer.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Edit Customer</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body m-0 p-0">

                                        <form class="form-horizontal" action="/customer?action=edit&id=${customer.id}" method="post">

                                            <div class="row form-group align-items-center m-2">
                                                <div class=" col-sm-4">
                                                    <label class="control-label" for="edit-id">ID:</label></div>
                                                <div class="col-sm-8">
                                                    <p type="number" class="form-control" id="edit-id" name="${customer.id}">${customer.id}</p>
                                                </div>
                                            </div>

                                            <div class="row form-group align-items-center m-2">
                                                <div class=" col-sm-4"><label class="control-label" for="edit-customer-type-id">Customer Type
                                                    Id:</label></div>
                                                <div class="col-sm-8">
                                                    <input type="number" class="form-control" id="edit-customer-type-id"
                                                           name="new-customer-type-id" value="${customer.customerTypeId}">
                                                </div>
                                            </div>

                                            <div class="row form-group align-items-center m-2">
                                                <div class=" col-sm-4"><label class="control-label" for="edit-name">Name:</label></div>
                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control" id="edit-name" name="new-name"
                                                           value="${customer.name}">
                                                </div>
                                            </div>

                                            <div class="row form-group align-items-center m-2">
                                                <div class=" col-sm-4"><label class="control-label" for="edit-day-of-birth">Day Of
                                                    Birth:</label></div>
                                                <div class="col-sm-8">
                                                    <input type="date" class="form-control" id="edit-day-of-birth" name="new-day-of-birth"
                                                           value="${customer.dayOfBirth}">
                                                </div>
                                            </div>

                                            <div class="row form-group align-items-center m-2">
                                                <div class=" col-sm-4"><label class="control-label">Gender:</label></div>
                                                <div class="col-sm-8">
                                                    <select class="form-control w-25" name="edit-gender value="${customer.gender}">
                                                        <option value="male">Male</option>
                                                        <option value="female">Female</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="row form-group align-items-center m-2">
                                                <div class=" col-sm-4"><label class="control-label" for="edit-id-card">ID card:</label></div>
                                                <div class="col-sm-8">
                                                    <input type="number" minlength="9" maxlength="12" class="form-control"
                                                           name="new-id-card" id="edit-id-card" value="${customer.idCard}">
                                                </div>
                                            </div>

                                            <div class="row form-group align-items-center m-2">
                                                <div class=" col-sm-4"><label class="control-label" for="edit-phone-number">Phone
                                                    number:</label></div>
                                                <div class="col-sm-8">
                                                    <input type="number" maxlength="10" minlength="9" class="form-control"
                                                           name="new-phone-number" id="edit-phone-number" value="${customer.phoneNumber}">
                                                </div>
                                            </div>

                                            <div class="row form-group align-items-center m-2">
                                                <div class=" col-sm-4"><label class="control-label" for="edit-email">Email:</label></div>
                                                <div class="col-sm-8">
                                                    <input type="email" class="form-control" id="edit-email" name="new-email"
                                                           value="${customer.email}">
                                                </div>
                                            </div>

                                            <div class="row form-group align-items-center m-2">
                                                <div class=" col-sm-4"><label class="control-label" for="edit-address">Address:</label></div>
                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control" id="edit-address" name="new-address"
                                                           value="${customer.address}">
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


                    </td>
                    <td>
                        <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                                data-bs-target="#deleteModal${customer.id}">Delete
                        </button>

                        <div class="modal fade" id="deleteModal${customer.id}" tabindex="-1"
                             aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Delete customer</h5>
                                    </div>
                                    <div class="modal-body">
                                        Are you sure you want to delete customer ${customer.name}?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel
                                        </button>
                                        <form action="/customer?action=delete&id=${customer.id}" method="post"><button type="submit" class="btn btn-primary">Delete
                                        </button></form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<div class="justify-content-center d-flex">
    <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addModal">Add</button>

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
                                <label class="control-label" for="new-id">ID:</label></div>
                            <div class="col-sm-8">
                                <input type="number" class="form-control" name="new-id" id="new-id"
                                       placeholder="Enter ID">
                            </div>
                        </div>

                        <div class="row form-group align-items-center m-2">
                            <div class=" col-sm-4"><label class="control-label" for="new-customer-type-id">Customer Type
                                Id:</label></div>
                            <div class="col-sm-8">
                                <input type="number" class="form-control" id="new-customer-type-id"
                                       name="new-customer-type-id" placeholder="Enter customer type id">
                            </div>
                        </div>

                        <div class="row form-group align-items-center m-2">
                            <div class=" col-sm-4"><label class="control-label" for="new-name">Name:</label></div>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="new-name" name="new-name"
                                       placeholder="Enter name">
                            </div>
                        </div>

                        <div class="row form-group align-items-center m-2">
                            <div class=" col-sm-4"><label class="control-label" for="new-day-of-birth">Day Of
                                Birth:</label></div>
                            <div class="col-sm-8">
                                <input type="date" class="form-control" id="new-day-of-birth" name="new-day-of-birth"
                                       placeholder="Enter day of birth">
                            </div>
                        </div>

                        <div class="row form-group align-items-center m-2">
                            <div class=" col-sm-4"><label class="control-label">Gender:</label></div>
                            <div class="col-sm-8">
                                <select class="form-control w-25" name="new-gender">
                                    <option value="male">Male</option>
                                    <option value="female">Female</option>
                                </select>
                            </div>
                        </div>

                        <div class="row form-group align-items-center m-2">
                            <div class=" col-sm-4"><label class="control-label" for="new-id-card">ID card:</label></div>
                            <div class="col-sm-8">
                                <input type="number" minlength="9" maxlength="12" class="form-control"
                                       name="new-id-card" id="new-id-card" placeholder="Enter ID card">
                            </div>
                        </div>

                        <div class="row form-group align-items-center m-2">
                            <div class=" col-sm-4"><label class="control-label" for="new-phone-number">Phone
                                number:</label></div>
                            <div class="col-sm-8">
                                <input type="number" maxlength="10" minlength="9" class="form-control"
                                       name="new-phone-number" id="new-phone-number" placeholder="Enter phone number">
                            </div>
                        </div>

                        <div class="row form-group align-items-center m-2">
                            <div class=" col-sm-4"><label class="control-label" for="new-email">Email:</label></div>
                            <div class="col-sm-8">
                                <input type="email" class="form-control" id="new-email" name="new-email"
                                       placeholder="Enter email">
                            </div>
                        </div>

                        <div class="row form-group align-items-center m-2">
                            <div class=" col-sm-4"><label class="control-label" for="new-address">Address:</label></div>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="new-address" name="new-address"
                                       placeholder="Enter address">
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
<script src="../bootstrap-5.1.3-dist/js/bootstrap.js"></script>
</body>
</html>

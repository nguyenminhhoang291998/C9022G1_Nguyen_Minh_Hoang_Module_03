<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/31/2022
  Time: 8:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../bootstrap-5.1.3-dist/css/bootstrap.css">
    <script src="../../bootstrap-5.1.3-dist/js/bootstrap.js"></script>
    <link rel="stylesheet" href="../../css-home.css">

</head>
<body>
<div class="navbar justify-content-center">
    <button>
        <a href="/home">Home</a>
    </button>
    <button>
        <a href="/employee">Employee</a>
    </button>
    <button>
        <a href="/customer">Customer</a>
    </button>
    <button>
        <a href="/facility">Service</a>
    </button>
    <button>
        <a href="/contract">Contract</a>
    </button>
    <form class="my-2" method="get">
    <div class="searchbar" style="background-color: #056e61;">
        <input name="action" value="find" hidden>
        <input class="search_input" type="text" name="nameFind" placeholder="Name...">
        <input class="search_input" type="text" name="nameFacilityFind" placeholder="Name Facility...">
        <button style="background-color: #056E61 " type="submit" class="search_icon m-0 p-0"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-search" style="background-color: #056E61;" viewBox="0 0 16 16">
            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
        </svg></button>
    </div>
    </form>
</div>
</body>
</html>

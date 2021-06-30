<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/29/2021
  Time: 2:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="../../bootstrap/bootstrap.min.css">

    <title>Furama Resort</title>
    <style>
        #footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            z-index: 3;
        }

        #nav-bar-sticky {
            position: -webkit-sticky;
            position: sticky;
            top: 0;
            z-index: 2;
        }
    </style>
</head>
<body>
<%--navbar--%>
<div class="container-fluid d-flex position-relative border-0 row   ">
    <div class="col-3 ">
        <a href="" class="img-fluid"><img class=" img-fluid mx-5"
                                          src="../../assert/img/logo_furama/logo_furama.png"
                                          height="117" width="87"/></a>
    </div>
    <div class="col-3">
        <a class=" img-fluid mx-5 px-5 align-items-center img-fluid"
           href="https://www.tripadvisor.com/Hotel_Review-g298085-d302750-Reviews-Furama_Resort_Danang-Da_Nang.html">
            <img
                    class="img-fluid  " src="../../assert/img/logo_tripadvisor/logo_tripadvisor.png"
            /></a>
    </div>
    <div class="col-6 text-right mt-2" > <span style="font-size: 30px ;" > Nguyễn Phi Khanh</span>
    </div>
</div>
<nav class="navbar navbar-expand-lg navbar-dark  container-fluid font-weight-bolder px-0 text-white" id="nav-bar-sticky" style=" height: 47px;background: #0F574B">

    <div class="collapse navbar-collapse  " id="navbarsExample07">
        <ul class="navbar-nav mr-auto" >
            <li class="nav-item active px-5">
                <a class="text-white" href="/home.jsp">Home</a>
            </li>

            <li class="nav-item active px-5">
                <a class="text-white" href="/customer">Customer</a>
            </li>

            <li class="nav-item active px-5">
                <a class="text-white" href="/employee">Employee</a>
            </li>


            <li class="nav-item active px-5">
                <a class="text-white" href="/service">Service</a>
            </li>

            <li class="nav-item active px-5">
                <a class="text-white" href="/contract">Contract</a>
            </li>
        </ul>



        <form method="get" action="/home?action=search" class="form-inline pt-3  align-items-end" style="position: relative">
            <div class="pl-5">
                <input class="form-control " type="search" placeholder="Search" aria-label="Search">
                <button type="submit" class="rounded-circle">
                    <img class="img-fluid rounded-circle" style="height: 32px;"
                         src="https://static.vecteezy.com/system/resources/previews/001/504/972/original/search-icon-free-vector.jpg"
                         alt="">
                </button>
            </div>
        </form>





    </div>
</nav>


<%--body--%>

    <div class="container-fluid mb-3">
         <img src="../../assert/img/logo_furama/Vietnam_Danang_Furama_Resort_Exterior_Courtyard-1.jpg" width="100%" height="500px">
    </div>


<div class="container">
    <!-- Example row of columns -->
    <div class="row">
        <div class="col-md-4">
            <h2>Heading</h2>
            <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris
                condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis
                euismod. Donec sed odio dui. </p>
            <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
        </div>
        <div class="col-md-4">
            <h2>Heading</h2>
            <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris
                condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis
                euismod. Donec sed odio dui. </p>
            <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
        </div>
        <div class="col-md-4">
            <h2>Heading</h2>
            <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula
                porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut
                fermentum massa justo sit amet risus.</p>
            <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
        </div>
    </div>
</div>



<%--footer--%>
<footer class="text-white ">
    <div class="container px-4 pb-3 text-center">
        <section class="mb-3">
            <span style="color: black">For more infomation@ </span>
            <a target="_blank" class="m-1 rounded-circle"
               href="https://www.facebook.com/furamaresort/"
               role="button">
                <img src="../../assert/img/icon/facebook.png"
                     class="img-fluid rounded-circle" style="height: 40px; width: 40px" alt="">
            </a>
            <a class="m-1 rounded-circle"
               href="https://www.instagram.com/furama_resort_danang/?hl=vi"
               role="button">
                <img src="../../assert/img/icon/283-2831746_insta-icon-instagram.png"
                     class="img-fluid rounded-circle" style="height: 30px; width: 30px" alt="">
            </a>
        </section>
    </div>

    <div class="text-center px-2 justify-content-center align-items-center " id="footer" style=" background: #0F574B">
        <span>COVID 19 UPDATE: The safety and well-being are our utmost priority</span>
        <a href="https://furamavietnam.com/covid-19-update/"><input class="my-1"  type="button" value="Learn more"
                                                                    style="background: #c1f8f0; border-radius: 5px;height: 25px">
        </a>
    </div>

</footer>
<div class="row container-fluid"></div>
<script src="../../bootstrap/jquery-3.6.0.min.js"></script>
<script src="../../bootstrap/popper.min.js"></script>
<script src="../../bootstrap/bootstrap.min.js"></script>
<script src="../../bootstrap/jquery.dataTables.min.js"></script>



</body>
</html>

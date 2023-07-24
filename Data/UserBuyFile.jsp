<%-- 
    Document   : UserViewFiles
    Created on : 12 Apr, 2021, 10:14:25 AM
    Author     : Ramu Maloth
--%>

<%@page import="com.clouds.db.DBConnection"%>
<%@page import="com.clouds.db.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">

  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- ===============================================-->
    <!--    Document Title-->
    <!-- ===============================================-->
    <title>Blockchain as a Platform for Secure Cloud Computing</title>

    <!-- ===============================================-->
    <!--    Favicons-->
    <!-- ===============================================-->
    <link rel="apple-touch-icon" sizes="180x180" href="assets/img/favicons/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="assets/img/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="assets/img/favicons/favicon-16x16.png">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicons/favicon.ico">
    <link rel="manifest" href="assets/img/favicons/manifest.json">
    <meta name="msapplication-TileImage" content="assets/img/favicons/mstile-150x150.png">
    <meta name="theme-color" content="#ffffff">

    <!-- ===============================================-->
    <!--    Stylesheets-->
    <!-- ===============================================-->
    <link href="assets/css/theme.min.css" rel="stylesheet" />
  </head>

  <body>
    <!-- ===============================================-->
    <!--    Main Content-->
    <!-- ===============================================-->
    <main class="main" id="top">
      <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3 backdrop" data-navbar-on-scroll="data-navbar-on-scroll">
        <div class="container"><a class="navbar-brand d-flex align-items-center fw-bolder fs-2 fst-italic" href="#">
            <div class="text-info">Blockchain  as a Platform </div>
            <div class="text-warning">&nbsp;for Secure Cloud Computing Services</div>
          </a><button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
          <jsp:include page="usermenu.jsp"></jsp:include>
        </div>
      </nav>
      <section class="py-0" id="home">
        <div class="bg-holder d-none d-sm-block" style="background-image:url(assets/img/illustrations/hero-bg.png);background-position:right top;background-size:contain;"></div>
        <!--/.bg-holder-->
        <div class="bg-holder d-sm-none" style="background-image:url(assets/img/illustrations/hero-bg.png);background-position:right top;background-size:contain;"></div>
        <!--/.bg-holder-->
        <div class="container">
         
        </div>
      </section>
      

      <!-- ============================================-->
      <!-- <section> begin ============================-->
      <section class="py-8">
        <div class="container">
            <h2><abbr>Users Start Transactions</abbr></h2>
            <%
                String fileid = request.getParameter("id");
                String price = request.getParameter("price");
            %>
                             <form class="text-left clearfix mt-30" action="./StartBlockChainAction" method="POST">

                            <table class="table sm text-center text-primary">
                                <tr>
                                    <td>Login User Name</td>
                                    <td><input type="text" name="loginuser" value="<%= session.getAttribute("userid")%>" readonly=""> </td>
                                    <td>Cloud File ID</td>
                                    <td><input type="text" name="cloudfileid" value="<%=fileid%>" readonly=""> </td>
                                </tr>
                                <tr>
                                    <td>Mobile</td>
                                    <td><input type="text" name="mobile"  required=""> </td>
                                    <td>Email</td>
                                    <td><input type="text" name="email" required=""> </td>
                                </tr>
                                
                                
                                
                                <tr>                                    
                                    <td>Name On Card</td>
                                    <td><input type="text" name="nameoncard" style="text-transform: uppercase;" placeholder="Name On Card" required > </td>
                                    <td>Payable Amount &#x20B9;</td>
                                    <td><input type="text" name="totalamount" value="<%=price%>" readonly=""> </td>
                                </tr>
                                
                                <tr>                                    
                                    <td>Credit/Debit Card Number</td>
                                    <td><input type="text" name="cardnumber" pattern="[123456789][0-9]{15}" placeholder="Credit / Debit Card Number" required > </td>
                                    <td>CVV Number</td>
                                    <td><input type="text" name="cvv" pattern="[12345678][0-9]{2}" placeholder="CVV Number" required> </td>
                                </tr>
                                
                                <tr>                                    
                                    <td>Expiry Date</td>
                                    <td><input type="month" name="cardexpiry" id="datepicker" min="2020-10" max="2030-12"  placeholder="Card Expiry Date" required > </td>
                                    <td>Select Blockchain Platform</td>
                                    <td>
                                        <select name="blkplatform" required="">
                                            <option vavalue="">--Select BlackChain Platform--</option>
                                            <option value="AWS Blockchain">AWS Blockchain</option>
                                            <option value="Azure Blockchain">Azure Blockchain</option>
                                            
                                        </select>
                                    </td>
                                </tr>
                                
                            </table>
                            
                            <center>
            <button type="submit" class="btn btn-success text-center">Start Transaction</button>
                                </center>
          </form>


        
        </div><!-- end of .container-->
      </section><!-- <section> close ============================-->
      
     
    </main><!-- ===============================================-->
    <!--    End of Main Content-->
    <!-- ===============================================-->



    <!-- ===============================================-->
    <!--    JavaScripts-->
    <!-- ===============================================-->
    <script src="vendors/@popperjs/popper.min.js"></script>
    <script src="vendors/bootstrap/bootstrap.min.js"></script>
    <script src="vendors/is/is.min.js"></script>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
    <script src="assets/js/theme.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400&amp;display=swap" rel="stylesheet">
  </body>

</html>
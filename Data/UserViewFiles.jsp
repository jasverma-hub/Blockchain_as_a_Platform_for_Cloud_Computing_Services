<%-- 
    Document   : UserViewFiles
    Created on : 12 Apr, 2021, 10:14:25 AM
    Author     : Ramu Maloth
--%>

<%@page import="com.cbchain.utility.CheckUserPurchase"%>
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
            <h2><abbr>Users View ALl Files</abbr></h2>
                            <table border="2px" class="table table-hover">
                                <thead>
                                    <tr class="table-danger">
                                        <th scope="col">S.No</th>
                                        <th scope="col">File Name</th>
                                        <th scope="col">File Type</th>
                                        <th scope="col">Category</th>
                                        <th scope="col">Size</th>
                                        <th scope="col">Date</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Buy</th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        PreparedStatement ps = null;
                                        ResultSet rs = null;
                                        int count = 0;
                                        CheckUserPurchase cup = new CheckUserPurchase();
                                        String username = session.getAttribute("userid").toString();
                                    try(Connection con = DBConnection.getDBConnection()){
                                        String sqlQuery = "select *from cloudfiles";
                                        ps = con.prepareStatement(sqlQuery);
                                        rs = ps.executeQuery();
                                        while(rs.next()){
                                        count++;
                                        int id = rs.getInt("id");
                                        float price = rs.getFloat("price");
                                        boolean flag = cup.checkBuyingStatus(id, username);
                                        
                                        %>
                                     <tr scope="row" style="color: BLUE; background-color:#FFFCBB">
                                        <td><%=count%></td>
                                        <td><%=rs.getString("filename")%></td>
                                        <td><%=rs.getString("filetype")%></td>
                                        <td><%=rs.getString("category")%></td>
                                        <td><%=rs.getLong("filezie")%> Bytes</td>
                                        <td><%=rs.getDate("cdate")%></td>
                                        <td><%=price%></td>
                                        <td>
                                            <%
                                            if(flag==false){
                                            %>
                                            <a class="btn-link" href="./UserBuyFile.jsp?id=<%=id%>&price=<%=price%>" style="color:DARKBLUE">Buy</a>
                                            <%
                                            }else{
                                            %>
                                            <a class="btn-link" href="./UserFileDownload.jsp?id=<%=id%>" target="_blank" style="color:DARKBLUE">Download</a>
                                            <%
                                            }
                                            %>
                                            
                                        </td>
                                        
                                        
                                    </tr>

                                    <%
                                        
                                        }
                                        
                                        
                                    
                                    }catch(Exception ex){
                                    System.out.println("Error at Activating users "+ex.getMessage());
                                    }
                                    %>
                                    
                                                                      


                                </tbody>
                            </table>


        
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
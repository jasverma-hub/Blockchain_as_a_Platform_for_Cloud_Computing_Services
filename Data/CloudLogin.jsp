<!DOCTYPE html>
<html lang="en-US" dir="ltr">

  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- ===============================================-->
    <!--    Document Title-->
    <!-- ===============================================-->
    <title>Blockchain as a Platform for Secure Cloud Computing Services</title>

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
          <div class="collapse navbar-collapse border-top border-lg-0 mt-4 mt-lg-0" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto pt-2 pt-lg-0">
              <li class="nav-item px-2"><a class="nav-link fw-medium active" aria-current="page" href="index.jsp">Home</a></li>
              <li class="nav-item px-2"><a class="nav-link fw-medium" href="UserLogin.jsp">User</a></li>
              <li class="nav-item px-2"><a class="nav-link fw-medium" href="CloudLogin.jsp">Cloud</a></li>
            </ul>
              <a href="UserRegistration.jsp" class="btn btn-lg btn-primary rounded-pill bg-gradient order-0">Register</a>
          </div>
        </div>
      </nav>
      <!-- ============================================-->
      <!-- <section> begin ============================-->
      <section class="py-8">
        <div class="container">
            <span class="row flex-center">Admin Login Form</span>
            <center>
                            <p>
                            <form action="./AdminLoginCheck.jsp" method="POST" class="table-responsive" style="width:100%">
                                <table>
                                    
                                    <tr style="color: white;"><td></td>
                                        <td>Login ID</td>
                                        <td><input type="text" name="loginid" required="" pattern='[a-zA-Z]+'></td>
                                    </tr>
                                    <tr style="color: white;"><td></td>
                                        <td>Password</td>
                                        <td><input type="password" name="pswd" required="" ></td>
                                    </tr>
                                    <tr>
                                        <td></td><td></td>
                                        <td><button type="submit" value="Register" class="btn btn-secondary px-4 py-3">Login</button></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="form-group mt-3">
                                                <span  >&nbsp;</span>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                         <%
                                String msg = request.getParameter("msg");
                                if (msg != null && msg.equalsIgnoreCase("success")) {
                                    out.println("<font color='WHITE'>Login Success </font>");
                                } else if (msg != null && msg.equalsIgnoreCase("failed")) {
                                    out.println("<font color='PINK'>Invalid Login Details</font>");
                                }

                            %>

                                    </tr>
                                </table>

                            </form
            </p>
            </center>
        </div>
      </section>

          <!-- ============================================-->
          <!-- <section> begin ============================-->
          <section class="py-8">
            <div class="container">
              <div class="row flex-center">
                <div class="col-md-5 order-md-1 text-center text-md-end"><img class="img-fluid mb-4" src="assets/img/illustrations/jobs.png" width="450" alt="" /></div>
                <div class="col-md-5 text-center text-md-start">
                  <h6 class="fw-bold fs-3 display-3 lh-sm">Anonymous file sharing mechanism</h6>
                  <p class="my-4 pe-xl-8">A traditional Decentralized application (Dapp) architecture, in which all operations are controlled by a centralized service. Even when the user wants to do something that has nothing to do with other users, it must pass through a centralized service. The proposed framework, each user can see that no one can hold all of the operation rights. For example, a cloud service provider only be responsible for part of a service, and then the writing and correctness of the information give back to the owner to dealing. Decentralized architecture clearly defines and minimizes the power of each person.</p>
                </div>
              </div>
            </div><!-- end of .container-->
          </section><!-- <section> close ============================-->
          <!-- ============================================-->

        </div><!-- end of .container-->
      </section><!-- <section> close ============================-->
      
      <section class="py-0 bg-primary-gradient">
        <div class="bg-holder" style="background-image:url(assets/img/illustrations/footer-bg.png);background-position:center;background-size:cover;"></div>
        <!--/.bg-holder-->
        <div class="container">
          <div class="row flex-center py-8">
            <div class="col-lg-6 mb-4 text-center">
              <h1 class="text-white">*</h1>
            </div>
          
          </div>
          
          <div class="row justify-content-center">
            <div class="col-auto mb-2">
              <p class="mb-0 fs--1 text-white my-2 text-center">&copy; This template is made with&nbsp;<svg class="bi bi-suit-heart-fill" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#1F3A63" viewBox="0 0 16 16">
                  <path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z"></path>
                </svg>&nbsp;by&nbsp;<a class="text-white" href="https://alexcorpo.com/" target="_blank">Alex Corporation </a></p>
            </div>
          </div>
        </div>
      </section>
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
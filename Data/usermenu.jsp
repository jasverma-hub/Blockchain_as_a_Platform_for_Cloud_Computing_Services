<div class="collapse navbar-collapse border-top border-lg-0 mt-4 mt-lg-0" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto pt-2 pt-lg-0">
              <li class="nav-item px-2"><a class="nav-link fw-medium active" aria-current="page" href="UserHome.jsp">Home</a></li>
              <li class="nav-item px-2"><a class="nav-link fw-medium" href="UserViewFiles.jsp">Files</a></li>
              <li class="nav-item px-2"><a class="nav-link fw-medium" href="UserTransactions.jsp">Transactions</a></li>
              <li class="nav-item px-2"><a class="nav-link fw-medium" href="logout.jsp">Logout</a></li>
            </ul>
    <%
        String username = session.getAttribute("userid").toString();
    %>
              <a href="" class="btn btn-lg btn-primary rounded-pill bg-gradient order-0"><%=username%></a>
          </div>
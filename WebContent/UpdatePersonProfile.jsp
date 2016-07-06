

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head >
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Update Profile</title>
 <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/jquery.bxslider.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/jquery-ui.min.css" rel="stylesheet">
    
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/jquery.bxslider.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    
              <script>
function validateUserForm() {
    var username = document.forms["userRegister"]["username"].value;
    var usersurname = document.forms["userRegister"]["usersurname"].value;
    var userEmail = document.forms["userRegister"]["useremail"].value;
    var useridNumber = document.forms["userRegister"]["useridNumber"].value;
    var userPhone = document.forms["userRegister"]["userPhone"].value;
    var userPassword = document.forms["userRegister"]["userpassword"].value;
    var userConfirm = document.forms["userRegister"]["userconfirm_password"].value;
    if (username == null || username == "") {
        alert("Name must be filled out");
        return false;
    }else if(usersurname==null || usersurname==""){
	    	alert("Surname must be filled out");
	    	return false;
    }else if(userEmail==null || userEmail==""){
	  	  alert("Email must be filled out");
	      return false;
    }else if(useridNumber=null || useridNumber==""){
    	  alert("Id Number must be filled out");
        return false;
    
    }else if(userPassword==null || userPassword==""){
    	  alert("user password must be filled out");
          return false;
    }else if(userConfirm != userPassword){
	  	  alert("user password and password confirm must be equal");
	      return false;
	}
}
</script>

</head>
<body>
<%@page import="BackClasses.*" %>

<!-- Navigation -->
    <nav class="navbar navbar-inverse" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!-- text logo on mobile view -->
                <a class="navbar-brand visible-xs" href="index.html">Mimity Online Shop</a>
            </div>
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                 <ul class="nav navbar-nav">
                    <li><a href="iShopMain.jsp" class="active">Home</a></li>
                    <li><a href="#">Search Pages</a></li>                   
                    <li class="nav-dropdown">
                    	<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							Pages <span class="caret"></span>
						</a>
						
						<ul class="dropdown-menu">                    
						<% if(session.getAttribute("email")==null){ %>       
                            <li><a href="PersonRegister.jsp">Register</a></li>
                        <% }else if(session.getAttribute("user").equals("person")){ %>
                        	<li><a href="UpdatePersonProfile.jsp">Update Profile</a></li>
                        	<li><a href="http://localhost:8080/ShopNew/BoughtItemServlet">Bought Items</a></li>
                        	<% }else{ %>
                       	 	<li><a href="UpdateShopProfile.jsp">Update Profile</a></li>
                        <%} %>
                        </ul>
                    </li>
                     </ul>
                     <% if(session.getAttribute("email")==null){ %>
      <form id="signin" action="LoginServlet" method="post" class="navbar-form navbar-right" role="form">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input id="email" type="email" class="form-control" name="email" value="" placeholder="Email Address">                                        
                        </div>

                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                            <input id="password" type="password" class="form-control" name="password" value="" placeholder="Password">                                        
                        </div>

                        <button type="submit" class="btn btn-primary" value="Login" >Login</button>
                   </form>
     <%}else if(session.getAttribute("user").equals("person")){ 
     	%>
     		 
       		 <form class="navbar-form navbar-right" action="LogOutServlet" method="post" role="logout">
       		 
          		<button type="submit" class="btn btn-primary" value="Logout">Log Out</button>
          		</form>
          		<form class="navbar-form navbar-right" action="ShoppingCartServlet" method="post" role="logout">
       		 
          		<button type="submit" class="btn btn-primary" value="Cart">
          		 <span class="glyphicon glyphicon-shopping-cart"></span> Cart</button>
          		</form>
     
<% }else{ %>
			<form class="navbar-form navbar-right" action="LogOutServlet" method="post" role="logout">
       		 
          		<button type="submit" class="btn btn-primary" value="Logout">Log Out</button>
          		</form>
          		<form class="navbar-form navbar-right" action="ShopPageServlet" method="GET" role="logout">
       		 
          		<button type="submit" class="btn btn-primary" value="Cart">
          		 <span class="glyphicon glyphicon-shopping-cart"></span> My Page</button>
          		</form>

<% } %>
               
            </div>
        </div>
    </nav>
<div class="container" style="padding-top: 0px;">
  <div class="row">
    <!-- left column -->
    <div class="col-md-4 col-sm-6 col-xs-12">
      <div class="text-center">
       
        
       <div>
			
			
		</div>
      </div>
    </div>    
     <%
     Authorizations aut = new Authorizations();
     Person p = aut.getPerson(aut.getPersonId((String)session.getAttribute("email"))); %>
    <!-- edit form column -->
    <div class="col-md-8 col-sm-6 col-xs-12 personal-info">
      <div class="alert alert-info alert-dismissable">
        <a class="panel-close close" data-dismiss="alert">×</a> 
        <i class="fa fa-coffee"></i>
         <strong>ყურადღება!</strong>. გთხოვთ შეავსოთ შესაბამისი ველები სანდო ინფორმაციით.
      </div>
      <h3>Personal info</h3>
      <form class="form-horizontal" name="userRegister" role="form" action="UpdatePersonProfile"  method="post" onsubmit="return validateUserForm()">       
        <div class="form-group">
          <label class="col-lg-3 control-label">First name:</label>
          <div class="col-lg-8">
            <input class="form-control" name="first_name" id="username" value=<%= p.getName() %> type="text" id="first_name" >
          </div>
        </div>
        <div class="form-group">
          <label class="col-lg-3 control-label">Last name:</label>
          <div class="col-lg-8">
            <input class="form-control" name="last_name" id="usersurname" value=<%= p.getSurname() %> type="text" >
          </div>
        </div>
  
        <div class="form-group">
          <label class="col-lg-3 control-label">Email:</label>
          <div class="col-lg-8">
            <input class="form-control" value=<%= p.getMail() %> name="email" id= "useremail" type="text" >
          </div>
        </div>
        <div class="form-group">
          <label class="col-lg-3 control-label">Id Number:</label>
          <div class="col-lg-8">
            <input class="form-control" value=<%= p.getId() %> name="idnumber" id= "useridNumber" type="text" >
          </div>
        </div>
        <div class="form-group">
          <label class="col-lg-3 control-label">Phone:</label>
          <div class="col-lg-8">
            <input class="form-control" value=<%= p.getTel() %> name="phone" id ="userPhone" type="text" >
          </div>
        </div>
          <div class="form-group">
          <label class="col-md-3 control-label">Current Password:</label>
          <div class="col-lg-8">
            <input class="form-control" placeholder="Enter Current Password" name="current_password" id = "usercurrpassword" type="password">
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-3 control-label">Enter Password:</label>
          <div class="col-lg-8">
            <input class="form-control" placeholder="Enter Password" name="password" id= userpassword" type="password">
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-3 control-label">Confirm password:</label>
          <div class="col-lg-8">
            <input class="form-control" placeholder = "password_confirm" name="password_confirm" id ="userconfirm_password" "type="password">
          </div>
        </div>
           
        <div class="form-group">
          <label class="col-md-3 control-label"></label>
          <div class="col-lg-8">
            <input class="btn btn-primary" name="Save changes" value="Save Changes" type="submit">
            <span></span>
            <input class="btn btn-default" value="Cancel" type="reset">
          </div>
        </div>
      </form>
    </div>
  </div>
  </div>

<script src="js/jquery.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/bootstrap.min.js"></script>


    
     <script src="js/jquery.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/jquery.bxslider.min.js"></script>
    <script src="js/jquery.blImageCenter.js"></script>
    <script src="js/mimity.js"></script>
  
</body>
</html>



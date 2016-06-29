<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<link href="css/datepicker.css" rel="stylesheet">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
 <link href="css/Register.css" rel="stylesheet" type="text/css">
<head>
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
                    <li><a href="catalogue.html">Catalogue</a></li>
                    <li><a href="cart.html">Shopping Cart</a>
                    </li>
                    <li><a href="checkout.html">Checkout</a></li>
                    <li class="nav-dropdown">
                    	<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							Pages <span class="caret"></span>
						</a>
						<ul class="dropdown-menu">                    
						<% if(session.getAttribute("email")==null){ %>       
                            <li><a href="PersonRegister.jsp">Register</a></li>
                        <% }else if(session.getAttribute("user").equals("person")){ %>
                        	<li><a href="UpdatePersonProfile.jsp">Update Profile</a></li>
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
     <%}else{ 
     	%>
     		 
       		 <form class="navbar-form navbar-right" action="LogOutServlet" method="post" role="logout">
       		 
          		<button type="submit" class="btn btn-primary" value="Logout">Log Out</button>
          		</form>
          		<form class="navbar-form navbar-right" action="ShoppingCartServlet" method="post" role="logout">
       		 
          		<button type="submit" class="btn btn-primary" value="Cart">
          		 <span class="glyphicon glyphicon-shopping-cart"></span> Cart</button>
          		</form>
     
<% } %>
               
            </div>
        </div>
    </nav>
    
<div class="container">

    <div class="login-signup">
      <div class="row">
        <div class="col-sm-6 nav-tab-holder">
        <ul class="nav nav-tabs row" role="tablist">
          <li role="presentation" class="active col-sm-6"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Person</a></li>
          <li role="presentation" class="col-sm-6"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Shop</a></li>
        </ul>
      </div>

      </div>


      <div class="tab-content">
        <div role="tabpanel" class="tab-pane active" id="home">
          <div class="row">

            <div class="col-sm-6 mobile-pull">
              <article role="login">
                <h3 class="text-center"><i class="fa fa-lock"></i>Create Person Account</h3>
                <form class="signup" action="RegisterPerson" method="post" >
                  <div class="form-group">
                    <input type="text" name="name" id="name" class="form-control" placeholder="First Name">
                  </div>
                  <div class="form-group">
                    <input type="text" name="surname" id="surname" class="form-control" placeholder="Last Name">
                  </div>
                  <div class="form-group">
                    <input type="email" name="email" id="email" class="form-control" placeholder="Email Address">
                  </div>
            
         
                  <div class="form-group">
                    <input type="text" name="idNumber" id="idNumber" class="form-control" placeholder="id number">
                  </div>
                  <div class="form-group">
                    <input type="text" name="Phone" id="Phone" class="form-control" placeholder="Phone Number">
                  </div>
                  
                  <div class="form-group">
                    <input type="password" name="password" id="password" class="form-control" placeholder="Password">
                  </div>
                  <div class="form-group">
                    <input type="password" name="confirm_password" id="confirm_password" class="form-control" placeholder="Confirm Password">
                  </div>
                   
				 
                  <div class="form-group">
                    <div class="checkbox">
                      <label>
                        <input type="checkbox"> Please accept the terms and conditions to proceed with your request.
                      </label>
                    </div>
                  </div>
                  
                   
                  <div class="form-group">
                    <input type="submit" class="btn btn-success btn-block"  value="SUBMIT">
                  </div>
                </form>

                <footer role="signup" class="text-center">
                  <ul>
                    <li>
                      <a href="#">Terms of Use</a>
                    </li>
                    <li>
                      <a href="#">Privacy Statement</a>
                    </li>
                  </ul>
                </footer>

              </article>
            </div>

            <div class="col-sm-6">
              <article role="manufacturer"  class="text-center">
                <header>
                  ADMIN
                </header>
                <h1>FREE</h1>
                <ul class="text-left">
                  <li><i class="fa fa-check"></i>  Unlimited  access</li>
                  <li><i class="fa fa-check"></i>  Create Project Lists</li>
                  <li><i class="fa fa-check"></i>  Create Project Lists</li>
                  <li><i class="fa fa-check"></i>  Share Files</li>
                  <li><i class="fa fa-check"></i>   Unlimited  access</li>
                  <li><i class="fa fa-check"></i>  Unlimited  access</li>
                </ul>
                <a href="#" class="btn btn-success">SignUp  For Person</a>
              </article>
            </div>

          </div>
          <!-- end of row -->
        </div>
        <!-- end of home -->

      <div role="tabpanel" class="tab-pane" id="profile">
        <div class="row">

          <div class="col-sm-6 mobile-pull">
            <article role="login">
              <h3 class="text-center"><i class="fa fa-lock"></i> Create Shop Account</h3>
              <form class="signup" action="RegisterShop" method="post">
                <div class="form-group">
                  <input type="text" id="name" name="name" class="form-control" placeholder="Shop Name">
                </div>
                <div class="form-group">
                    <input type="email" name="email" id="email" class="form-control" placeholder="Email Address">
                  </div>
                  <div class="form-group">
                    <input type="text" name="site" id="site" class="form-control" placeholder="Site">
                  </div>
                  <div class="form-group">
                    <input type="text" name="Phone" id="Phone" class="form-control" placeholder="Phone Number">
                  </div>
                  
                  <div class="form-group">
                    <input type="password" name="password" id="password" class="form-control" placeholder="Password">
                  </div>
                  <div class="form-group">
                    <input type="password" name="confirm_password" id="confirm_password" class="form-control" placeholder="Confirm Password">
                  </div>
                   <div class="form-group">
				  <textarea name="Text" id="Text" cols="68" rows="5"></textarea>
				  </div>
                
                <div class="form-group">
                  <input type="submit" class="btn btn-success btn-block"  value="SUBMIT">
                </div>
              </form>
              

            </article>
          </div>

          <div class="col-sm-6">
            <article role="manufacturer"  class="text-center">
              <header>
                USER
              </header>
              <h1>FREE</h1>
              <ul class="text-left">
                <li><i class="fa fa-check"></i>  Unlimited Site Access</li>
                <li><i class="fa fa-check"></i>  Unlimited Site Access </li>
                <li><i class="fa fa-check"></i>  Unlimited Site Access</li>
                <li><i class="fa fa-check"></i>  Unlimited Site Access</li>
                <li><i class="fa fa-check"></i>   Unlimited Site Access</li>
                <li><i class="fa fa-check"></i>   Unlimited Site Access</li>
              </ul>

              <a href="#" class="btn btn-success">SignUp  For Shop</a>
            </article>
          </div>
        </div>
      </div>
  </div>
  </div>
  </div>
 

</head>
<script src="js/bootstrap-datepicker.js"></script>
 <script>
            $(function () {
                $('#datetimepicker1').datetimepicker();
            });
        </script>

</html>
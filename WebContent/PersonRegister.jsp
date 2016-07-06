<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<link href="css/datepicker.css" rel="stylesheet">
  <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/jquery.bxslider.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">

 <link href="css/Register.css" rel="stylesheet" type="text/css">
<head>

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
                <form class="signup" name="userRegister" action="RegisterPerson" method="post" onsubmit="return validateUserForm()">
                  <div class="form-group">
                 
                    <input type="text" name="name" id="username" class="form-control" placeholder="First Name">
                  </div>
                  <div class="form-group">
                    <input type="text" name="surname" id="usersurname" class="form-control" placeholder="Last Name">
                  </div>
                  <div class="form-group">
                    <input type="email" name="email" id="useremail" class="form-control" placeholder="Email Address">
                  </div>
            
         
                  <div class="form-group">
                    <input type="text" name="idNumber" id="useridNumber" class="form-control" placeholder="id number">
                  </div>
                  <div class="form-group">
                    <input type="text" name="Phone" id="userPhone" class="form-control" placeholder="Phone Number">
                  </div>
                  
                  <div class="form-group">
                    <input type="password" name="password" id="userpassword" class="form-control" placeholder="Password">
                  </div>
                  <div class="form-group">
                    <input type="password" name="confirm_password" id="userconfirm_password" class="form-control" placeholder="Confirm Password">
                  </div>
                   
				 
                  <div class="form-group">
                    <div class="checkbox">
                      <label>
                        <input type="checkbox"> Please accept the terms and conditions to proceed with your request.
                      </label>
                    </div>
                  </div>
                  
                   
                  <div class="form-group">
                    <input type="submit"  class="btn btn-success btn-block"  value="SUBMIT">
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
                  PERSON
                </header>
                <h1>FREE</h1>
                <ul class="text-left">
                  <li><i class="fa fa-check"></i>  Unlimited  access</li>
                  <li><i class="fa fa-check"></i>  BUY ITEMS</li>
                  
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
              <form class="signup" action="RegisterShop" method="post" onSubmit="return validateShop()">
                <div class="form-group">
                  <input type="text"  name="name" id="shopname" class="form-control" placeholder="Shop Name">
                </div>
                <div class="form-group">
                    <input type="email" name="email" id="shopemail" class="form-control" placeholder="Email Address">
                  </div>
                  <div class="form-group">
                    <input type="text" name="site" id="shopsite" class="form-control" placeholder="Site">
                  </div>
                  <div class="form-group">
                    <input type="text" name="Phone" id="shopPhone" class="form-control" placeholder="Phone Number">
                  </div>
                  
                  <div class="form-group">
                    <input type="password" name="password" id="shoppassword" class="form-control" placeholder="Password">
                  </div>
                  <div class="form-group">
                    <input type="password" name="confirm_password" id="shopconfirm_password" class="form-control" placeholder="Confirm Password">
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
                SHOP
              </header>
              <h1>FREE</h1>
              <ul class="text-left">
                <li><i class="fa fa-check"></i>  Unlimited Site Access</li>
                <li><i class="fa fa-check"></i>  CREATE ITEMS</li>
             
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

            
            <script type="text/javascript">
            function validateShop()
            {
                var name = document.getElementById("shopname");
                var email = document.getElementById("shopemail");
                var password = document.getElementById("shoppassword");
                var site = document.getElementById("shopisite");
                var Phone = document.getElementById("shopPhone");
                var password = document.getElementById("shoppassword");
				var passwordConfirm = document.getElementById("shopconfirm_password");
                var valid = true;
                if(name.value.length<=0||email.value.length<=0||password.value.length<=0
                		||site.value.length<=0||Phone.value.length<=0||passwordConfirm.value.length<=0)
                    {
                        alert("Don't leave the field empty!");
                        valid = false;
                    }else if(isNaN(Phone)){
                        alert("Enter a number in in Phone");
                    	valid = false;
                    }else if(passwordConfirm!=password){
                    	alert("password and password confirm must be equal");
                    	valid = false;
                    }
                
                return valid;
            };

        </script>
        

<script src="js/jquery.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/bootstrap.min.js"></script>


    
     <script src="js/jquery.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/jquery.bxslider.min.js"></script>
    <script src="js/jquery.blImageCenter.js"></script>
    <script src="js/mimity.js"></script>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Shop Item - Start Bootstrap Template</title>

 <link href="css/shop-homepage.css" rel="stylesheet">
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/shop-item.css" rel="stylesheet">
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/jquery.bxslider.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <%@ page import="BackClasses.*" %>

<%@ page import="java.util.ArrayList" %>
   

</head>

<body>

	
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
     <%}else if(session.getAttribute("user").equals("person")){ 
     	%>
     		 
       		 <form class="navbar-form navbar-right" action="LogOutServlet" method="post" role="logout">
       		 
          		<button type="submit" class="btn btn-primary" value="Logout">Log Out</button>
          		</form>
          		<form class="navbar-form navbar-right" action="ShoppingCartServlet" method="post" role="logout">
       		 
          		<button type="submit" class="btn btn-primary" value="Cart">
          		 <span class="glyphicon glyphicon-shopping-cart"></span> Cart</button>
          		</form>
     
	<% } else{ %>
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

    
	<% Shop shop = (Shop)request.getAttribute("ShopObject"); %>
    <!-- Page Content -->
 
<div class="container main-container">
        <div class="row">
          	<div class="col-lg-3 col-md-3 col-sm-12">

        		<!-- Categories -->
        		<div class="col-lg-12 col-md-12 col-sm-6">
	        		<div class="no-padding">
	            		<span class="title">CATEGORIES</span>
	            	</div>

					<div id="main_menu">
                        <div class="list-group panel panel-cat">
                        <%  DatabaseClass db = new DatabaseClass();
                        	ArrayList<String> categories = db.getAllCategories();
                        	int size = categories.size();
                        	System.out.println("size "+size);
                        	ArrayList<Integer> subCategories = new ArrayList<Integer>();
                        	for(int i=0;i<size;i++){
                        		subCategories=db.searchSubCategories(categories.get(i));
                        		System.out.println(subCategories.size()+" "+categories.get(i)+" i "+i);
                        		
                        	%>
                            <a href="#sub<%= i+1  %>" class="list-group-item" data-toggle="collapse" data-parent="#main_menu"><%= categories.get(i) %> <i class="fa fa-caret-down pull-right"></i></a>
                            <div class="collapse list-group-submenu" id="sub<%= i+1  %>">  
                            <% for(int k=0;k<subCategories.size();k++){ %>   
                                                     	                          
                                <a href="FilterBySubCategories.jsp?id=<%= subCategories.get(k)  %>" class="list-group-item" ><%= db.getSubCategoryName(subCategories.get(k)) %></a>                             
                           
                            <%}%>
                            </div>
                           <% } %>
                            
                        </div>
                    </div>

				</div>
				<!-- End Categories -->

				
				<!-- End Best Seller -->

        	</div>
				<!-- End Categories -->

            <div class="col-md-9">

                <div class="thumbnail">
                    <img class="img-responsive" src="http://placehold.it/800x300" alt="">
                    <div class="caption-full">
                        <h2><a href="#"><%= shop.getName() %></a>
                        </h2>
                        <p> <%= shop.getInfo() %></p>
                    </div>
                    
                </div>
                <% 
                 db = new DatabaseClass();
                ArrayList<Item> arr = db.getShopItems(db.getShopId((String)session.getAttribute("email")));
                for(int i=0;i<arr.size();i++){
                Item item = arr.get(i);%>
				<div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <img src="GetCompanyPicture?id=1"  alt="">
                            <div class="caption">
                                <h4 class="pull-right">$<%= item.getPrice()  %></h4>
                                <h4><a href="ItemPage.jsp?id=<%= item.getId()%>"><%= item.getName() %></a>
                                </h4>
                                <h5>Category: <%= item.getCategory() %></h5>
                                <h6>SubCategory: <%= item.getSubCategory() %></h6>
                                <p>Description: <%= item.getitemDescription() %>.</p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">15 views</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                </p>
                            </div>
                        </div>
                    </div>
	<%} %>
                   
                

                </div>

            </div>

        </div>

   
    <!-- /.container -->

    <div class="container">

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/jquery.bxslider.min.js"></script>
    <script src="js/jquery.blImageCenter.js"></script>
    <script src="js/mimity.js"></script>
    
</body>

</html>
	


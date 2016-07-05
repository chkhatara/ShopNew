<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/jquery.bxslider.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    
    <%@ page import="BackClasses.*" %>
    
<%@ page import="java.util.ArrayList" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>iShop</title>
</head>
<body>

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
    <!-- End Navigation -->

    <div class="container main-container">
        <div class="row">

        	<!-- Slider -->
        	<div class="col-lg-9 col-md-12">
                <div class="slider">
                    <ul class="bxslider">
                        <li>
                            <a href="index.html">
                                <img src="images/banner_slider-3.jpg" alt=""/>
                            </a>
                        </li>
                        <li>
                            <a href="index.html">
                                <img src="images/banner_slider-2.jpg" alt=""/>
                            </a>
                        </li>
                        <li>
                            <a href="index.html">
                                <img src="images/banner_slider-1.jpg" alt=""/>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- End Slider -->

			<!-- Product Selection, visible only on large desktop -->
            <div class="col-lg-3 visible-lg">
                <div class="row text-center">
                    <div class="col-lg-12 col-md-12 hero-feature">
                        <div class="thumbnail">
                        	<a href="detail.html" class="link-p first-p">
		                    	<img src="images/product-1.jpg" alt="">
		                    </a>
		                    <div class="caption prod-caption">
		                        <h4><a href="detail.html">Funkalicious Print T-Shirt</a></h4>
		                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut, minima!</p>
		                        <p>
		                        	<div class="btn-group">
			                        	<a href="#" class="btn btn-default">$ 928.96</a>
			                        	<a href="#" class="btn btn-primary"><i class="fa fa-shopping-cart"></i> Buy</a>
		                        	</div>
		                        </p>
		                    </div>
		                </div>
                    </div>
                </div>
            </div>
            <!-- End Product Selection -->
        </div>

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
                        	ArrayList<Integer> subCategories = new ArrayList<Integer>();
                        	for(int i=0;i<size;i++){
                        		subCategories=db.searchSubCategories(categories.get(i));
                        		
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

        	<div class="clearfix visible-sm"></div>

			<!-- Featured -->
        	<div class="col-lg-9 col-md-9 col-sm-12">
        		<div class="col-lg-12 col-sm-12">
            		<span class="title">FEATURED PRODUCTS</span>
            	</div>
            	<% ArrayList<Item> allItems = db.getAllItems();
            	for(int i=0;i<allItems.size();i++){
            		Item it =allItems.get(i);%>
	            <div class="col-lg-4 col-sm-4 hero-feature text-center">
	                <div class="thumbnail">
	                	<a href="detail.html" class="link-p">
	                    	<img src="images/product-2.jpg" alt="">
	                	</a>
	                    <div class="caption prod-caption">
	                        <h4><a href="#"><%= it.getName() %></a></h4>
	                        <p><%= it.getitemDescription() %></p>
	                        <p>
	                        	<div class="btn-group">
		                        	<a href="#" class="btn btn-default">$ <%= it.getPrice() %></a>
		                        	<a href="#" class="btn btn-primary"><i class="fa fa-shopping-cart"></i> Buy</a>
	                        	</div>
	                        </p>
	                    </div>
	                </div>
	            </div>
	            <%} %>
	            

        	<div class="clearfix visible-sm"></div>

			
		
        </div>
        <nav>
	  <ul class="pager">
	  <% if(allItems.size()<=6){ %>
	    <li class="pager-prev disabled"><a href="#">Older</a></li>
	    <li class="pager-next disabled"><a href="#">Newer</a></li>
	  <%}else{
		  if(request.getParameter("page")==null){
			  %>
			  <li class="pager-prev disabled"><a href="#">Older</a></li>
			  <li class="pager-next "><a href="iShopMain.jsp?page=1">Newer</a></li>
	  	
		  <%
		  }
		  int pageNum =Integer.parseInt(request.getParameter("page"));
		  %>
		  <%} %>
	  
	  </ul>
	</nav>
	</div>

	<footer>
    	<div class="container">
        	<div class="col-lg-3 col-md-3 col-sm-6">
        		<div class="column">
        			<h4>Information</h4>
        			<ul>
        				<li><a href="about.html">About Us</a></li>
        				<li><a href="typography.html">Policy Privacy</a></li>
        				<li><a href="typography.html">Terms and Conditions</a></li>
        				<li><a href="typography.html">Shipping Methods</a></li>
        			</ul>
        		</div>
        	</div>
        	<div class="col-lg-3 col-md-3 col-sm-6">
        		<div class="column">
        			<h4>Categories</h4>
        			<ul>
        				<li><a href="catalogue.html">Cras justo odio</a></li>
        				<li><a href="catalogue.html">Dapibus ac facilisis in</a></li>
        				<li><a href="catalogue.html">Morbi leo risus</a></li>
        				<li><a href="catalogue.html">Porta ac consectetur ac</a></li>
        			</ul>
        		</div>
        	</div>
        	<div class="col-lg-3 col-md-3 col-sm-6">
        		<div class="column">
        			<h4>Customer Service</h4>
        			<ul>
        				<li><a href="contact.html">Contact Us</a></li>
        				<li><a href="#">YM: cs_</a></li>
        				<li><a href="#">Phone: +6281234567891</a></li>
        				<li><a href="#">Email: cs.domain@domain.tld</a></li>
        			</ul>
        		</div>
        	</div>
        	<div class="col-lg-3 col-md-3 col-sm-6">
        		<div class="column">
        			<h4>Follow Us</h4>
        			<ul class="social">
        				<li><a href="#">Google Plus</a></li>
        				<li><a href="#">Facebook</a></li>
        				<li><a href="#">Twitter</a></li>
        				<li><a href="#">RSS Feed</a></li>
        			</ul>
        		</div>
        	</div>
        </div>
        <div class="navbar-inverse text-center copyright">
        	Copyright &copy; iShop Ge
        </div>
    </footer>

    <a href="#top" class="back-top text-center" onclick="$('body,html').animate({scrollTop:0},500); return false">
    	<i class="fa fa-angle-double-up"></i>
    </a>

    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/jquery.bxslider.min.js"></script>
    <script src="js/jquery.blImageCenter.js"></script>
    <script src="js/mimity.js"></script>

</body>
</html>
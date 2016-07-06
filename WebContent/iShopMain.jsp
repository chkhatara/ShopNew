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
                    <li><a href="SearchPages.jsp">Search Pages</a></li>                   
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
            		<span class="title">ALL PRODUCTS</span>
            	</div>
            	<% ArrayList<Item> allItems = db.getAllItems();
            	int startingPoint =0;
            	int sizeOfItems =0;
            	int checkPage = 0;
            	if((String)request.getParameter("page")==null && allItems.size()>6){
            		sizeOfItems =6;
            	}else if((String)request.getParameter("page")==null && allItems.size()<6){
            		sizeOfItems=allItems.size();
            	}else if((String)request.getParameter("page")!=null && allItems.size()>6){
            	 	checkPage = Integer.parseInt((String)request.getParameter("page"));
            		startingPoint=checkPage*6;
            		if((checkPage+1)*6>=allItems.size()){
            			sizeOfItems = allItems.size();
            		}else{
            			sizeOfItems = (checkPage+1)*6;
            		}
            	}
            	for(int i=startingPoint;i<sizeOfItems;i++){
            		Item it =allItems.get(i);%>
	            <div class="col-lg-4 col-sm-4 hero-feature text-center">
	                <div class="thumbnail">
	                	<a href="ItemPage.jsp?id=<%= it.getId() %>" class="link-p">
	                    	<img src="GetItemProfilePicture?id=<%= it.getId() %>" alt="">
	                	</a>
	                    <div class="caption prod-caption">
	                        <h4><a href="ItemPage.jsp?id=<%= it.getId() %>"><%= it.getName() %></a></h4>
	                        <% String shopName=db.getShop(db.getItemShop(it.getId())).getName(); %>
	                        <p><%= it.getitemDescription() %></p>
	                        <p>SubCategory: <%= it.getSubCategory() %> </p>
	                         <p><a href ="ShopPageForPerson?shopid=<%= db.getItemShop(it.getId()) %>"> <%= shopName %> </a> </p>
	                        
	                        <p>
	                        	<div class="btn-group">
		                        	<a href="#" class="btn btn-default">$ <%= it.getPrice() %></a>
		                        	<a href="ItemPage.jsp?id=<%= it.getId() %>" class="btn btn-primary"><i class="fa fa-shopping-cart"></i> Buy</a>
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
		  if(request.getParameter("page")==null||Integer.parseInt(request.getParameter("page"))==0){
			  %>
			  <li class="pager-prev disabled"><a href="#">Older</a></li>
			  <li class="pager-next "><a href="iShopMain.jsp?page=1">Newer</a></li>
	  	
		  <%
		  }else{
		 	 int pageNum =Integer.parseInt(request.getParameter("page"));
		  	 if( allItems.size()-pageNum*6>6){
			  %>
			  <li class="pager-prev"><a href="iShopMain.jsp?page=<%= pageNum-1%>">Older</a></li>
			  <li class="pager-next "><a href="iShopMain.jsp?page=<%= pageNum+1%>">Newer</a></li>
		 <%  }else{
			 
			 %>
			 <li class="pager-prev"><a href="iShopMain.jsp?page=<%= pageNum-1%>">Older</a></li>
			  <li class="pager-next disabled"><a href="#">Newer</a></li>
			 <% 
		 	}
		}%>
			 
		 	
		  
		  <%} %>
	  
	  </ul>
	</nav>
	</div>

	

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
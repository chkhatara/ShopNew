<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<!-- Mirrored from www.grehon.com/mimity/v1.4/detail.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 22 Jun 2016 00:59:48 GMT -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <%@ page import="BackClasses.*" %>
	<%@ page import="java.util.ArrayList" %>
	<% Item item = null;
		DatabaseClass db = new DatabaseClass();
		item = db.getItemById(Integer.parseInt(request.getParameter("id")));%>
	<title><%= item.getName() %></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/smoothproducts.html" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/searchfields.css" rel="stylesheet">
  
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
        	<div class="col-lg-3 col-md-3 col-sm-12">

        	</div>

        	<div class="clearfix visible-sm"></div>

			<!-- Product Detail -->
        	<div class="col-lg-9 col-md-9 col-sm-12">
        		<div class="col-lg-12 col-sm-12">
            		<span class="title"><%= item.getName() %></span>
            	</div>
	            <div class="col-lg-12 col-sm-12 hero-feature">

	            	<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-6">
			            	<!-- Main Image -->
							<div class="product-main-image-container">
								<img src="images/loader.gif" alt="" class="product-loader">
								<span class="thumbnail product-main-image">
									<img src="GetItemProfilePicture?id=<%= item.getId()%>" alt="">
								</span>
							</div>
							<!-- End Main Image -->

							<!-- Thumbnail Image -->
							<div class="col-xs-3 product-thumb-image">
								<a href="GetItemProfilePicture?id=<%= item.getId()%>" class="thumbnail">
									<img src="GetItemProfilePicture?id=<%= item.getId()%>" alt="">
								</a>
							</div>
							
							<!-- End Thumbnail Image -->
						</div>

						<div class="visible-xs">
							<div class="clearfix"></div>
						</div>

						<div class="col-lg-6 col-md-6 col-sm-6">
							<div class="well product-short-detail">
								<div class="row">
									<div class="the-list">
										<h3 class="col-xs-12">Price: $<%= item.getPrice() %>
										</h3>
									</div>
									<div class="the-list">
										<div class="col-xs-4">In Stock</div>
										<div class="col-xs-8">
											<!-- <span class="red">OUT OF STOCK</span> -->
											<span class="green"><%= item.getQuantity() %></span>
										</div>
										</div>
										<div class="the-list">
										<div class="col-xs-4">Rating</div>
										<div class="col-xs-8">
										<% int itemRating = db.getItemRating(Integer.parseInt(request.getParameter("id")));
										for(int st =0;st<itemRating;st++){ %>
														<i class="fa fa-star"></i>									
													<%} %>
									</div>
									</div>
									<div class="the-list">
										<div class="col-xs-4">SubCategory</div>
										<div class="col-xs-8">
											<span class="green"><%= item.getSubCategory() %></span>
										</div>
										</div>
								
										
									
									
									<div class="clearfix"></div>
									<hr/>
									<% if (session.getAttribute("user")!=null && session.getAttribute("user").equals("person")){ %>
									<form id="AddToCart" action="AddToCartServlet?id=<%= item.getId() %>" method="post" >
									<div class="col-xs-12 input-qty-detail">
										<input type="text" class="form-control input-qty text-center" value="1">
										<button type ="submit" class="btn btn-default pull-left"><i class="fa fa-shopping-cart"></i> Add to Cart</button>
									</div>
									</form>
									<%} %>
									<div class="clearfix"></div><br/>
									
								</div>
							</div>
						</div>

						<div class="clearfix"></div><br clear="all"/>

						<div class="col-xs-12 product-detail-tab">
							<!-- Nav tabs -->
							<ul class="nav nav-tabs">
								<li class="active"><a href="#desc" data-toggle="tab">Description</a></li>
								<li><a href="#detail" data-toggle="tab">Detail</a></li>
								<li><a href="#review" data-toggle="tab">Review</a></li>
							</ul>

							<!-- Tab panes -->
							<div class="tab-content">
								<div class="tab-pane active" id="desc">
									<div class="well">
										<p><%= item.getitemDescription() %></p>
									</div>
								</div>
								<div class="tab-pane" id="detail">
									<div class="well">
										<table class="table table-bordered">
											<tbody>
												<tr>
													<td width="40%">Lorem</td>
													<td>Ipsum</td>
												</tr>
												<tr>
													<td>Dolor</td>
													<td>Sit Amet</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="tab-pane" id="review">
									<div class="well">
										<% ArrayList<Review> rev= db.getAllReviews(request.getParameter("id"));
										%>
										<% for(int i=0;i<rev.size();i++){ 
												Review review = rev.get(i);%>
											
										<div class="media">
											<a class="pull-left" href="#">
												<img class="media-object" alt="64x64" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI2NCIgaGVpZ2h0PSI2NCI+PHJlY3Qgd2lkdGg9IjY0IiBoZWlnaHQ9IjY0IiBmaWxsPSIjZWVlIi8+PHRleHQgdGV4dC1hbmNob3I9Im1pZGRsZSIgeD0iMzIiIHk9IjMyIiBzdHlsZT0iZmlsbDojYWFhO2ZvbnQtd2VpZ2h0OmJvbGQ7Zm9udC1zaXplOjEycHg7Zm9udC1mYW1pbHk6QXJpYWwsSGVsdmV0aWNhLHNhbnMtc2VyaWY7ZG9taW5hbnQtYmFzZWxpbmU6Y2VudHJhbCI+NjR4NjQ8L3RleHQ+PC9zdmc+">
												<div class="product-rating">
													<%for(int st =0;st<review.getStar();st++){ %>
														<i class="fa fa-star"></i>									
													<%} %>
			
												</div>
											</a>
											<div class="media-body">
												<h5 class="media-heading"><strong><%= review.getPersonName() %></strong></h5>
												<%= review.getReview() %>
											</div>
										</div>
										<%} %>
										
										<hr/>
		                                <h4>Add your review</h4>
		                                <p></p>
		                                <form role="form" action="SubmitReviewServlet?id=<%=(request.getParameter("id"))%>" method="post">
		                                    <div class="form-group">
		                                        <input type="text" class="form-control" placeholder="Name" name ="personName">
		                                    </div>
	
		                                    <div class="form-group">
		                                        <select class="form-control" name = "rating">
		                                            <option>1 star</option>
		                                            <option>2 stars</option>
		                                            <option>3 stars</option>
		                                            <option>4 stars</option>
		                                            <option>5 stars</option>
		                                        </select>
		                                    </div>
		                                    <div class="form-group">
		                                        <textarea class="form-control" rows="5" placeholder="Your Review" name = "review"></textarea>
		                                    </div>
		                                    <button type="submit" class="btn btn-default">Submit Review</button>
		                                </form>
									</div>
								</div>
							</div>
						</div>
					</div>

				
	            </div>
	            <div class="clearfix"></div>
	            


        </div>
	</div>

	

    <a href="#top" class="back-top text-center" onclick="$('body,html').animate({scrollTop:0},500); return false">
    	<i class="fa fa-angle-double-up"></i>
    </a>

    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/jquery.blImageCenter.js"></script>
    <script src="js/bootstrap.touchspin.js"></script>
    <script src="js/jquery.zoom.min.js"></script>
    <script src="js/mimity.js"></script>
</body>

<!-- Mirrored from www.grehon.com/mimity/v1.4/detail.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 22 Jun 2016 00:59:51 GMT -->
</html>

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
                    <li><a href="index.html" class="active">Home</a></li>
                    <li><a href="catalogue.html">Catalogue</a></li>
                    <li><a href="cart.html">Shopping Cart</a>
                    </li>
                    <li><a href="checkout.html">Checkout</a></li>
                    <li class="nav-dropdown">
                    	<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							Pages <span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
                            <li><a href="about.html">About Us</a>
                             </li>
                            <li><a href="blog.html">Blog</a></li>
                            <li><a href="blog-detail.html">Blog Detail</a></li>
                            <li><a href="compare.html">Compare</a></li>
                            <li><a href="contact.html">Contact Us</a></li>
                            <li><a href="login.html">Login</a></li>
                            <li><a href="detail.html">Product Detail</a></li>
                            <li><a href="register.html">Register</a></li>
                            <li><a href="typography.html">Typography</a></li>
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
     	System.out.println(session.getAttribute("email"));%>
     		 
       		 <form class="navbar-form navbar-right" action="LogOutServlet" method="post" role="logout">
       		 
          		<button type="submit" class="btn btn-primary" value="Logout">Log Out</button>
          		</form>
          		<form class="navbar-form navbar-right" action="ShopCartServlet" method="post" role="logout">
       		 
          		<button type="submit" class="btn btn-primary" value="Cart">
          		 <span class="glyphicon glyphicon-shopping-cart"></span> Cart</button>
          		</form>
          		<a class="navbar-brand navbar-right" href="PersonServlet"><% session.getAttribute("email");%></a>
     
<% } %>
               
            </div>
        </div>
    </nav>
    <!-- End Navigation -->

    
	   
    <div class="col-lg-9 col-md-9 col-sm-12">
        		<div class="col-lg-12 col-sm-12">
            		<span class="title">SHOPPING CART</span>
            	</div>
	            <div class="col-lg-12 col-sm-12 hero-feature">
                    <div class="table-responsive">
    					<table class="table table-bordered tbl-cart">
    						<thead>
                                <tr>
                                    <td class="hidden-xs">Image</td>
                                    <td>Product Name</td>
                                    <td>Size</td>
                                    <td>Color</td>
                                    <td class="td-qty">Quantity</td>
                                    <td>Unit Price</td>
                                    <td>Sub Total</td>
                                    <td>Remove</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="hidden-xs">
                                        <a href="detail.html">
                                            <img src="images/product-2.jpg" alt="Age Of Wisdom Tan Graphic Tee" title="" width="47" height="47" />
                                        </a>
                                    </td>
                                    <td><a href="detail.html">Age Of Wisdom Tan Graphic Tee</a>
                                    </td>
                                    <td>
                                        <select name="">
                                            <option value="" selected="selected">S</option>
                                            <option value="">M</option>
                                        </select>
                                    </td>
                                    <td>-</td>
                                    <td>
                                        <input type="text" name="" value="1" class="input-qty form-control text-center" />
                                    </td>
                                    <td class="price">$ 122.21</td>
                                    <td>$ 122.21</td>
                                    <td class="text-center">
                                        <a href="#" class="remove_cart" rel="2">
                                            <i class="fa fa-trash-o"></i>
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="hidden-xs">
                                        <a href="detail.html">
                                            <img src="images/product-12.jpg" alt="Adidas Men Red Printed T-shirt" title="" width="47" height="47" />
                                        </a>
                                    </td>
                                    <td><a href="detail.html">Adidas Men Red Printed T-shirt</a>
                                    </td>
                                    <td>
                                        <select name="">
                                            <option value="">S</option>
                                            <option value="" selected="selected">M</option>
                                        </select>
                                    </td>
                                    <td>
                                    	<select name="">
                                            <option value="" selected="selected">Red</option>
                                            <option value="">Blue</option>
                                        </select>
                                    </td>
                                    <td>
                                        <input type="text" name="" value="2" class="input-qty form-control text-center" />
                                    </td>
                                    <td class="price">$ 20.63</td>
                                    <td>$ 41.26</td>
                                    <td class="text-center">
                                        <a href="#" class="remove_cart" rel="1">
                                            <i class="fa fa-trash-o"></i>
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6" align="right">Total</td>
                                    <td class="total" colspan="2"><b>$ 163.47</b>
                                    </td>
                                </tr>
                            </tbody>
    					</table>
                    </div>
					<div class="btn-group btns-cart">
						<button type="button" class="btn btn-primary" onclick="window.location='catalogue.html'"><i class="fa fa-arrow-circle-left"></i> Continue Shopping</button>
						<button type="button" class="btn btn-primary">Update Cart</button>
						<button type="button" class="btn btn-primary" onclick="window.location='checkout.html'">Checkout <i class="fa fa-arrow-circle-right"></i></button>
					</div>

	            </div>
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
                            <a href="#sub1" class="list-group-item" data-toggle="collapse" data-parent="#main_menu">Electronics & Computers <i class="fa fa-caret-down pull-right"></i></a>
                            <div class="collapse list-group-sub" id="sub1">
                                <a href="#SubMenu1" class="list-group-item" data-toggle="collapse" data-parent="#SubMenu1">Phones & Accessories<i class="fa fa-caret-down"></i></a>
                                <div class="collapse list-group-submenu" id="SubMenu1">
                                    <a href="#" class="list-group-item" data-parent="#SubMenu1">iPhone</a>
                                    <a href="#" class="list-group-item" data-parent="#SubMenu1">Android</a>
                                    <a href="#" class="list-group-item" data-parent="#SubMenu1">windows phone</a>
                                    <a href="#" class="list-group-item" data-parent="#SubMenu1">other</a>
                                  
                                    
                                </div>
                                
                            </div>
                            <a href="#" class="list-group-item" >Dapibus ac facilisis in</a>
                            <a href="#sub2" class="list-group-item" data-toggle="collapse" data-parent="#main_menu">Porta ac consectetur ac <i class="fa fa-caret-down pull-right"></i></a>
                            <div class="collapse list-group-sub" id="sub2">
                                <a href="#" class="list-group-item">Subitem 1</a>
                                <a href="#" class="list-group-item">Subitem 2</a>
                                <a href="#" class="list-group-item">Subitem 3</a>
                            </div>
                            <a href="#" class="list-group-item" >Vestibulum at eros</a>
                            <a href="#" class="list-group-item" >Porta ac consectetur ac</a>
                            <a href="#" class="list-group-item" >Cras justo odio</a>
                            <a href="#" class="list-group-item" >Dapibus ac facilisis in</a>
                            <a href="#" class="list-group-item" >Porta ac consectetur ac</a>
                            <a href="#" class="list-group-item" >Vestibulum at eros</a>
                            <a href="#" class="list-group-item" >Porta ac consectetur ac</a>
                        </div>
                    </div>

				</div>
				<!-- End Categories -->

				<!-- Best Seller -->
				<div class="col-lg-12 col-md-12 col-sm-6">
					<div class="no-padding">
	            		<span class="title">BEST SELLER</span>
	            	</div>
					<div class="hero-feature">
		                <div class="thumbnail text-center">
		                	<a href="detail.html" class="link-p">
		                    	<img src="images/product-8.jpg" alt="">
		                	</a>
		                    <div class="caption prod-caption">
		                        <h4><a href="detail.html">Penn State College T-Shirt</a></h4>
		                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut, minima!</p>
		                        <p>
		                        	<div class="btn-group">
			                        	<a href="#" class="btn btn-default">$ 528.96</a>
			                        	<a href="#" class="btn btn-primary"><i class="fa fa-shopping-cart"></i> Buy</a>
		                        	</div>
		                        </p>
		                    </div>
		                </div>
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
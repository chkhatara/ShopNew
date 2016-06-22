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
		            <div class="hero-feature hidden-sm">
		                <div class="thumbnail text-center">
		                	<a href="detail.html" class="link-p">
		                    	<img src="images/product-9.jpg" alt="">
		                	</a>
		                    <div class="caption prod-caption">
		                        <h4><a href="detail.html">Ohio State College T-Shirt</a></h4>
		                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut, minima!</p>
		                        <p>
		                        	<div class="btn-group">
			                        	<a href="#" class="btn btn-default">$ 924.25</a>
			                        	<a href="#" class="btn btn-primary"><i class="fa fa-shopping-cart"></i> Buy</a>
		                        	</div>
		                        </p>
		                    </div>
		                </div>
		            </div>
				</div>
				<!-- End Best Seller -->

        	</div>

        	<div class="clearfix visible-sm"></div>

			<!-- Featured -->
        	<div class="col-lg-9 col-md-9 col-sm-12">
        		<div class="col-lg-12 col-sm-12">
            		<span class="title">FEATURED PRODUCTS</span>
            	</div>
	            <div class="col-lg-4 col-sm-4 hero-feature text-center">
	                <div class="thumbnail">
	                	<a href="detail.html" class="link-p">
	                    	<img src="images/product-2.jpg" alt="">
	                	</a>
	                    <div class="caption prod-caption">
	                        <h4><a href="detail.html">Age Of Wisdom Tan Graphic Tee</a></h4>
	                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut, minima!</p>
	                        <p>
	                        	<div class="btn-group">
		                        	<a href="#" class="btn btn-default">$ 122.51</a>
		                        	<a href="#" class="btn btn-primary"><i class="fa fa-shopping-cart"></i> Buy</a>
	                        	</div>
	                        </p>
	                    </div>
	                </div>
	            </div>
	            <div class="col-lg-4 col-sm-4 hero-feature text-center">
	                <div class="thumbnail">
	                	<a href="detail.html" class="link-p">
	                    	<img src="images/product-3.jpg" alt="">
	                	</a>
	                    <div class="caption prod-caption">
	                        <h4><a href="detail.html">Classic Laundry Green Graphic T-Shirt</a></h4>
	                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut, minima!</p>
	                        <p>
	                        	<div class="btn-group">
		                        	<a href="#" class="btn btn-default">$ 628.96</a>
		                        	<a href="#" class="btn btn-primary"><i class="fa fa-shopping-cart"></i> Buy</a>
	                        	</div>
	                        </p>
	                    </div>
	                </div>
	            </div>
	            <div class="col-lg-4 col-sm-4 hero-feature text-center">
	                <div class="thumbnail">
	                	<a href="detail.html" class="link-p">
	                    	<img src="images/product-4.jpg" alt="">
	                	</a>
	                    <div class="caption prod-caption">
	                        <h4><a href="detail.html">Disc Jockey Print T-Shirt</a></h4>
	                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut, minima!</p>
	                        <p>
	                        	<div class="btn-group">
		                        	<a href="#" class="btn btn-default">$ 394.64</a>
		                        	<a href="#" class="btn btn-primary"><i class="fa fa-shopping-cart"></i> Buy</a>
	                        	</div>
	                        </p>
	                    </div>
	                </div>
	            </div>
	            <div class="col-lg-4 col-sm-4 hero-feature text-center">
	                <div class="thumbnail">
	                	<a href="detail.html" class="link-p">
	                    	<img src="images/product-5.jpg" alt="">
	                	</a>
	                    <div class="caption prod-caption">
	                        <h4><a href="detail.html">Live Nation 3 Days of Peace and Music Carbon</a></h4>
	                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut, minima!</p>
	                        <p>
	                        	<div class="btn-group">
	                        		<a href="#" class="btn btn-default">$ 428.96</a>
	                        		<a href="#" class="btn btn-primary"><i class="fa fa-shopping-cart"></i> Buy</a>
	                        	</div>
	                        </p>
	                    </div>
	                </div>
	            </div>
	            <div class="col-lg-4 col-sm-4 hero-feature text-center">
	                <div class="thumbnail">
	                	<a href="detail.html" class="link-p">
	                    	<img src="images/product-6.jpg" alt="">
	                	</a>
	                    <div class="caption prod-caption">
	                        <h4><a href="detail.html">Live Nation ACDC Gray T-Shirt</a></h4>
	                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut, minima!</p>
	                        <p>
	                        	<div class="btn-group">
	                        		<a href="#" class="btn btn-default">$ 428.96</a>
	                        		<a href="#" class="btn btn-primary"><i class="fa fa-shopping-cart"></i> Buy</a>
	                        	</div>
	                        </p>
	                    </div>
	                </div>
	            </div>
	            <div class="col-lg-4 col-sm-4 hero-feature text-center">
	                <div class="thumbnail">
	                	<a href="detail.html" class="link-p">
	                    	<img src="images/product-7.jpg" alt="">
	                	</a>
	                    <div class="caption prod-caption">
	                        <h4><a href="detail.html">Live Nation Aerosmith Ivory T-Shirt</a></h4>
	                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut, minima!</p>
	                        <p>
	                        	<div class="btn-group">
	                        		<a href="#" class="btn btn-default">$ 632.15</a>
	                        		<a href="#" class="btn btn-primary"><i class="fa fa-shopping-cart"></i> Buy</a>
	                        	</div>
	                        </p>
	                    </div>
	                </div>
	            </div>
        	</div>
        	<!-- End Featured -->

        	<div class="clearfix visible-sm"></div>

			<!-- Adidas Category -->
        	<div class="col-lg-9 col-md-9 col-sm-12">
				<div class="col-lg-12 col-sm-12">
            		<span class="title">ADIDAS</span>
            	</div>
	            <div class="col-lg-4 col-sm-4 hero-feature text-center">
	                <div class="thumbnail">
	                	<a href="detail.html" class="link-p">
	                    	<img src="images/product-10.jpg" alt="">
	                	</a>
	                    <div class="caption prod-caption">
	                        <h4><a href="detail.html">Adidas Men Blue &amp; Red Striped Polo T-shirt </a></h4>
	                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut, minima!</p>
	                        <p>
	                        	<div class="btn-group">
		                        	<a href="#" class="btn btn-default">$ 22.22</a>
		                        	<a href="#" class="btn btn-primary"><i class="fa fa-shopping-cart"></i> Buy</a>
	                        	</div>
	                        </p>
	                    </div>
	                </div>
	            </div>
	            <div class="col-lg-4 col-sm-4 hero-feature text-center">
	                <div class="thumbnail">
	                	<a href="detail.html" class="link-p">
	                    	<img src="images/product-11.jpg" alt="">
	                	</a>
	                    <div class="caption prod-caption">
	                        <h4><a href="detail.html">Adidas Men Flame Black T-shirt</a></h4>
	                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut, minima!</p>
	                        <p>
	                        	<div class="btn-group">
	                        		<a href="#" class="btn btn-default">$ 15.47</a>
	                        		<a href="#" class="btn btn-primary"><i class="fa fa-shopping-cart"></i> Buy</a>
	                        	</div>
	                        </p>
	                    </div>
	                </div>
	            </div>
	            <div class="col-lg-4 col-sm-4 hero-feature text-center">
	                <div class="thumbnail">
	                	<a href="detail.html" class="link-p">
	                    	<img src="images/product-12.jpg" alt="">
	                	</a>
	                    <div class="caption prod-caption">
	                        <h4><a href="detail.html">Adidas Men Red Printed T-shirt</a></h4>
	                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut, minima!</p>
	                        <p>
	                        	<div class="btn-group">
	                        		<a href="#" class="btn btn-default">$ 20.63</a>
	                        		<a href="#" class="btn btn-primary"><i class="fa fa-shopping-cart"></i> Buy</a>
	                        	</div>
	                        </p>
	                    </div>
	                </div>
	            </div>
			</div>
			<!-- End Adidas Category -->

        </div>
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
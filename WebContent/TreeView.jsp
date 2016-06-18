<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link href="css/TreeView.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-default sidebar" role="navigation">
    <div class="container-fluid">
        <div class="panel-heading">Treeview List</div>
        <div class="panel-body">
            <!-- TREEVIEW CODE -->
            <ul class="treeview">
                <li><a href="#">Tree</a>
                	<ul>
            			<li><a href="#">Branch</a></li>
            			<li><a href="#">Branch</a>
            				<ul>
            					<li><a href="#">Stick</a></li>
            					<li><a href="#">Stick</a></li>
            					<li><a href="#">Stick</a>
            						<ul>
            							<li><a href="#">Twig</a></li>
            							<li><a href="#">Twig</a></li>
            							<li><a href="#">Twig</a></li>
            							<li><a href="#">Twig</a>
            								<ul>
            									<li><a href="#">Leaf</a></li>
            									<li><a href="#">Leaf</a></li>
            									<li><a href="#">Leaf</a></li>
            									<li><a href="#">Leaf</a></li>
            									<li><a href="#">Leaf</a></li>
            									<li><a href="#">Leaf</a></li>
            									<li><a href="#">Leaf</a></li>
            									<li><a href="#">Leaf</a></li>
            									<li><a href="#">Leaf</a></li>
            								</ul>
            							</li>
            							<li><a href="#">Twig</a></li>
            							<li><a href="#">Twig</a></li>
            						</ul>
            					</li>
            					<li><a href="#">Stick</a></li>
            				</ul>
            			</li>
            			<li><a href="#">Branch</a></li>
            			<li><a href="#">Branch</a></li>
            		</ul>
            	</li>
            </ul>
            <!-- TREEVIEW CODE -->
        </div>
    </nav>
	<script>
	$.fn.extend({
		treeview:	function() {
			return this.each(function() {
				// Initialize the top levels;
				var tree = $(this);
				
				tree.addClass('treeview-tree');
				tree.find('li').each(function() {
					var stick = $(this);
				});
				tree.find('li').has("ul").each(function () {
					var branch = $(this); //li with children ul
					
					branch.prepend("<i class='tree-indicator glyphicon glyphicon-chevron-right'></i>");
					branch.addClass('tree-branch');
					branch.on('click', function (e) {
						if (this == e.target) {
							var icon = $(this).children('i:first');
							
							icon.toggleClass("glyphicon-chevron-down glyphicon-chevron-right");
							$(this).children().children().toggle();
						}
					})
					branch.children().children().toggle();
					
					/**
					 *	The following snippet of code enables the treeview to
					 *	function when a button, indicator or anchor is clicked.
					 *
					 *	It also prevents the default function of an anchor and
					 *	a button from firing.
					 */
					branch.children('.tree-indicator, button, a').click(function(e) {
						branch.click();
						
						e.preventDefault();
					});
				});
			});
		}
	});

	/**
	 *	The following snippet of code automatically converst
	 *	any '.treeview' DOM elements into a treeview component.
	 */
	$(window).on('load', function () {
		$('.treeview').each(function () {
			var tree = $(this);
			tree.treeview();
		})
	})</script>
</body>
</html>
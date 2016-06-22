<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
        	<div class="col-lg-3 col-md-3 col-sm-12">

        		<!-- Categories -->
        		<div class="col-lg-12 col-md-12 col-sm-6">
	        		<div class="no-padding">
	            		<span class="title">CATEGORIES</span>
	            	</div>

					<div id="main_menu">
                        <div class="list-group panel panel-cat">
                            <a href="#sub1" class="list-group-item" data-toggle="collapse" data-parent="#main_menu">Cras justo odio <i class="fa fa-caret-down pull-right"></i></a>
                            <div class="collapse list-group-sub" id="sub1">
                                <a href="#SubMenu1" class="list-group-item" data-toggle="collapse" data-parent="#SubMenu1">Subitem 1 <i class="fa fa-caret-down"></i></a>
                                <div class="collapse list-group-submenu" id="SubMenu1">
                                    <a href="#" class="list-group-item" data-parent="#SubMenu1">Subitem 1 a</a>
                                    <a href="#" class="list-group-item" data-parent="#SubMenu1">Subitem 2 b</a>
                                    <a href="#SubSubMenu1" class="list-group-item" data-toggle="collapse" data-parent="#SubSubMenu1">Subitem 3 c <i class="fa fa-caret-down"></i></a>
                                    <div class="collapse list-group-submenu list-group-submenu-1" id="SubSubMenu1">
                                        <a href="#" class="list-group-item" data-parent="#SubSubMenu1">Sub sub item 1</a>
                                        <a href="#" class="list-group-item" data-parent="#SubSubMenu1">Sub sub item 2</a>
                                    </div>
                                    <a href="#" class="list-group-item" data-parent="#SubMenu1">Subitem 4 d</a>
                                </div>
                                <a href="javascript:;" class="list-group-item">Subitem 2</a>
                                <a href="javascript:;" class="list-group-item">Subitem 3</a>
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
				<script src="js/jquery.bxslider.min.js"></script>
	<script src="js/mimity.js"></script>
</body>

</html>
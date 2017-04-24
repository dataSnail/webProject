<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
  <head>
    <title>404page</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	<!-- Bootstrap 3.3.4 -->
	<link href="<%=basePath%>bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<!-- Font Awesome Icons -->
	<link href="<%=basePath%>dist/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<!-- Ionicons -->
	<link href="<%=basePath%>dist/css/ionicons.min.css" rel="stylesheet" type="text/css" />    

  	<!-- Theme style -->
  	<link href="<%=basePath%>dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
	<!-- AdminLTE Skins. Choose a skin from the css/skins
	     folder instead of downloading all of them to reduce the load. -->
	<link href="<%=basePath%>dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />  	

  </head>
  <body class="skin-blue sidebar-mini">
  	<div class="wrapper">
 	
  
 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper" style = "margin-left:0px">
    <!-- Content Header (Page header) -->
    <section class="content" style = "padding:200px">

    <!-- Main content -->
      <div class="error-page">
        <h2 class="headline text-yellow"> 404</h2>
        <div class="error-content">
          <h3><i class="fa fa-warning text-yellow"></i> <span id = 'second'>5</span>秒返回主页，<a href = "<%=basePath%>">点此跳转！</a></h3>
          <p>您访问了错误的页面。</p>
        </div>
        <!-- /.error-content -->
      </div>
      <!-- /.error-page -->
      
      </section>
  	</div>
  </div>
  
<script type="text/javascript">  
 
	var sec = document.getElementById("second");
	var i = 5;
	var timer = setInterval(function(){
		i--;
		sec.innerHTML = i;
		if(i==1){
			window.location.href =  "<%=basePath%>";
		}
	},1000);
	 
  function goBack(){ 
	window.history.go(-1);
  }  
  </script>
  </body>
</html>

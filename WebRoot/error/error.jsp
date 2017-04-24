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

  <header class="main-header">
    <!-- Logo -->
    <a href="<%=basePath%>welcome.jsp" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini">MS</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>管理系统</b></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="<%=basePath%>dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
              <span class="hidden-xs">管理员</span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="<%=basePath%>dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                <p>系统管理员</p>
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-right">
                  <a href="#" class="btn btn-default btn-flat">登出</a>
                </div>
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </nav>
  </header>  	
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="<%=basePath %>dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>管理员</p>
        </div>
      </div>
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
        <li class="header">主菜单</li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-tasks"></i> <span>设备设施管理</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="${equipType==0?'active':'' }"><a href="<%=basePath%>equip/query.do?equipType=0"><i class="fa fa-circle-o"></i> 灭火器管理</a></li>
            <li class="${equipType==1?'active':'' }"><a href="<%=basePath%>equip/query.do?equipType=1"><i class="fa fa-circle-o"></i>流量计管理</a></li>
            <li class="${equipType==2?'active':'' }"><a href="<%=basePath%>equip/query.do?equipType=2"><i class="fa fa-circle-o"></i>安全阀管理</a></li>
            <li class="${equipType==3?'active':'' }"><a href="<%=basePath%>equip/query.do?equipType=3"><i class="fa fa-circle-o"></i>压力表管理</a></li>
            <li class="${equipType==4?'active':'' }"><a href="<%=basePath%>equip/query.do?equipType=4"><i class="fa fa-circle-o"></i>加气机管理</a></li>
            <li class="${equipType==5?'active':'' }"><a href="<%=basePath%>equip/query.do?equipType=5"><i class="fa fa-circle-o"></i>卸气柱管理</a></li>
            <li class="${equipType==6?'active':'' }"><a href="<%=basePath%>equip/query.do?equipType=6"><i class="fa fa-circle-o"></i>储气井管理</a></li>
            <li class="${equipType==7?'active':'' }"><a href="<%=basePath%>equip/query.do?equipType=7"><i class="fa fa-circle-o"></i>可燃气体报警管理</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-tasks"></i> <span>资产证照管理</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="${certifType==0?'active':'' }"><a href="<%=basePath%>certif/query.do?certifType=0"><i class="fa fa-circle-o"></i>成品油经营许可证</a></li>
            <li class="${certifType==1?'active':'' }"><a href="<%=basePath%>certif/query.do?certifType=1"><i class="fa fa-circle-o"></i>商务局批复</a></li>
            <li class="${certifType==2?'active':'' }"><a href="<%=basePath%>certif/query.do?certifType=2"><i class="fa fa-circle-o"></i>食品经营许可证</a></li>
            <li class="${certifType==3?'active':'' }"><a href="<%=basePath%>certif/query.do?certifType=3"><i class="fa fa-circle-o"></i>烟草证</a></li>
            <li class="${certifType==4?'active':'' }"><a href="<%=basePath%>certif/query.do?certifType=4"><i class="fa fa-circle-o"></i>从业人员健康证</a></li>
          </ul>
        </li>
        <li class = "treeview">
          <a href="#">
            <i class="fa fa-calendar-times-o"></i> <span>到期设备查询</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="<%=basePath%>out_date_item.jsp"><i class="fa fa-circle-o"></i>A类（已到期设备、证书）</a></li>
            <li><a href="<%=basePath%>out_date_item.jsp"><i class="fa fa-circle-o"></i>B类（7天内到期设备、证书）</a></li>
            <li><a href="<%=basePath%>out_date_item.jsp"><i class="fa fa-circle-o"></i>C类（30天内到期设备、证书）</a></li>
            <li><a href="<%=basePath%>out_date_item.jsp"><i class="fa fa-circle-o"></i>自定义时间内到期设备、证书</a></li>
          </ul>
        </li>

        <li>
          <a href="<%=basePath %>user_management.jsp">
            <i class="fa fa-user"></i> <span>用户管理</span>
          </a>
        </li>

      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
  
 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    
    <section class="content-header"></section>
    <section class="content">

    <!-- Main content -->
      <div class="error-page">
        <h2 class="headline text-yellow"> 404</h2>
        <div class="error-content">
          <h3><i class="fa fa-warning text-yellow"></i> </h3>
          <span id = 'second'>5</span><p>秒返回主页，<a href = "<%=basePath%>">点此跳转！</a></p>
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

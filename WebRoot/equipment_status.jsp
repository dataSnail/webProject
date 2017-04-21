<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>状态管理系统</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="./dist/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="./dist/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/iCheck/flat/blue.css">
  <!-- Morris chart -->
  <link rel="stylesheet" href="plugins/morris/morris.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="plugins/jvectormap/jquery-jvectormap-1.2.2.css">
  <!-- Date Picker -->
  <link rel="stylesheet" href="plugins/datepicker/datepicker3.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
  <!-- bootstrap wysihtml5 - text editor -->
  <link rel="stylesheet" href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
  <!-- DATA TABLES -->
  <link href="./plugins/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="welcome.jsp" class="logo">
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
              <img src="dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
              <span class="hidden-xs">管理员</span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
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
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>管理员</p>
        </div>
      </div>
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
        <li class="header">主菜单</li>
        <li class="treeview active">
          <a href="#">
            <i class="fa fa-tasks"></i> <span>设备设施管理</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="active"><a href="equipment_status.jsp"><i class="fa fa-circle-o"></i> 灭火器管理</a></li>
            <li><a href="equipment_status.jsp"><i class="fa fa-circle-o"></i>流量计管理</a></li>
            <li><a href="equipment_status.jsp"><i class="fa fa-circle-o"></i>安全阀管理</a></li>
            <li><a href="equipment_status.jsp"><i class="fa fa-circle-o"></i>压力表管理</a></li>
            <li><a href="equipment_status.jsp"><i class="fa fa-circle-o"></i>加气机管理</a></li>
            <li><a href="equipment_status.jsp"><i class="fa fa-circle-o"></i>卸气柱管理</a></li>
            <li><a href="equipment_status.jsp"><i class="fa fa-circle-o"></i>储气井管理</a></li>
            <li><a href="equipment_status.jsp"><i class="fa fa-circle-o"></i>可燃气体报警管理</a></li>
          </ul>
        </li>

        <li>
          <a href="out_date_item.jsp">
            <i class="fa fa-calendar-times-o"></i> <span>到期设备查询</span>
          </a>
        </li>

        <li>
          <a href="user_management.jsp">
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
    <section class="content-header">
      <h1>
        <small>设备设施有效期</small>
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
		<div class="callout callout-info">
		  <h4>小贴士!</h4>
		  <p>红色代表此设备即将到期！</p>
		</div>
	    <div class="row">
	      <div class="col-xs-12">
	        <div class="box box-solid box-info">
	        
	          <div class="box-header">
	            <h3 class="box-title">灭火器</h3>
	            <div class = "pull-right">
	            	<a href = "#" class="text-muted">
	            	<i class="fa fa-upload">点击导入Excel表格</i>
	            	</a>
	            </div>
	          </div>
	          <!-- /.box-header -->
	          
	          <div class="box-body">
	            <table id="table2017" class="table table-bordered table-striped">
	              <thead>
	                <tr>
	                  <th>部门</th>
	                  <th>房间号</th>
	                  <th>规格</th>
	                  <th>设备标号</th>
	                  <th>所在位置</th>
	                  <th>有效期</th>
	                  <th>责任部门</th>
	                  <th>责任人(电话)</th>
	                  <th>负责办理人(电话)</th>
	                  <th>备注</th>
	                </tr>
	              </thead>
	              <tbody>
	                <tr>
	                	<td class="text-red">经理室</td>
	                	<td class="text-red">1201</td>
	                	<td class="text-red">5KG手提干粉式灭火器</td>
	                	<td class="text-red">1</td>
	                	<td class="text-red">办公室门口</td>
	                	<td class="text-red">2017-5-6</td>
	                	<td class="text-red">综合办公室</td>
	                	<td class="text-red">张三（666666）</td>
	                	<td class="text-red">李大大（666666）</td>
	                	<td class="text-red"></td>
	                </tr>
	                <tr>
	                	<td>经理室</td>
	                	<td>1201</td>
	                	<td>5KG手提干粉式灭火器</td>
	                	<td>2</td>
	                	<td>办公桌旁</td>
	                	<td>2017-5-6</td>
	                	<td>综合管理部</td>
	                	<td>张三（666666）</td>
	                	<td>李大大（666666）</td>
	                	<td></td>
	                </tr>

	              </tbody>
	            </table>
	          </div><!-- /.box-body -->
	        </div><!-- /.box -->
	      </div><!-- /.col -->
	    </div><!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 0.1
    </div>
    <strong>Copyright &copy; 2014-2020 <a href="#">管理系统</a>.</strong> All rights
    reserved.
  </footer>

  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- jQuery 2.1.4 -->
<script src="./plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.2 JS -->
<script src="./bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<!-- DATA TABES SCRIPT -->
<script src="./plugins/datatables/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="./plugins/datatables/dataTables.bootstrap.min.js" type="text/javascript"></script>
<!-- SlimScroll -->
<script src="./plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<!-- FastClick -->
<script src='./plugins/fastclick/fastclick.min.js'></script>
<!-- AdminLTE App -->
<script src="./dist/js/app.min.js" type="text/javascript"></script>
<!-- AdminLTE for demo purposes -->
<script src="./dist/js/demo.js" type="text/javascript"></script>
<!-- page script -->
<script>
  $(function () {
    $('#table2017').DataTable({
        "paging": true,
        "lengthChange": false,
        "searching": false,
        "ordering": true,
        "info": true,
        "autoWidth": false
    });
  });
</script>
</body>
</html>


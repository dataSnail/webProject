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
  <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
  <!-- Bootstrap 3.3.4 -->
  <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
  <!-- Font Awesome Icons -->
  <link href="./dist/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
  <!-- Ionicons -->
  <link href="./dist/css/ionicons.min.css" rel="stylesheet" type="text/css" />
  
  <!-- iCheck for checkboxes and radio inputs -->
  <link rel="stylesheet" href="./plugins/iCheck/all.css">
  <!-- DATA TABLES -->
  <link href="./plugins/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
  <!-- Theme style -->
  <link href="./dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link href="./dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="skin-blue sidebar-mini">
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
        <li class="treeview">
          <a href="#">
            <i class="fa fa-tasks"></i> <span>灭火器状态查询</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="active"><a href="equipment_status.jsp"><i class="fa fa-circle-o"></i> 灭火器A</a></li>
            <li><a href="equipment_status.jsp"><i class="fa fa-circle-o"></i>加油站B</a></li>
          </ul>
        </li>

        <li class="treeview">
          <a href="#">
            <i class="fa fa-dashboard"></i> <span>其他状态查询</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="active"><a href="welcome.jsp"><i class="fa fa-circle-o"></i> 设备项目A</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i>设备项目B</a></li>
          </ul>
        </li>

        <li>
          <a href="out_date_item.jsp">
            <i class="fa fa-calendar-times-o"></i> <span>到期查询</span>
          </a>
        </li>

        <li class = "active">
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
        <small>用户管理信息面板</small>
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
    
	<div class="callout callout-info">
	  <h4>小贴士!</h4>
	  <p>管理员用户可以对用户账号信息进行管理！</p>
	</div>
		
      <div class="row">
        <div class="col-md-12">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#userinfo" data-toggle="tab">用户列表</a></li>
              <li><a href="#adduser" data-toggle="tab">添加用户</a></li>
              <li><a href="#settings" data-toggle="tab">Settings</a></li>
            </ul>
            
			<div class="tab-content">
				<div class="active tab-pane" id="userinfo">
					<div class="box">
					  <div class="box-header with-border">
					    <h3 class="box-title">用户管理</h3>
					  </div>
					  <!-- /.box-header -->
					  <div class="box-body">
					    <table class="table table-bordered">
					      <tr>
					        <th>用户名</th>
					        <th>角色</th>
					        <th>姓名</th>
					        <th>权限1</th>
					        <th>权限2</th>
					        <th>权限3</th>
					        <th>权限4</th>
					        <th>权限5</th>
					      </tr>
					      <tr>
					        <td>admin</td>
					        <td>管理员</td>
					        <td>张三</td>
					        <td>
					      <!-- checkbox -->
					        <label>
					          <input type="checkbox" class="flat-red" checked disabled>
					        </label>
					        </td>
					        <td>
					      <!-- checkbox -->
					        <label>
					          <input type="checkbox" class="flat-red" checked disabled>
					        </label>
					        </td>
					        <td>
					      <!-- checkbox -->
					        <label>
					          <input type="checkbox" class="flat-red" checked disabled>
					        </label>
					        </td>
					        <td>
					      <!-- checkbox -->
					        <label>
					          <input type="checkbox" class="flat-red" checked disabled>
					        </label>
					        </td>
					        <td>
					      <!-- checkbox -->
					        <label>
					          <input type="checkbox" class="flat-red" checked disabled>
					        </label>
					        </td>
					      </tr>
					      <tr>
					        <td>user1</td>
					        <td>普通用户</td>
					        <td>李四</td>
					        <td>
					      <!-- checkbox -->
					        <label>
					          <input type="checkbox" class="flat-red" checked disabled>
					        </label>
					        </td>
					        <td>
					      <!-- checkbox -->
					        <label>
					          <input type="checkbox" class="flat-red" disabled>
					        </label>
					        </td>
					        <td>
					      <!-- checkbox -->
					        <label>
					          <input type="checkbox" class="flat-red" disabled>
					        </label>
					        </td>
					        <td>
					      <!-- checkbox -->
					        <label>
					          <input type="checkbox" class="flat-red" disabled>
					        </label>
					        </td>
					        <td>
					      <!-- checkbox -->
					        <label>
					          <input type="checkbox" class="flat-red" disabled>
					        </label>
					        </td>
					      </tr>
					
					
					    </table>
					  </div>
					  <!-- /.box-body -->
					  <div class="box-footer clearfix">
					    <ul class="pagination pagination-sm no-margin pull-right">
					      <li><a href="#">&laquo;</a></li>
					      <li><a href="#">1</a></li>
					      <li><a href="#">2</a></li>
					      <li><a href="#">3</a></li>
					      <li><a href="#">&raquo;</a></li>
					    </ul>
					  </div>
					</div>
	        	</div><!-- /.tab-pane -->
	        	
				<div class="tab-pane" id="adduser">
				    <form class="form-horizontal">
				      <div class="form-group">
				        <label for="inputName" class="col-sm-2 control-label">用户名</label>
				
				        <div class="col-sm-6">
				          <input type="email" class="form-control" id="inputName" placeholder="用户名">
				        </div>
				      </div>
				      <div class="form-group">
				        <label for="inputEmail" class="col-sm-2 control-label">真实姓名</label>
				
				        <div class="col-sm-6">
				          <input type="email" class="form-control" id="inputEmail" placeholder="真实姓名">
				        </div>
				      </div>
				      <div class="form-group">
				        <label for="inputName" class="col-sm-2 control-label">角色</label>
				
				        <div class="col-sm-6">
					        <div class = "form-group">
						        <label>&nbsp;&nbsp;&nbsp;&nbsp;
						          <input type="radio" name = "r3" class="flat-red">管理员
						        </label>
						        
						        <label>&nbsp;&nbsp;&nbsp;&nbsp;
						          <input type="radio" name = "r3" class="flat-red">普通用户
						        </label>
					    	</div>
				        </div>
				      </div>
				      <div class="form-group">
				        <label for="inputExperience" class="col-sm-2 control-label">权限</label>
				
				        <div class="col-sm-6">
					        <div class = "form-group">
						        <label>&nbsp;&nbsp;&nbsp;&nbsp;
						          <input type="checkbox" name = "c3" class="flat-red">状态查询
						        </label>
						        <label>&nbsp;&nbsp;&nbsp;&nbsp;
						          <input type="checkbox" name = "c3" class="flat-red">设备查询
						        </label>
						        <label>&nbsp;&nbsp;&nbsp;&nbsp;
						          <input type="checkbox" name = "c3" class="flat-red">到期查询
						        </label>
					    	</div>
				        </div>
				      </div>
				      <div class="form-group">
				        <label for="inputSkills" class="col-sm-2 control-label">备注</label>
				
				        <div class="col-sm-6">
				          <input type="text" class="form-control" id="inputSkills" placeholder="备注信息">
				        </div>
				      </div>
				      <div class="form-group">
				        <div class="col-sm-offset-2 col-sm-6">
				          <button type="submit" class="btn btn-danger">Submit</button>
				        </div>
				      </div>
				    </form>
				</div><!-- /.tab-pane -->
				
	        	<div class="tab-pane" id="settings">
	        	</div><!-- /.tab-pane -->
            </div>
            <!-- /.tab-content -->
          </div>
          <!-- /.nav-tabs-custom -->
            
        	
        </div>
      </div>
      <!-- /.row -->
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
<!-- iCheck 1.0.1 -->
<script src="./plugins/iCheck/icheck.min.js"></script>
<!-- Page script -->
<script>
  $(function () {
    //Flat red color scheme for iCheck
    $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
      checkboxClass: 'icheckbox_flat-green',
      radioClass: 'iradio_flat-green'
    });
  });
</script>
</body>
</html>

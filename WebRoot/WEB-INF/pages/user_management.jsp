<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>状态管理系统</title>
  <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
  <!-- Bootstrap 3.3.4 -->
  <link href="<%=basePath%>bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
  <!-- Font Awesome Icons -->
  <link href="<%=basePath%>dist/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
  <!-- Ionicons -->
  <link href="<%=basePath%>dist/css/ionicons.min.css" rel="stylesheet" type="text/css" />
  
  <!-- iCheck for checkboxes and radio inputs -->
  <link rel="stylesheet" href="<%=basePath%>plugins/iCheck/all.css">
  <!-- DATA TABLES -->
  <link href="<%=basePath%>plugins/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
  <!-- Theme style -->
  <link href="<%=basePath%>dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link href="<%=basePath%>dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />

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
              <span class="hidden-xs">登录用户</span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="<%=basePath%>dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                <p>登录用户</p>
                <p><s:property value = '#session.username'/></p>
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-right">
                  <a href="<%=basePath%>userLogout.do?userName=<s:property value = '#session.username'/>" class="btn btn-default btn-flat">登出</a>
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
          <img src="<%=basePath%>dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>管理员</p>
          <p><s:property value = '#session.username'/></p>
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
            <i class="fa fa-book"></i> <span>资产证照管理</span>
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
            <li class="${timeType==0&&type == 0?'active':'' }"><a href="<%=basePath%>outdate/query.do?type=0&timeType=0"><i class="fa fa-circle-o"></i>30天内到期设备</a></li>
            <li class="${timeType==1&&type == 0?'active':'' }"><a href="<%=basePath%>outdate/query.do?type=0&timeType=1"><i class="fa fa-circle-o"></i>60天内到期设备</a></li>
            <li class="${timeType==2&&type == 0?'active':'' }"><a href="<%=basePath%>outdate/query.do?type=0&timeType=2"><i class="fa fa-circle-o"></i>90天内到期设备</a></li>
            <li class="${timeType==0&&type == 1?'active':'' }"><a href="<%=basePath%>outdate/query.do?type=1&timeType=0"><i class="fa fa-certificate"></i>30天内到期证书</a></li>
            <li class="${timeType==1&&type == 1?'active':'' }"><a href="<%=basePath%>outdate/query.do?type=1&timeType=1"><i class="fa fa-certificate"></i>60天内到期证书</a></li>
            <li class="${timeType==2&&type == 1?'active':'' }"><a href="<%=basePath%>outdate/query.do?type=1&timeType=2"><i class="fa fa-certificate"></i>90天内到期证书</a></li>
            <li class="${timeType==3?'active':'' }"><a href="<%=basePath%>outdate/query.do?timeType=3"><i class="fa fa-calendar-check-o"></i>自定义时间内到期设备、证书</a></li>
          </ul>
        </li>
        <li>
          <a href="<%=basePath%>up/uploadfile.do">
            <i class="fa fa-cloud-upload"></i> <span>数据导入</span>
          </a>
        </li>
        <li class = "active">
          <a href="<%=basePath%>user/userInfo.do">
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
              <!-- <li><a href="#settings" data-toggle="tab">Settings</a></li> -->
            </ul>
            
			<div class="tab-content">
				<div class="active tab-pane" id="userinfo">
					<div class="box">
					  <div class="box-header with-border">
					    <h3 class="box-title">用户信息列表</h3>
					  </div>
					  <!-- /.box-header -->
					  <div class="box-body">
					    <table class="table table-bordered">
					      <tr>
					        <th>用户名</th>
					        <th>姓名</th>
					        <th>设备管理</th>
					        <th>资产证照管理</th>
					        <th>到期设备管理</th>
					        <th>数据导入</th>
					        <th>用户管理</th>
					        <th>备注</th>
					      </tr>
					      
					      <s:iterator value="userinfoLs" id="userinfoLs">
					      <tr>
					        <td><s:property value="#userinfoLs.username"/></td>
					        <td><s:property value="#userinfoLs.realname"/></td>
					        <s:if test="#userinfoLs.priority[0] == 0">
					        <td>
						        <!-- checkbox -->
						        <label>
						          <input type="checkbox" class="flat-red" disabled>
						        </label>
					        </td>
					        </s:if>
					        <s:else>
					        <td>
						        <!-- checkbox -->
						        <label>
						          <input type="checkbox" class="flat-red" checked disabled>
						        </label>
					        </td>
					        </s:else>
					        <s:if test="#userinfoLs.priority[1] == 0">
					        <td>
						        <!-- checkbox -->
						        <label>
						          <input type="checkbox" class="flat-red" disabled>
						        </label>
					        </td>
					        </s:if>
					        <s:else>
					        <td>
						        <!-- checkbox -->
						        <label>
						          <input type="checkbox" class="flat-red" checked disabled>
						        </label>
					        </td>
					        </s:else>
					        <s:if test="#userinfoLs.priority[2] == 0">
					        <td>
						        <!-- checkbox -->
						        <label>
						          <input type="checkbox" class="flat-red" disabled>
						        </label>
					        </td>
					        </s:if>
					        <s:else>
					        <td>
						        <!-- checkbox -->
						        <label>
						          <input type="checkbox" class="flat-red" checked disabled>
						        </label>
					        </td>
					        </s:else>
					        <s:if test="#userinfoLs.priority[3] == 0">
					        <td>
						        <!-- checkbox -->
						        <label>
						          <input type="checkbox" class="flat-red" disabled>
						        </label>
					        </td>
					        </s:if>
					        <s:else>
					        <td>
						        <!-- checkbox -->
						        <label>
						          <input type="checkbox" class="flat-red" checked disabled>
						        </label>
					        </td>
					        </s:else>
					        <s:if test="#userinfoLs.priority[4] == 0">
					        <td>
						        <!-- checkbox -->
						        <label>
						          <input type="checkbox" class="flat-red" disabled>
						        </label>
					        </td>
					        </s:if>
					        <s:else>
					        <td>
						        <!-- checkbox -->
						        <label>
						          <input type="checkbox" class="flat-red" checked disabled>
						        </label>
					        </td>
					        </s:else>
					        <td><s:property value="#userinfoLs.notes"/></td>
					      </tr>
						  </s:iterator>
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
				    <form class="form-horizontal" method="POST" action = "<%=basePath%>user/addUser.do">
				      <div class="form-group">
				        <label for="inputName" class="col-sm-2 control-label">用户名</label>
				
				        <div class="col-sm-6">
				          <input type="text" class="form-control" name="userinfo.username" placeholder="用户名">
				        </div>
				      </div>
				      <div class="form-group">
				        <label for="inputEmail" class="col-sm-2 control-label">真实姓名</label>
				
				        <div class="col-sm-6">
				          <input type="text" class="form-control" name="userinfo.realname" placeholder="真实姓名">
				        </div>
				      </div>
				      <div class="form-group">
				        <label for="text" class="col-sm-2 control-label">密码</label>
				
				        <div class="col-sm-6">
				          <input type="password" class="form-control" name="userinfo.password" placeholder="密码">
				        </div>
				      </div>
				      <div class="form-group">
				        <label for="inputExperience" class="col-sm-2 control-label">权限</label>
				
				        <div class="col-sm-6">
					        <div class = "form-group">
						        <label>&nbsp;&nbsp;&nbsp;&nbsp;
						          <input type="checkbox" name = "userinfo.priority" value = "0" class="flat-red">设备管理
						        </label>
						        <label>&nbsp;&nbsp;&nbsp;&nbsp;
						          <input type="checkbox" name = "userinfo.priority" value = "1" class="flat-red">资产证照管理
						        </label>
						        <label>&nbsp;&nbsp;&nbsp;&nbsp;
						          <input type="checkbox" name = "userinfo.priority" value = "2" class="flat-red">到期设备管理
						        </label>
						        <label>&nbsp;&nbsp;&nbsp;&nbsp;
						          <input type="checkbox" name = "userinfo.priority" value = "3" class="flat-red">数据导入
						        </label>
						        <label>&nbsp;&nbsp;&nbsp;&nbsp;
						          <input type="checkbox" name = "userinfo.priority" value = "4" class="flat-red">用户管理
						        </label>
					    	</div>
				        </div>
				      </div>
				      <div class="form-group">
				        <label for="inputSkills" class="col-sm-2 control-label">备注</label>
				
				        <div class="col-sm-6">
				          <input type="text" class="form-control" id="userinfo.notes" placeholder="备注信息">
				        </div>
				      </div>
				      <div class="form-group">
				        <div class="col-sm-offset-2 col-sm-6">
				          <button type="submit" class="btn btn-danger">添加用户</button>
				        </div>
				      </div>
				    </form>
				</div><!-- /.tab-pane -->
				<!--
	        	<div class="tab-pane" id="settings">
	        	</div> /.tab-pane -->
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
<script src="<%=basePath%>plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.2 JS -->
<script src="<%=basePath%>bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<!-- DATA TABES SCRIPT -->
<script src="<%=basePath%>plugins/datatables/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="<%=basePath%>plugins/datatables/dataTables.bootstrap.min.js" type="text/javascript"></script>
<!-- SlimScroll -->
<script src="<%=basePath%>plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<!-- FastClick -->
<script src='<%=basePath%>plugins/fastclick/fastclick.min.js'></script>
<!-- AdminLTE App -->
<script src="<%=basePath%>dist/js/app.min.js" type="text/javascript"></script>
<!-- AdminLTE for demo purposes 
<script src="<%=basePath%>dist/js/demo.js" type="text/javascript"></script>-->
<!-- iCheck 1.0.1 -->
<script src="<%=basePath%>plugins/iCheck/icheck.min.js"></script>
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

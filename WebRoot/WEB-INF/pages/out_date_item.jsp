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
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="<%=basePath%>bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<%=basePath%>dist/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="<%=basePath%>dist/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=basePath%>dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="<%=basePath%>dist/css/skins/_all-skins.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="<%=basePath%>plugins/iCheck/flat/blue.css">
  <!-- Morris chart -->
  <link rel="stylesheet" href="<%=basePath%>plugins/morris/morris.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="<%=basePath%>plugins/jvectormap/jquery-jvectormap-1.2.2.css">
  <!-- Date Picker -->
  <link rel="stylesheet" href="<%=basePath%>plugins/datepicker/datepicker3.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="<%=basePath%>plugins/daterangepicker/daterangepicker.css">
  <!-- bootstrap wysihtml5 - text editor -->
  <link rel="stylesheet" href="<%=basePath%>plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
  <!-- DATA TABLES -->
  <link href="<%=basePath%>plugins/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
  
  <!-- Select2 -->
  <link rel="stylesheet" href="<%=basePath%>plugins/select2/select2.min.css">
  
  <!-- daterange picker -->
  <link rel="stylesheet" href="<%=basePath%>plugins/daterangepicker/daterangepicker.css">  
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
                <p><s:property value = '#session.username'/></p>
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
        <li class = "treeview active">
          <a href="#">
            <i class="fa fa-calendar-times-o"></i> <span>到期设备查询</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="${timeType==0&&type == 0?'active':'' }"><a href="<%=basePath%>outdate/query.do?type=0&timeType=0"><i class="fa fa-circle-o"></i>已到期设备</a></li>
            <li class="${timeType==1&&type == 0?'active':'' }"><a href="<%=basePath%>outdate/query.do?type=0&timeType=1"><i class="fa fa-circle-o"></i>7天内到期设备</a></li>
            <li class="${timeType==2&&type == 0?'active':'' }"><a href="<%=basePath%>outdate/query.do?type=0&timeType=2"><i class="fa fa-circle-o"></i>30天内到期设备</a></li>
            <li class="${timeType==0&&type == 1?'active':'' }"><a href="<%=basePath%>outdate/query.do?type=1&timeType=0"><i class="fa fa-certificate"></i>已到期、证书</a></li>
            <li class="${timeType==1&&type == 1?'active':'' }"><a href="<%=basePath%>outdate/query.do?type=1&timeType=1"><i class="fa fa-certificate"></i>7天内到期证书</a></li>
            <li class="${timeType==2&&type == 1?'active':'' }"><a href="<%=basePath%>outdate/query.do?type=1&timeType=2"><i class="fa fa-certificate"></i>30天内到期证书</a></li>
            <li class="${timeType==3?'active':'' }"><a href="<%=basePath%>outdate/query.do?timeType=3"><i class="fa fa-calendar-check-o"></i>自定义时间内到期设备、证书</a></li>
          </ul>
        </li>

        <li>
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
        <small>到期设备设施一览表</small>
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
		<div class="callout callout-info">
		  <h4>小贴士!</h4>
		  <p>红色代表此设备即将到期！</p>
		</div>
    	<div class = "box box-primary ${timeType==3?'':'hide' }">
    	<div class = "box-header"></div>
    	<div class = "box-body">
		<div class = "row"> 
		    <div class="col-xs-3">
		        <!-- Date yyyy-mm-dd -->
		        <div class="form-group">
		          <label>到期日期：</label>
		
		          <div class="input-group">
		            <div class="input-group-addon">
		              <i class="fa fa-calendar"></i>
		            </div>
		            <input type="text" class="form-control" data-inputmask="'alias': 'yyyy-mm-dd'" data-mask>
		            <span class="input-group-btn">
                      <button type="button" class="btn btn-info btn-flat">查询</button>
                    </span>
		          </div>
		          <!-- /.input group -->
		        </div>
		    </div>
		    
		    <div class="col-xs-3">
              <!-- Date and time range -->
              <!--
              <div class="form-group">
                <label>快速查询:</label>

                <div class="input-group">
                  <button type="button" class="btn btn-default pull-right" id="daterange-btn">
                    <span>
                      <i class="fa fa-calendar"></i> Date range picker
                    </span>
                    <i class="fa fa-caret-down"></i>
                  </button>
                </div>
              </div>-->
              <!-- /.form group -->
		    </div> 
	    </div>
		</div>
		</div>

	    <div class="row">
	      <div class="col-xs-12">
	      
	        <div class="box box-solid box-info">
	          <div class="box-header">
	            <h3 class="box-title">到期设备设施一览</h3>
	          </div>
	          <!-- /.box-header -->
	          <div class="box-body">
	            <table id="table2017" class="table table-bordered table-striped">
	              <thead>
	                <tr>
	                  <th>地区</th>
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
	                <s:iterator value="equipLs" id="equipLs">
	                <tr>
	                	<s:if test="#equipLs.status <= 0">
					    <td class = "text-red"><b><s:property value="#equipLs.area"/></b></td>
	                	<td class = "text-red"><b><s:property value="#equipLs.department"/></b></td>
	                	<td class = "text-red"><b><s:property value="#equipLs.roomId"/></b></td>
	                	<td class = "text-red"><b><s:property value="#equipLs.specification"/></b></td>
	                	<td class = "text-red"><b><s:property value="#equipLs.label"/></b></td>
	                	<td class = "text-red"><b><s:property value="#equipLs.location"/></b></td>
	                	<td class = "text-red"><b><s:date name="#equipLs.exp_date" format ="yyyy-MM-dd"/></b></td>
	                	<td class = "text-red"><b><s:property value="#equipLs.responsible_dep"/></b></td>
	                	<td class = "text-red"><b><s:property value="#equipLs.responsible_person"/></b></td>
	                	<td class = "text-red"><b><s:property value="#equipLs.person_pic"/></b></td>
	                	<td class = "text-red"><b><s:property value="#equipLs.note"/><small class="label pull-right bg-red">过期</small></b></td>
	                	</s:if>
	                	
	                	<s:elseif test="30>=#equipLs.status > 0">
	                	<s:if test="#equipLs.status <= 7">
					    <td class = "text-orange"><b><s:property value="#equipLs.area"/></b></td>
	                	<td class = "text-orange"><b><s:property value="#equipLs.department"/></b></td>
	                	<td class = "text-orange"><b><s:property value="#equipLs.roomId"/></b></td>
	                	<td class = "text-orange"><b><s:property value="#equipLs.specification"/></b></td>
	                	<td class = "text-orange"><b><s:property value="#equipLs.label"/></b></td>
	                	<td class = "text-orange"><b><s:property value="#equipLs.location"/></b></td>
	                	<td class = "text-orange"><b><s:date name="#equipLs.exp_date" format ="yyyy-MM-dd"/></b></td>
	                	<td class = "text-orange"><b><s:property value="#equipLs.responsible_dep"/></b></td>
	                	<td class = "text-orange"><b><s:property value="#equipLs.responsible_person"/></b></td>
	                	<td class = "text-orange"><b><s:property value="#equipLs.person_pic"/></b></td>
	                	<td class = "text-orange"><b><s:property value="#equipLs.note"/><small class="label pull-right bg-orange">7</small></b></td>
	                	</s:if>
	                	<s:else>
					    <td class = "text-light-blue"><b><s:property value="#equipLs.area"/></b></td>
	                	<td class = "text-light-blue"><b><s:property value="#equipLs.department"/></b></td>
	                	<td class = "text-light-blue"><b><s:property value="#equipLs.roomId"/></b></td>
	                	<td class = "text-light-blue"><b><s:property value="#equipLs.specification"/></b></td>
	                	<td class = "text-light-blue"><b><s:property value="#equipLs.label"/></b></td>
	                	<td class = "text-light-blue"><b><s:property value="#equipLs.location"/></b></td>
	                	<td class = "text-light-blue"><b><s:date name="#equipLs.exp_date" format ="yyyy-MM-dd"/></b></td>
	                	<td class = "text-light-blue"><b><s:property value="#equipLs.responsible_dep"/></b></td>
	                	<td class = "text-light-blue"><b><s:property value="#equipLs.responsible_person"/></b></td>
	                	<td class = "text-light-blue"><b><s:property value="#equipLs.person_pic"/></b></td>
	                	<td class = "text-light-blue"><b><s:property value="#equipLs.note"/><small class="label pull-right bg-light-blue">30</small></b></td>
	                	</s:else>
	                	</s:elseif>
	                	
	                	<s:else>
					    <td><b><s:property value="#equipLs.area"/></b></td>
	                	<td><b><s:property value="#equipLs.department"/></b></td>
	                	<td><b><s:property value="#equipLs.roomId"/></b></td>
	                	<td><b><s:property value="#equipLs.specification"/></b></td>
	                	<td><b><s:property value="#equipLs.label"/></b></td>
	                	<td><b><s:property value="#equipLs.location"/></b></td>
	                	<td><b><s:date name="#equipLs.exp_date" format ="yyyy-MM-dd"/></b></td>
	                	<td><b><s:property value="#equipLs.responsible_dep"/></b></td>
	                	<td><b><s:property value="#equipLs.responsible_person"/></b></td>
	                	<td><b><s:property value="#equipLs.person_pic"/></b></td>
	                	<td><b><s:property value="#equipLs.note"/></b></td>
	                	</s:else>
					</tr>
					</s:iterator>
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
<script src="<%=basePath%>plugins/input-mask/jquery.inputmask.js"></script>
<script src="<%=basePath%>plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="<%=basePath%>plugins/input-mask/jquery.inputmask.extensions.js"></script>

<!-- date-range-picker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script src="<%=basePath%>plugins/daterangepicker/daterangepicker.js"></script>
<!-- Select2 -->
<script src="<%=basePath%>plugins/select2/select2.full.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="<%=basePath%>dist/js/demo.js" type="text/javascript"></script>
<!-- page script -->
<script>
  $(function () {
	  
	$(".select2").select2();
    $('#table2017').DataTable({
        "paging": true,
        "lengthChange": false,
        "searching": false,
        "ordering": true,
        "info": true,
        "autoWidth": false,
        "iDisplayLength":50,
        "oLanguage": {
        	"sLengthMenu": "每页显示 _MENU_ 条记录",
        	"sZeroRecords": "抱歉， 没有找到",
        	"sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
        	"sInfoEmpty": "没有数据",
        	"sInfoFiltered": "(从 _MAX_ 条数据中检索)",
        	"oPaginate": {
        	"sFirst": "首页",
        	"sPrevious": "前一页",
        	"sNext": "后一页",
        	"sLast": "尾页"
        	},
        	"sZeroRecords": "没有检索到数据"
        	},
    });
    //Datemask yyyy-mm-dd
    $("#datemask").inputmask("yyyy-mm-dd", {"placeholder": "yyyy-mm-dd"});
    //Money Euro
    $("[data-mask]").inputmask();
    
    //Date range as a button
    $('#daterange-btn').daterangepicker(
        {
          ranges: {
            '今天': [moment()],
            'Last 7 Days': [moment().subtract(6, 'days'), moment()],
            'Last 30 Days': [moment().subtract(29, 'days'), moment()],
            'This Month': [moment().startOf('month'), moment().endOf('month')],
            'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
          },
          startDate: moment().subtract(29, 'days'),
          endDate: moment()
        },
        function (start, end) {
          $('#daterange-btn span').html(start.format('yyyy-mm-dd') + ' - ' + end.format('MMMM D, YYYY'));
        }
        );
  });
</script>
</body>
</html>
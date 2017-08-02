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

  <!-- 顶部导航栏 -->
  <jsp:include page="../../header.jsp"/>

  <jsp:include page="../../sider.jsp"></jsp:include>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <small>信息查询</small>
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
		<div class="callout callout-info">
		  <h4>小贴士!</h4>
		  <p>此处显示的为标记不过期项目！</p>
		</div>

	    <div class="row">
	    
    	<s:set name="lasttype" value= "-1" />
    		<s:iterator value="#session.catalog" id="catalog">
					<s:if test="#lasttype != #catalog.types_id ">
						<s:if test="#catalog.types_id == 0 ">
					      <div class="col-xs-12">
					        <div class="box box-solid box-info">
					          <div class="box-header">
					            <h3 class="box-title">特殊设备信息</h3>
					          </div>
					          <!-- /.box-header -->
					          <div class="box-body">
					            <table id="tableData" class="table table-bordered table-striped">
					              <thead id = "tabelData_th">
					              </thead>
					              <tbody id = "tableBody">
					              </tbody>
					            </table>
					          </div><!-- /.box-body -->
					        </div><!-- /.box -->
					      </div><!-- /.col -->
						</s:if>
						<s:if test="#catalog.types_id == 1 ">
					      <div class="col-xs-12">
					        <div class="box box-solid box-info">
					          <div class="box-header">
					            <h3 class="box-title">特殊证书信息</h3>
					          </div>
					          <!-- /.box-header -->
					          <div class="box-body">
					            <table id="tableData1" class="table table-bordered table-striped">
					              <thead id = "tabelData_th1">
				
					              </thead>
					              <tbody id = "tableBody1">
					              </tbody>
					            </table>
					          </div><!-- /.box-body -->
					        </div><!-- /.box -->
					      </div><!-- /.col -->
						</s:if>
					</s:if>
					<s:set name="lasttype" value= "#catalog.types_id" />
			</s:iterator>

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
<script src="<%=basePath%>js/moment.min.js"></script>
<script src="<%=basePath%>plugins/daterangepicker/daterangepicker.js"></script>
<script src="<%=basePath%>plugins/datepicker/bootstrap-datepicker.js"></script>

<!-- Select2 -->
<script src="<%=basePath%>plugins/select2/select2.full.min.js"></script>
<!-- AdminLTE for demo purposes 
<script src="<%=basePath%>dist/js/demo.js" type="text/javascript"></script>-->
<!-- page script -->
<script>
var currentDate = new Date();
var urlstr = "<%=basePath %>api/special.do";
urlstr = encodeURI(urlstr);
var dataTable = $('#tableData').DataTable({
      "paging": true,
        "lengthChange": false,
        "searching": false,
        "ordering": true,
        "info": true,
        "autoWidth": false,
        "iDisplayLength":50,
        "ajax":{
        	"url":urlstr,
        	"dataSrc": "data"},
        "retrieve": true,
        "sLoadingRecords" : "载入中...",
	        "columns":[
		                  { "data": "area",
	                  		"title":"地区",
		                	"render":function(data,type,row){
		                		return "<b>"+data+"</b>";
		                	}
	                  	  },
		                  { "data": "department",
		                    "title":"部门",
		                	"render":function(data,type,row){
		                		return "<b>"+data+"</b>";
		                	}
		  		          },
		                  { "data": "typeName",
		                    "title":"类型",
			                	"render":function(data,type,row){
			                		return "<b>"+data+"</b>";
			                	}
		  		          },
		                  { "data": "specification",
		                    "title":"规格",
		                	"render":function(data,type,row){
		                		return "<b>"+data+"</b>";
		                	}
		  		          },
		                  { "data": "label",
		                    "title":"设备标号",
		                	"render":function(data,type,row){
		                		return "<b>"+data+"</b>";
		                	}
		                  },
		                  { "data": "location",
 		                "title":"所在位置",
		                	"render":function(data,type,row){
		                		return "<b>"+data+"</b>";
		                	}
 		              },
		                  { "data": "exp_date",
			                	"title":"有效期",
			                	"render":function(data,type,row){
		                			return "<b>"+(1900+data.year)+"-"+((data.month+1)<10?("0"+(data.month+1)):(data.month+1))+"-"+(data.date<10?("0"+data.date):data.date)+"</b>";
			                	}
			               },
		                  { "data": "responsible_dep",
		                    "title":"责任部门",
		                	"render":function(data,type,row){
		                		return "<b>"+data+"</b>";
		                	}
		                  },
		                  { "data": "responsible_person",
		                    "title":"责任人(电话)",
		                	"render":function(data,type,row){
		                		return "<b>"+data+"</b>";
		                	}
		                  },
		                  { "data": "person_pic",
     		            "title":"负责办理人(电话)",
		                	"render":function(data,type,row){
		                		return "<b>"+data+"</b>";
		                	}
     		          },
		                  { "data": "note",
         		        "title":"备注",
		                	"render":function(data,type,row){
		                		return "<b>"+data+"</b><i class = 'fa fa-flag'></i>";
		                	}
         		      }
		              ],
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
	    
var dataTable1 = $('#tableData1').DataTable({
    "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "iDisplayLength":50,
      "ajax":{
      	"url":urlstr,
      	"dataSrc": "data2"},
      "retrieve": true,
      "sLoadingRecords" : "载入中...",
        "columns":[
	                  { "data": "department",
	                	"title":"片区",
	                	"render":function(data,type,row){
	                		return "<b>"+data+"</b>";
	                	}
	                  },
	                  { "data": "name",
	                	  "title":"部门",
		                	"render":function(data,type,row){
		                		return "<b>"+data+"</b>";
		                	}
	                  },
	                  { "data": "typeName",
		                    "title":"类型",
		                	"render":function(data,type,row){
		                		return "<b>"+data+"</b>";
		                	}
		  		          },
	                  { "data": "label",
	                    "title":"证号",
	                	"render":function(data,type,row){
	                		return "<b>"+data+"</b>";
	                	}
	                  },
	                  { "data": "specification",
	                    "title":"规格",
	                	"render":function(data,type,row){
	                		return "<b>"+data+"</b>";
	                	}
	  		          },
	                  { "data": "location",
		                "title":"所在位置",
	                	"render":function(data,type,row){
	                		return "<b>"+data+"</b>";
	                	}
		              },
	                  { "data": "exp_date",
	                	"title":"有效期",
	                	"render":function(data,type,row){
                			return "<b>"+(1900+data.year)+"-"+((data.month+1)<10?("0"+(data.month+1)):(data.month+1))+"-"+(data.date<10?("0"+data.date):data.date)+"</b>";
	                	}
	               },
	                  { "data": "responsible_dep",
	                    "title":"责任部门",
	                	"render":function(data,type,row){
	                		return "<b>"+data+"</b>";
	                	}
	                  },
	                  { "data": "responsible_person",
	                    "title":"责任人(电话)",
	                	"render":function(data,type,row){
	                		return "<b>"+data+"</b>";
	                	}
	                  },
	                  { "data": "person_pic",
   		            "title":"负责办理人(电话)",
	                	"render":function(data,type,row){
	                		return "<b>"+data+"</b>";
	                	}
   		          },
	                  { "data": "note",
       		        "title":"备注",
	                	"render":function(data,type,row){
	                		return "<b>"+data+"</b><i class = 'fa fa-flag'></i>";
	                	}
       		      }
	              ],
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
</script>
</body>
</html>

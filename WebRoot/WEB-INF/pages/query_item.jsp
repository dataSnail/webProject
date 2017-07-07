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
		  <p>部门可以填入部分关键词进行模糊查询！</p>
		</div>
    	<div class = "box box-primary">
    	<div class = "box-header"></div>
    	<div class = "box-body">
		<div class = "row"> 
		<form role = "form" action = "" method="POST" enctype="multipart/form-data">
			<div class="col-xs-2">
				<label>设备种类：</label>
				<select class="form-control" name = "etype">
			       	<s:set name="lasttype" value= "-1" />
					<s:iterator value="#session.catalog" id="catalog">
					<s:if test="#lasttype != #catalog.types_id ">
					    <option value = ${catalog.types_id }>${catalog.types}</option>
					</s:if>
					<s:set name="lasttype" value= "#catalog.types_id" />
					</s:iterator>
				</select>
			</div>
			<div class="col-xs-2">
			<label>地区：</label>
				<select class="form-control" name = "areaId">
				    <s:set name="lastarea" value= "-1" />
					<s:iterator value="#session.catalog" id="catalog">
						<s:if test="#lastarea != #catalog.area_id">
							<option value = ${catalog.area_id }>${catalog.area}</option>
						</s:if>
						<s:set name="lastarea" value= "#catalog.area_id" />
					</s:iterator>
				</select>
			</div>
			<div class="col-xs-2">
			<label>部门：</label>
				<input type="text" name = "departmentName" class="form-control" value = "">
			</div>
			<div class="col-xs-3">
			    <!-- Date yyyy-mm-dd -->
				<div class="form-group">
					<label>到期日期：</label>
				
					<div class="input-group">
						<div class="input-group-addon">
							<i class="fa fa-calendar"></i>
						</div>
					    <input type="text" name = "outdate" class="form-control" data-inputmask="'alias': 'yyyy-mm-dd'" data-mask>
					  
						<span class="input-group-btn">
						     <button type="button" class="btn btn-info btn-flat" id = "queryBt">查询</button>
						</span>
					</div>
				<!-- /.input group -->
				</div>
			</div>
		</form>
		    
		    <div class="col-xs-1">
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
              </div>
              <!-- /.form group -->
		    </div> 
	    </div>
		</div>
		</div>

	    <div class="row">
	      <div class="col-xs-12">
	      
	        <div class="box box-solid box-info">
	          <div class="box-header">
	            <h3 class="box-title">信息查询</h3>
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
	    </div><!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  
	<div class="modal modal-info fade in" id="modal-info" style="display: none; padding-right: 17px;">
		<div class="modal-dialog" style = "margin-top:10%">
			<div class="modal-content">
				<div class="box box-solid box-info">
					<div class="box-header">
		            <h3 class="box-title">信息修改</h3>
		            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  	<span aria-hidden="true">×</span></button>
		          	</div>
					<!-- form start -->
					<form class="form-horizontal" id = "editForm" action = "" method = "POST">
						<div class="box-body">
							<div class="form-group">
								<input type = "text" id = "edit_type" name = "" style = "display:none;"></input>
								<input type = "text" id = "edit_id" name = "equipinfo.id" style = "display:none;"></input>
							  <label for="inputEmail3" class="col-sm-2 control-label" id = "edit_area_label">地区：</label>
							  <div class="col-sm-4">
							    <input type="email" class="form-control" id="edit_area" name = "equipinfo.area" disabled>
							  </div>
							  <label for="inputEmail3" class="col-sm-2 control-label">部门：</label>
							  <div class="col-sm-4">
							    <input type="email" class="form-control" id="edit_dep" name = "equipinfo.department" disabled>
							  </div>
							</div>
							<div class="form-group">
							  <label for="inputEmail3" class="col-sm-2 control-label">规格</label>
							  <div class="col-sm-10">
							    <input type="email" class="form-control" id="edit_spe" name = "equipinfo.specification">
							  </div>
							</div>
							<div class="form-group">
							  <label for="inputEmail3" class="col-sm-2 control-label" id = "edit_label_label">设备标号</label>
							  <div class="col-sm-10">
							    <input type="email" class="form-control" id="edit_lab" name = "equipinfo.label">
							  </div>
							</div>
							<div class="form-group">
							  <label for="inputEmail3" class="col-sm-2 control-label">所在位置</label>
							  <div class="col-sm-10">
							    <input type="email" class="form-control" id="edit_loc"  name = "equipinfo.location">
							  </div>
							</div>
							<div class="form-group">
							  <label for="inputEmail3" class="col-sm-2 control-label">有效期</label>
							  <div class="col-sm-10">
							  <div class="input-group date">
							  	<div class="input-group-addon">
				                  <i class="fa fa-calendar"></i>
				                </div>
							    <input type="text" class="form-control pull-right" id="datepicker"  name = "equipinfo.exp_date">
							  </div>
							  </div>
							</div>
							<div class="form-group">
							  <label for="inputEmail3" class="col-sm-2 control-label">责任部门</label>
							  <div class="col-sm-10">
							    <input type="email" class="form-control" id="edit_res_dep"  name = "equipinfo.responsible_dep">
							  </div>
							</div>
							<div class="form-group">
							  <label for="inputEmail3" class="col-sm-2 control-label">责任人</label>
							  <div class="col-sm-10">
							    <input type="email" class="form-control" id="edit_res_per"  name = "equipinfo.responsible_person">
							  </div>
							</div>
							<div class="form-group">
							  <label for="inputEmail3" class="col-sm-2 control-label">负责办理人</label>
							  <div class="col-sm-10">
							    <input type="email" class="form-control" id="edit_person"  name = "equipinfo.person_pic">
							  </div>
							</div>
							<div class="form-group">
							  <label for="inputEmail3" class="col-sm-2 control-label">备注</label>
							  <div class="col-sm-10">
							    <input type="email" class="form-control" id="edit_note"  name = "equipinfo.note">
							  </div>
							</div>
						</div>
						  <!-- /.box-body -->
						<div class="box-footer">
						  <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">Cancel</button>
						  <button type="button" class="btn btn-info pull-right" onclick = "editButtonClick();">确认修改</button>
						  <label class="text-red pull-right" id = "edit_result"></label>
						</div>
					<!-- /.box-footer -->
					</form>
				</div>
			  </div>
			  <!-- /.modal-content -->
		</div>
	</div>
	
	<div class="modal fade in" id="modal-default" style="display: none; padding-right: 17px;">
	  <div class="modal-dialog" style = "margin-top:15%">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick ="javascript: $('#modal-default').hide();">
	          <span aria-hidden="true">×</span></button>
	        <h4 class="modal-title" id = "modal_title_text"></h4>
	      </div>
	      <div class="modal-body">
	      	<input type = "text" id = "confirm_id" style = "display:none;"></input>
	      	<input type = "text" id = "confirm_type" style = "display:none;"></input>
	        <p id = "modal_info_text"></p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default pull-left" data-dismiss="modal" onclick ="javascript: $('#modal-default').hide();" >取消</button>
	        <button type="button" class="btn btn-primary" onclick = "confirmDelete()">确认</button>
	      </div>
	    </div>
	    <!-- /.modal-content -->
	  </div>
	  <!-- /.modal-dialog -->
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
<script src="<%=basePath%>js/moment.min.js"></script> -->
<script src="<%=basePath%>plugins/daterangepicker/daterangepicker.js"></script>
<script src="<%=basePath%>plugins/datepicker/bootstrap-datepicker.js"></script>

<!-- Select2 -->
<script src="<%=basePath%>plugins/select2/select2.full.min.js"></script>
<!-- AdminLTE for demo purposes 
<script src="<%=basePath%>dist/js/demo.js" type="text/javascript"></script>-->
<!-- page script -->
<script>
var currentDate = new Date();
var dataTable = $('#tableData').DataTable({
      "paging": true,
        "lengthChange": false,
        "searching": false,
        "ordering": true,
        "info": true,
        "autoWidth": false,
        "iDisplayLength":50,
        "retrieve": true,
        "sLoadingRecords" : "载入中...",
        "columns":[ {"title":"地区"},{"title":"部门"},{"title":"类型"},{"title":"规格"},
                    {"title":"设备标号"},{"title":"所在位置"},{"title":"有效期"},{"title":"责任部门"},
                    {"title":"责任人"},{"title":"负责人"},{"title":"备注"},{"title":"操作"}],
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
  $(function () {
	  
	$(".select2").select2();
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
  //Date picker
  $('#datepicker').datepicker({
    format: 'yyyy-mm-dd',
    autoclose: true
  });
  $(document).ready(function(){
	  $("#queryBt").click(function(){
  		  var dateTime = $("*[name='outdate']").val();
  		  var typeVal = $("select[name=etype]").val();
  		  var areaVal = $("select[name=areaId]").val();
  		  var department = encodeURI($("*[name='departmentName']").val());
  		  var urlstr = "<%=basePath%>outdateapi/queryapi.do?timeType=3&outdate="+dateTime+"&etype="+typeVal+"&areaId="+areaVal+"&departmentName="+department;
  		  if(typeVal==0){
  			if(dataTable)dataTable.destroy();
  			dataTable = $('#tableData').DataTable({
  		        "paging": true,
  		        "lengthChange": false,
  		        "searching": false,
  		        "ordering": true,
  		        "info": true,
  		        "autoWidth": false,
  		        "iDisplayLength":50,
  		        "retrieve": true,
  		        "sLoadingRecords" : "载入中...",
  		        "columns":[
  			                  { "data": "area",
  		                  		"title":"地区",
  			                	"render":function(data,type,row){
  			                		if(row.status<=30){
  			                			return "<b class = 'text-red'>"+data+"</b>";
  			                		}else if(row.status>30 && row.status<=60){
  			                			return "<b class = 'text-orange'>"+data+"</b>";
  			                		}else if(row.status>60 && row.status<=90){
  			                			return "<b class = 'text-light-blue'>"+data+"</b>";
  			                		}else{
  			                			return "<b>"+data+"</b>";
  			                		}
  			                	}
  		                  	  },
  			                  { "data": "department",
    		                    "title":"部门",
  			                	"render":function(data,type,row){
  			                		if(row.status<=30){
  			                			return "<b class = 'text-red'>"+data+"</b>";
  			                		}else if(row.status>30 && row.status<=60){
  			                			return "<b class = 'text-orange'>"+data+"</b>";
  			                		}else if(row.status>60 && row.status<=90){
  			                			return "<b class = 'text-light-blue'>"+data+"</b>";
  			                		}else{
  			                			return "<b>"+data+"</b>";
  			                		}
  			                	}
    		  		          },
  			                  { "data": "typeName",
      		                    "title":"类型",
    			                	"render":function(data,type,row){
    			                		if(row.status<=30){
    			                			return "<b class = 'text-red'>"+data+"</b>";
    			                		}else if(row.status>30 && row.status<=60){
    			                			return "<b class = 'text-orange'>"+data+"</b>";
    			                		}else if(row.status>60 && row.status<=90){
    			                			return "<b class = 'text-light-blue'>"+data+"</b>";
    			                		}else{
    			                			return "<b>"+data+"</b>";
    			                		}
    			                	}
      		  		          },
  			                  { "data": "specification",
    		                    "title":"规格",
  			                	"render":function(data,type,row){
  			                		if(row.status<=30){
  			                			return "<b class = 'text-red'>"+data+"</b>";
  			                		}else if(row.status>30 && row.status<=60){
  			                			return "<b class = 'text-orange'>"+data+"</b>";
  			                		}else if(row.status>60 && row.status<=90){
  			                			return "<b class = 'text-light-blue'>"+data+"</b>";
  			                		}else{
  			                			return "<b>"+data+"</b>";
  			                		}
  			                	}
    		  		          },
  			                  { "data": "label",
      		                    "title":"设备标号",
  			                	"render":function(data,type,row){
  			                		if(row.status<=30){
  			                			return "<b class = 'text-red'>"+data+"</b>";
  			                		}else if(row.status>30 && row.status<=60){
  			                			return "<b class = 'text-orange'>"+data+"</b>";
  			                		}else if(row.status>60 && row.status<=90){
  			                			return "<b class = 'text-light-blue'>"+data+"</b>";
  			                		}else{
  			                			return "<b>"+data+"</b>";
  			                		}
  			                	}
      		                  },
  			                  { "data": "location",
        		                "title":"所在位置",
  			                	"render":function(data,type,row){
  			                		if(row.status<=30){
  			                			return "<b class = 'text-red'>"+data+"</b>";
  			                		}else if(row.status>30 && row.status<=60){
  			                			return "<b class = 'text-orange'>"+data+"</b>";
  			                		}else if(row.status>60 && row.status<=90){
  			                			return "<b class = 'text-light-blue'>"+data+"</b>";
  			                		}else{
  			                			return "<b>"+data+"</b>";
  			                		}
  			                	}
        		              },
  			                  { "data": "exp_date",
            		            "title":"有效期",
  			                	"render":function(data,type,row){
  			                		if(row.status<=30){
  			                			return "<b class = 'text-red'>"+(1900+data.year)+"-"+(data.month+1)+"-"+data.date+"</b>";
  			                		}else if(row.status>30 && row.status<=60){
  			                			return "<b class = 'text-orange'>"+(1900+data.year)+"-"+(data.month+1)+"-"+data.date+"</b>";
  			                		}else if(row.status>60 && row.status<=90){
  			                			return "<b class = 'text-light-blue'>"+(1900+data.year)+"-"+(data.month+1)+"-"+data.date+"</b>";
  			                		}else{
  			                			return "<b>"+(1900+data.year)+"-"+(data.month+1)+"-"+data.date+"</b>";
  			                		}
  			                	}
  			                  },
  			                  { "data": "responsible_dep",
      		                    "title":"责任部门",
  			                	"render":function(data,type,row){
  			                		if(row.status<=30){
  			                			return "<b class = 'text-red'>"+data+"</b>";
  			                		}else if(row.status>30 && row.status<=60){
  			                			return "<b class = 'text-orange'>"+data+"</b>";
  			                		}else if(row.status>60 && row.status<=90){
  			                			return "<b class = 'text-light-blue'>"+data+"</b>";
  			                		}else{
  			                			return "<b>"+data+"</b>";
  			                		}
  			                	}
      		                  },
  			                  { "data": "responsible_person",
      		                    "title":"责任人(电话)",
  			                	"render":function(data,type,row){
  			                		if(row.status<=30){
  			                			return "<b class = 'text-red'>"+data+"</b>";
  			                		}else if(row.status>30 && row.status<=60){
  			                			return "<b class = 'text-orange'>"+data+"</b>";
  			                		}else if(row.status>60 && row.status<=90){
  			                			return "<b class = 'text-light-blue'>"+data+"</b>";
  			                		}else{
  			                			return "<b>"+data+"</b>";
  			                		}
  			                	}
      		                  },
  			                  { "data": "person_pic",
            		            "title":"负责办理人(电话)",
  			                	"render":function(data,type,row){
  			                		if(row.status<=30){
  			                			return "<b class = 'text-red'>"+data+"</b>";
  			                		}else if(row.status>30 && row.status<=60){
  			                			return "<b class = 'text-orange'>"+data+"</b>";
  			                		}else if(row.status>60 && row.status<=90){
  			                			return "<b class = 'text-light-blue'>"+data+"</b>";
  			                		}else{
  			                			return "<b>"+data+"</b>";
  			                		}
  			                	}
            		          },
  			                  { "data": "note",
                		        "title":"备注",
  			                	"render":function(data,type,row){
  			                		if(row.status<=30){
  			                			return "<b class = 'text-red'>"+data+"</b>";
  			                		}else if(row.status>30 && row.status<=60){
  			                			return "<b class = 'text-orange'>"+data+"</b>";
  			                		}else if(row.status>60 && row.status<=90){
  			                			return "<b class = 'text-light-blue'>"+data+"</b>";
  			                		}else{
  			                			return "<b>"+data+"</b>";
  			                		}
  			                	}
                		      },
  			                  { "data": "id",
                    		    "title":"操作",
                    		    "render":function(data){
                    		    	return "<button type = 'button' class = 'btn btn-info' data-toggle='modal' data-target='#modal-info' style = 'padding:1px 3px' onclick = 'editRow("+data+",0)'><i class = 'fa fa-edit'></i></button>&nbsp;<button type = 'button' class = 'btn btn-info' style = 'padding:1px 3px' onclick = 'deleteRow("+data+",0)'><i class = 'fa  fa-trash'></i></button>"
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
  		  }
  		  if(typeVal==1){
  			if(dataTable)dataTable.destroy();
  			dataTable = $('#tableData').DataTable({
  		        "paging": true,
  		        "lengthChange": false,
  		        "searching": false,
  		        "ordering": true,
  		        "info": true,
  		        "autoWidth": false,
  		        "iDisplayLength":50,
  		        "retrieve": true,
  		        "sLoadingRecords" : "载入中...",
  		        "columns":[
  			                  { "data": "department",
  			                	"title":"片区",
  			                	"render":function(data,type,row){
  			                		if(row.status<=30){
  			                			return "<b class = 'text-red'>"+data+"</b>";
  			                		}else if(row.status>30 && row.status<=60){
  			                			return "<b class = 'text-orange'>"+data+"</b>";
  			                		}else if(row.status>60 && row.status<=90){
  			                			return "<b class = 'text-light-blue'>"+data+"</b>";
  			                		}else{
  			                			return "<b>"+data+"</b>";
  			                		}
  			                	}
  			                  },
  			                  { "data": "name",
  			                	  "title":"部门",
    			                	"render":function(data,type,row){
      			                		if(row.status<=30){
      			                			return "<b class = 'text-red'>"+data+"</b>";
      			                		}else if(row.status>30 && row.status<=60){
      			                			return "<b class = 'text-orange'>"+data+"</b>";
      			                		}else if(row.status>60 && row.status<=90){
      			                			return "<b class = 'text-light-blue'>"+data+"</b>";
      			                		}else{
      			                			return "<b>"+data+"</b>";
      			                		}
      			                	}
  			                  },
  			                  { "data": "typeName",
        		                    "title":"类型",
      			                	"render":function(data,type,row){
      			                		if(row.status<=30){
      			                			return "<b class = 'text-red'>"+data+"</b>";
      			                		}else if(row.status>30 && row.status<=60){
      			                			return "<b class = 'text-orange'>"+data+"</b>";
      			                		}else if(row.status>60 && row.status<=90){
      			                			return "<b class = 'text-light-blue'>"+data+"</b>";
      			                		}else{
      			                			return "<b>"+data+"</b>";
      			                		}
      			                	}
        		  		          },
  			                  { "data": "label",
      		                    "title":"证号",
  			                	"render":function(data,type,row){
  			                		if(row.status<=30){
  			                			return "<b class = 'text-red'>"+data+"</b>";
  			                		}else if(row.status>30 && row.status<=60){
  			                			return "<b class = 'text-orange'>"+data+"</b>";
  			                		}else if(row.status>60 && row.status<=90){
  			                			return "<b class = 'text-light-blue'>"+data+"</b>";
  			                		}else{
  			                			return "<b>"+data+"</b>";
  			                		}
  			                	}
      		                  },
  			                  { "data": "specification",
      		                    "title":"规格",
  			                	"render":function(data,type,row){
  			                		if(row.status<=30){
  			                			return "<b class = 'text-red'>"+data+"</b>";
  			                		}else if(row.status>30 && row.status<=60){
  			                			return "<b class = 'text-orange'>"+data+"</b>";
  			                		}else if(row.status>60 && row.status<=90){
  			                			return "<b class = 'text-light-blue'>"+data+"</b>";
  			                		}else{
  			                			return "<b>"+data+"</b>";
  			                		}
  			                	}
      		  		          },
  			                  { "data": "location",
          		                "title":"所在位置",
  			                	"render":function(data,type,row){
  			                		if(row.status<=30){
  			                			return "<b class = 'text-red'>"+data+"</b>";
  			                		}else if(row.status>30 && row.status<=60){
  			                			return "<b class = 'text-orange'>"+data+"</b>";
  			                		}else if(row.status>60 && row.status<=90){
  			                			return "<b class = 'text-light-blue'>"+data+"</b>";
  			                		}else{
  			                			return "<b>"+data+"</b>";
  			                		}
  			                	}
          		              },
  			                  { "data": "exp_date",
  			                	"title":"有效期",
  			                	"render":function(data,type,row){
  			                		if(row.status<=30){
  			                			return "<b class = 'text-red'>"+(1900+data.year)+"-"+(data.month+1)+"-"+data.date+"</b>";
  			                		}else if(row.status>30 && row.status<=60){
  			                			return "<b class = 'text-orange'>"+(1900+data.year)+"-"+(data.month+1)+"-"+data.date+"</b>";
  			                		}else if(row.status>60 && row.status<=90){
  			                			return "<b class = 'text-light-blue'>"+(1900+data.year)+"-"+(data.month+1)+"-"+data.date+"</b>";
  			                		}else{
  			                			return "<b>"+(1900+data.year)+"-"+(data.month+1)+"-"+data.date+"</b>";
  			                		}
  			                	}
  			                  },
  			                  { "data": "responsible_dep",
       		                    "title":"责任部门",
  			                	"render":function(data,type,row){
  			                		if(row.status<=30){
  			                			return "<b class = 'text-red'>"+data+"</b>";
  			                		}else if(row.status>30 && row.status<=60){
  			                			return "<b class = 'text-orange'>"+data+"</b>";
  			                		}else if(row.status>60 && row.status<=90){
  			                			return "<b class = 'text-light-blue'>"+data+"</b>";
  			                		}else{
  			                			return "<b>"+data+"</b>";
  			                		}
  			                	}
       		                  },
   			                  { "data": "responsible_person",
       		                    "title":"责任人(电话)",
  			                	"render":function(data,type,row){
  			                		if(row.status<=30){
  			                			return "<b class = 'text-red'>"+data+"</b>";
  			                		}else if(row.status>30 && row.status<=60){
  			                			return "<b class = 'text-orange'>"+data+"</b>";
  			                		}else if(row.status>60 && row.status<=90){
  			                			return "<b class = 'text-light-blue'>"+data+"</b>";
  			                		}else{
  			                			return "<b>"+data+"</b>";
  			                		}
  			                	}
       		                  },
   			                  { "data": "person_pic",
              		            "title":"负责办理人(电话)",
  			                	"render":function(data,type,row){
  			                		if(row.status<=30){
  			                			return "<b class = 'text-red'>"+data+"</b>";
  			                		}else if(row.status>30 && row.status<=60){
  			                			return "<b class = 'text-orange'>"+data+"</b>";
  			                		}else if(row.status>60 && row.status<=90){
  			                			return "<b class = 'text-light-blue'>"+data+"</b>";
  			                		}else{
  			                			return "<b>"+data+"</b>";
  			                		}
  			                	}
              		          },
  			                  { "data": "note",
                  		        "title":"备注",
  			                	"render":function(data,type,row){
  			                		if(row.status<=30){
  			                			return "<b class = 'text-red'>"+data+"</b>";
  			                		}else if(row.status>30 && row.status<=60){
  			                			return "<b class = 'text-orange'>"+data+"</b>";
  			                		}else if(row.status>60 && row.status<=90){
  			                			return "<b class = 'text-light-blue'>"+data+"</b>";
  			                		}else{
  			                			return "<b>"+data+"</b>";
  			                		}
  			                	}
                  		      },
   			                  { "data": "id",
                      		    "title":"操作",
                      		    "render":function(data){
                      		    	return "<button type = 'button' class = 'btn btn-info' data-toggle='modal' data-target='#modal-info' style = 'padding:1px 3px' onclick = 'editRow("+data+",1)'><i class = 'fa fa-edit'></i></button>&nbsp;<button type = 'button' class = 'btn btn-info'  style = 'padding:1px 3px' onclick = 'deleteRow("+data+",1)' ><i class = 'fa  fa-trash'></i></button>"
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
  		        	}
  		    });
  		  }
  		  urlstr = encodeURI(urlstr);
  		  dataTable.ajax.url(urlstr).load();
  	  });
  	});
  function editButtonClick(){//编辑提交
	  $("#edit_result").text("");
	  var row_type = $("#edit_type").val(); 
	  var row_id = $("#edit_id").val();
		var row_area = $("#edit_area").val();
		var row_department = $("#edit_dep").val();
		var row_specification = $("#edit_spe").val();
		var row_label = $("#edit_lab").val();
		var row_location = $("#edit_loc").val();
		var row_exp_date = $("#datepicker").val();
		var row_responsible_dep = $("#edit_res_dep").val();
		var row_responsible_person = $("#edit_res_per").val();
		var row_person_pic = $("#edit_person").val();
		var row_note = $("#edit_note").val();
		if(row_type==0){
		$.getJSON({
			url:"<%=basePath%>equipapi/updateapi.do",
			type:"post",
			data:{"equipinfo.id":row_id,
				"equipinfo.area":row_area,
				"equipinfo.department":row_department,
				"equipinfo.specification":row_specification,
				"equipinfo.label":row_label,
				"equipinfo.location":row_location,
				"equipinfo.exp_date":row_exp_date,
				"equipinfo.responsible_dep":row_responsible_dep,
				"equipinfo.responsible_person":row_responsible_person,
				"equipinfo.person_pic":row_person_pic,
				"equipinfo.note":row_note
			},
			success:function(data){
				if (data.status>0){
					$("#edit_result").text("修改成功！");
					$("#queryBt").click();
				}else{
					$("#edit_result").text("修改失败！");
				}
			}
			
		});
		}else if(row_type==1){
			$.getJSON({
				url:"<%=basePath%>certifapi/updateapi.do",
				type:"post",
				data:{"certifyinfo.id":row_id,
					"certifyinfo.area":row_area,
					"certifyinfo.department":row_department,
					"certifyinfo.specification":row_specification,
					"certifyinfo.label":row_label,
					"certifyinfo.location":row_location,
					"certifyinfo.exp_date":row_exp_date,
					"certifyinfo.responsible_dep":row_responsible_dep,
					"certifyinfo.responsible_person":row_responsible_person,
					"certifyinfo.person_pic":row_person_pic,
					"certifyinfo.note":row_note
				},
				success:function(data){
					if (data.status>0){
						$("#edit_result").text("修改成功！");
						$("#queryBt").click();
					}else{
						$("#edit_result").text("修改失败！");
					}
				}
				
			});
		}else{
			alert("设备类型错误！请联系管理员！");
		}
		
	};
  function editRow(dataId,type){//编辑按钮
	  $("#edit_result").text("");
	  $("#edit_id").val(dataId);
	  if(type==0){
	  $.getJSON({ url: '<%=basePath%>equipapi/queryapi.do?id='+dataId, success: function(data){
		  $("#edit_type").val(data.type);
		  $("#edit_area").val(data.area);
		  $("#edit_dep").val(data.department);
		  $("#edit_spe").val(data.specification);
		  $("#edit_lab").val(data.label);
		  $("#edit_loc").val(data.location);
		  $("#datepicker").val(data.exp_date);
		  $("#edit_res_dep").val(data.responsible_dep);
		  $("#edit_res_per").val(data.responsible_person);
		  $("#edit_person").val(data.person_pic);
		  $("#edit_note").val(data.notes);
	  }});
	  }else if(type==1){
		  $("#edit_area_label").text("片区");
		  $("#edit_label_label").text("证号");
		  $.getJSON({ url: '<%=basePath%>certifapi/queryapi.do?id='+dataId, success: function(data){
			  $("#edit_type").val(data.type);
			  $("#edit_area").val(data.department);
			  $("#edit_dep").val(data.name);
			  $("#edit_spe").val(data.specification);
			  $("#edit_lab").val(data.label);
			  $("#edit_loc").val(data.location);
			  $("#datepicker").val(data.exp_date);
			  $("#edit_res_dep").val(data.responsible_dep);
			  $("#edit_res_per").val(data.responsible_person);
			  $("#edit_person").val(data.person_pic);
			  $("#edit_note").val(data.notes);
		  }});
	  }else{
		  alert("设备类型错误！请联系管理员！");
	  }
  };
  function deleteRow(dataId,type){//编辑按钮
		$("#modal_title_text").text("确认操作");
		$("#modal_info_text").text("确认删除此条信息？此操作不可逆！");
	  if(type==0 || type == 1){
		$("#confirm_id").val(dataId);
		$("#confirm_type").val(type);
		$("#modal-default").show();
	  }else{
		  alert("设备类型错误！请联系管理员！");
	  }
  };
  
 function confirmDelete(){
	$("#modal-default").hide();
	var id = $("#confirm_id").val();
	var type = $("#confirm_type").val();
	if(type == 0){//设备
		$.getJSON({ url: '<%=basePath%>equipapi/deleteapi.do?id='+id, success: function(data){
			$("#modal_title_text").text("提示信息");
			if(data.status>0){
				$("#modal_info_text").text("删除成功！");
				$("#queryBt").click();
			}else{
				$("#modal_info_text").text("删除失败！");
			}
			$("#confirm_type").val(3);
			$("#modal-default").show();
		}});
	 }else if(type == 1){//证书
		$.getJSON({ url: '<%=basePath%>certifapi/deleteapi.do?id='+id, success: function(data){
			$("#modal_title_text").text("提示信息");
			if(data.status>0){
				$("#modal_info_text").text("删除成功！");
				$("#queryBt").click();
			}else{
				$("#modal_info_text").text("删除失败！请刷新数据！");
			}
			$("#confirm_type").val(3);
			$("#modal-default").show();
		}});
	 }else{
		 $("#modal-default").hide();
	 }
 }
  
  
</script>
</body>
</html>

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
  <title>数据导入-状态管理系统</title>
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
  <!-- Left side column. contains the logo and sidebar -->
 <jsp:include page="../../sider.jsp"></jsp:include>


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <small>数据导入</small>
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
		<div class="callout callout-info">
		  <h4>小贴士!</h4>
		  <p>可以选择使用<b>文件批量导入</b>功能导入多条信息，也可以选择使用<b>单条信息导入</b>功能导入一条信息！</p>
		</div>
	
      <div class="row">
        <div class="col-md-12">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#fileupload" data-toggle="tab">文件批量导入</a></li>
              <li><a href="#addinfo" data-toggle="tab">单条信息导入</a></li>
            </ul>
            <div class="tab-content">
            <div class="active tab-pane" id="fileupload">
		        <div class="box">
		            <form role = "form" action = "" method="POST" enctype="multipart/form-data">
		            <div class = "box-body">
			        	<div class = "form-group">
			        		<label>模板下载:</label>
		              	</div>
		              	<div>
			              	<a href="<%=basePath%>upload/equipmentTemplate.xls"><i class="fa fa-wrench"></i>&nbsp;&nbsp;设备模板下载</a>
			              	&nbsp;&nbsp;&nbsp;&nbsp;
			              	<a href="<%=basePath%>upload/certificationTemplate.xls"><i class="fa fa-wrench">&nbsp;&nbsp;证书模板下载</i></a>
		              	</div>
		        	<div class = "form-group">
		        	<label>&nbsp;</label>
	              	</div>
		            <div class = "form-group">
			          <label>上传文件：</label>
			             <s:file name="myFile" label="文件"></s:file>
		          	</div>
		          	<div class="form-group">
			            <div class="radio">
			              <label>
			                <input type="radio" name="fileType" id="optionsRadios1" value="equipment" checked="">设备文件格式
			              </label>
			            </div>
			            <div class="radio">
			              <label>
			                <input type="radio" name="fileType" id="optionsRadios2" value="certification">证书文件格式
			              </label>
			            </div>
		            </div>
		            </div>
		            <div class="box-footer">
		                <button type="submit" class="btn btn-primary">上传并导入系统</button><label>${result }</label>
		              </div>
		            </form>
		        </div>
			</div>
			
			<div class="tab-pane" id="addinfo">
					<!-- form start -->
					<form class="form-horizontal" id = "editForm" action = "" method = "POST">
						<div class="form-group">
					    <label class="col-sm-1 control-label">类型：</label>
					    <div class="col-sm-3">
				            <select class="form-control" name = "etype" id = "etype" onchange="etypePickChange()">
				            	<s:set name="lasttype" value= "-1" />
								<s:iterator value="#session.catalog" id="catalog">
									<s:if test="#lasttype != #catalog.types_id ">
									    <option value = ${catalog.types_id }>${catalog.types}</option>
									</s:if>
									<s:set name="lasttype" value= "#catalog.types_id" />
								</s:iterator>
				            </select>
				        </div>
						</div>
					
						<div class="form-group">
							<input type = "text" id = "edit_type" name = "" style = "display:none;"></input>
						  <label for="inputEmail3" class="col-sm-1 control-label" id = "edit_area_label">地区：</label>
						  <div class="col-sm-3">
				            <select class="form-control" name = "area" id = "area">
						      <s:set name="lastarea" value= "-1" />
							<s:iterator value="#session.catalog" id="catalog">
								<s:if test="#lastarea != #catalog.area_id">
									<option value = ${catalog.area_id }>${catalog.area}</option>
								</s:if>
								<s:set name="lastarea" value= "#catalog.area_id" />
							</s:iterator>
				            </select>
						  </div>
						</div>
						<div class="form-group">
				        <label class="col-sm-1 control-label" id = "typeLabel">设备种类：</label>
				        <div class="col-sm-3">
				        	<select class="form-control" name = "type" id = "type">
				        	<s:set name="lastetype" value= "-1" />
							<s:iterator value="#session.equipCertiStr" id="equipCertiStr">
								<s:if test="#lastetype != #equipCertiStr.types_type_id">
				        		<option value = ${equipCertiStr.types_type_id}>(${equipCertiStr.types})${equipCertiStr.types_type}</option>
				        		</s:if>
				        		<s:set name="lastetype" value= "#equipCertiStr.types_type_id" />
				        		</s:iterator>
				        	</select>
				        </div>
						</div>
						<div class="form-group" id = "pianDiv" style = "display:none;">
						  <label for="inputEmail3" class="col-sm-1 control-label">片区：</label>
						  <div class="col-sm-3">
						    <input type="email" class="form-control" id="edit_pian">
						  </div>
						  <label class="control-label text-red pull-left" id = "pian_label">*</label>
						</div>
						<div class="form-group">
						  <label for="inputEmail3" class="col-sm-1 control-label">部门：</label>
						  <div class="col-sm-3">
						    <input type="email" class="form-control" id="edit_dep">
						  </div>
						  <label class="control-label text-red pull-left" id = "dep_label">*</label>
						</div>
						<div class="form-group">
						  <label for="inputEmail3" class="col-sm-1 control-label">规格：</label>
						  <div class="col-sm-3">
						    <input type="email" class="form-control" id="edit_spe" name = "equipinfo.specification" >
						  </div>
						  <label class="control-label text-red pull-left" id = "spe_label">*</label>
						</div>
						<div class="form-group">
						  <label for="inputEmail3" class="col-sm-1 control-label" id = "editLabel">设备标号：</label>
						  <div class="col-sm-3">
						    <input type="email" class="form-control" id="edit_lab" name = "equipinfo.label">
						  </div>
						  <label class="control-label text-red pull-left" id = "label_label">*</label>
						</div>
						<div class="form-group">
						  <label for="inputEmail3" class="col-sm-1 control-label" id = "locLabel">所在位置：</label>
						  <div class="col-sm-3">
						    <input type="email" class="form-control" id="edit_loc"  name = "equipinfo.location">
						  </div>
						  <label class="control-label text-red pull-left" id = "loc_label">*</label>
						</div>
						<div class="form-group">
						  <label for="inputEmail3" class="col-sm-1 control-label">有效期：</label>
						  <div class="col-sm-3">
						  <div class="input-group date">
						  	<div class="input-group-addon">
			                  <i class="fa fa-calendar"></i>
			                </div>
						    <input type="text" class="form-control pull-right" id="datepicker"  name = "exp_date" data-inputmask="'alias': 'yyyy-mm-dd'" data-mask>
						  </div>
						  </div>
						  <label class="control-label text-red pull-left" id = "datepicker_label">*</label>
						</div>
						<div class="form-group">
						  <label for="inputEmail3" class="col-sm-1 control-label">责任部门：</label>
						  <div class="col-sm-3">
						    <input type="email" class="form-control" id="edit_res_dep"  name = "equipinfo.responsible_dep">
						  </div>
						  <label class="control-label text-red pull-left" id = "res_dep_label">*</label>
						</div>
						<div class="form-group">
						  <label for="inputEmail3" class="col-sm-1 control-label">责任人：</label>
						  <div class="col-sm-3">
						    <input type="email" class="form-control" id="edit_res_per"  name = "equipinfo.responsible_person">
						  </div>
						  <label class="control-label text-red pull-left" id = "res_per_label">*</label>
						</div>
						<div class="form-group">
						  <label for="inputEmail3" class="col-sm-1 control-label">负责办理人：</label>
						  <div class="col-sm-3">
						    <input type="email" class="form-control" id="edit_person"  name = "equipinfo.person_pic">
						  </div>
						  <label class="control-label text-red pull-left" id = "person_label">*</label>
						</div>
						<div class="form-group">
						  <label for="inputEmail3" class="col-sm-1 control-label">备注：</label>
						  <div class="col-sm-3">
						    <input type="email" class="form-control" id="edit_note"  name = "equipinfo.note">
						  </div>
						  <label class="control-label text-red pull-left" id = "note_label"></label>
						</div>
				      <div class="form-group">
				        <div class="col-sm-offset-1 col-sm-3">
				          <button type="button" class="btn btn-danger" onclick = "javascript:addItem()" id = "addBtn">添加设备</button>
				        </div>
				      </div>
					<!-- /.box-footer -->
					</form>
			</div>
		</div>
		  </div>
		</div>
	</div>
			
    </section>
    <!-- /.content -->
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
	        <button type="button" class="btn btn-primary" onclick = "javascript: $('#modal-default').hide();">确认</button>
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
<script src="<%=basePath%>js/moment.min.js"></script>
<script src="<%=basePath%>plugins/daterangepicker/daterangepicker.js"></script>
<!-- Select2 -->
<script src="<%=basePath%>plugins/select2/select2.full.min.js"></script>
<!-- AdminLTE for demo purposes
<script src="<%=basePath%>dist/js/demo.js" type="text/javascript"></script> -->
<!-- page script -->
<script>
  $(function () {
	  
	$(".select2").select2();
    //Datemask yyyy-mm-dd
    $("#datemask").inputmask("yyyy-mm-dd", {"placeholder": "yyyy-mm-dd"});
    //Money Euro
    $("[data-mask]").inputmask();
    
  });
  
function addItem(){
	var submitflag = true;
	$("#dep_label").text("*");
	$("#spe_label").text("*");
	$("#label_label").text("*");
	$("#loc_label").text("*");
	$("#datepicker_label").text("*");
	$("#res_dep_label").text("*");
	$("#res_per_label").text("*");
	$("#person_label").text("*");
	$("#note_label").text("");
	
	var itemType = $("#etype").val();
	var area = $("#area").val();
	var type = $("#type").val();
	var dep = $("#edit_dep").val();
	var name = $("#edit_pian").val();
	var spe = $("#edit_spe").val();
	var label = $("#edit_lab").val();
	var loc = $("#edit_loc").val();
	var exp_date = $("#datepicker").val();
	var res_dep = $("#edit_res_dep").val();
	var res_per = $("#edit_res_per").val();
	var person = $("#edit_person").val();
	var note = $("#edit_note").val();
	
	if(dep.length<1){
		submitflag = false;
		$("#dep_label").text("* 部门不能为空！");
	}
	if(spe.length<1){
		submitflag = false;
		$("#spe_label").text("* 规格不能为空！");
	}
	if(label.length<1){
		$("#label_label").text("* 设备标号不能为空！");
	}
	if(loc.length<1){
		submitflag = false;
		$("#loc_label").text("* 所在位置不能为空！");
	}
	if(!dateIsValid(exp_date)){
		submitflag = false;
		$("#datepicker_label").text("* 日期格式不正确！");
	}
	if(res_dep.length<1){
		submitflag = false;
		$("#res_dep_label").text("* 责任部门不能为空！");
	}
	if(res_per.length<1){
		submitflag = false;
		$("#res_per_label").text("* 责任人不能为空！");
	}
	if(person.length<1){
		submitflag = false;
		$("#person_label").text("* 负责办理人不能为空！");
	}
	if(!submitflag) return;
	if(itemType==0){
		$.getJSON({url:'<%=basePath%>equipapi/addapi.do',
			type:"post",
			data:{
				"type":type,
				"equipinfo.area":area,
				"equipinfo.department":dep,
				"equipinfo.specification":spe,
				"equipinfo.label":label,
				"equipinfo.location":loc,
				"equipinfo.exp_date":exp_date,
				"equipinfo.responsible_dep":res_dep,
				"equipinfo.responsible_person":res_per,
				"equipinfo.person_pic":person,
				"equipinfo.note":note
			},
			success:function(data){
				$("#modal_title_text").text("提示信息");
				if(data.status>0){
					$("#modal_info_text").text("信息添加成功！");
				}else{
					$("#modal_info_text").text("信息添加失败，请检查信息填写是否有误！");
				}
				$("#modal-default").show();
			}
		});
	}else if(itemType==1){
		if(name.length<1){
			submitflag = false;
			$("#pian_label").text("* 片区内容不能为空！");
			return;
		}
		$.getJSON({url:'<%=basePath%>certifapi/addapi.do',
			type:"post",
			data:{
				"type":type,
				"certifyinfo.area":area,
				"certifyinfo.department":dep,
				"certifyinfo.specification":spe,
				"certifyinfo.name":name,
				"certifyinfo.label":label,
				"certifyinfo.location":loc,
				"certifyinfo.exp_date":exp_date,
				"certifyinfo.responsible_dep":res_dep,
				"certifyinfo.responsible_person":res_per,
				"certifyinfo.person_pic":person,
				"certifyinfo.note":note
			},
			success:function(data){
				$("#modal_title_text").text("提示信息");
				if(data.status>0){
					$("#modal_info_text").text("信息添加成功！");
				}else{
					$("#modal_info_text").text("信息添加失败，请检查信息填写是否有误！");
				}
				$("#modal-default").show();
			}
		});
	}else{
		alert("[up]系统错误！请联系管理员！");
	}
	
	
};

function dateIsValid(str){
    var  reg  =  /^(\d{4})-(\d{2})-(\d{2})$/;    
    var  r  =  str.match(reg);    
    if(r==null)return  false;    
    r[2]=r[2]-1;    
    var  d=  new  Date(r[1],  r[2],r[3]);    
    if(d.getFullYear()!=r[1])return  false;    
    if(d.getMonth()!=r[2])return  false;    
    if(d.getDate()!=r[3])return  false;    
    return  true; 
};

function etypePickChange(){
	var selectedValue = $("select[id=etype]").val();
	if(selectedValue==0){
		var flag = true;
		var flag2 = true;
		$("#typeLabel").text("设备种类：");
		$("#locLabel").text("所在位置：");
		$("#editLabel").text("设备标号：");
		$("#addBtn").text("添加设备");
		$("#pianDiv").hide();
		$("select[id=area] option").each(function(){
			   if($(this).val() >= 10){
				   $(this).hide();
			   }else{
				   $(this).show();
				   if(flag){
				   	$(this)[0].selected = true;
				   	flag = false;
				   }
			   }
			  });
		$("select[id=type] option").each(function(){
			   if($(this).text().indexOf("(证书)") >= 0){
				   $(this).hide();
			   }else{
				   $(this).show();
				   if(flag2){
				   	$(this)[0].selected = true;
				   	flag2 = false;
				   }
			   }
			  });
	}else if(selectedValue==1){
		var flag = true;
		var flag2 = true;
		$("#pianDiv").show();
		$("#typeLabel").text("证书种类：");
		$("#locLabel").text("存放位置：");
		$("#editLabel").text("证书规格：");
		$("#addBtn").text("添加证书");
		$("select[id=area] option").each(function(){
			   if($(this).val() < 10){
				   $(this).hide();
			   }else{
				   $(this).show();
				   if(flag){
				   	$(this)[0].selected = true;
				   	flag = false;
				   }
			   }
			  });
		$("select[id=type] option").each(function(){
			   if($(this).text().indexOf("(设备)") >= 0){
				   $(this).hide();
			   }else{
				   $(this).show();
				   if(flag2){
					   	$(this)[0].selected = true;
					   	flag2 = false;
					   }
			   }
			  });
	}else{
		alert("[oneUp]系统错误！");
	}
};
</script>
</body>
</html>

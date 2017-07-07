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
        <small>到期${etype==0?"设备":"证书" }一览表</small>
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
		<div class="callout callout-info">
		  <h4>小贴士!</h4>
		  <p>红色代表此${etype==0?"设备":"证书" }即将到期！</p>
		</div>

	    <div class="row">
	      <div class="col-xs-12">
	      
	        <div class="box box-solid box-info">
	          <div class="box-header">
	            <h3 class="box-title">到期${etype==0?"设备":"证书" }一览表</h3>
	          </div>
	          <!-- /.box-header -->
	          <div class="box-body">
	            <table id="table2017" class="table table-bordered table-striped">
	              <thead>
	                <tr>
	                  <th>地区</th>
	                  ${etype==0?"":"<th>片区</th>"}
	                  <th>部门</th>
	                  <th>类型</th>
	                  <th>${etype==0?"规格":"证号"}</th>
	                  <th>${etype==0?"设备标号":"规格"}</th>
	                  <th>所在位置</th>
	                  <th>有效期</th>
	                  <th>责任部门</th>
	                  <th>责任人(电话)</th>
	                  <th>负责办理人(电话)</th>
	                  <th>备注</th>
	                  <th>操作</th>
	                </tr>
	              </thead>
	              <tbody id = "tableBody">
	              <s:if test="etype == 0"><!-- 设备 -->
	                <s:iterator value="equipLs" id="equipLs">
	                <tr>
	                	<s:if test="#equipLs.status <= 30">
					    <td class = "text-red"><b><s:property value="#equipLs.area"/></b></td>
	                	<td class = "text-red"><b><s:property value="#equipLs.department"/></b></td>
	                	<!--<td class = "text-red"><b><s:property value="#equipLs.roomId"/></b></td>-->
	                	<td class = "text-red"><b><s:property value="#equipLs.typeName"/></b></td>
	                	<td class = "text-red"><b><s:property value="#equipLs.specification"/></b></td>
	                	<td class = "text-red"><b><s:property value="#equipLs.label"/></b></td>
	                	<td class = "text-red"><b><s:property value="#equipLs.location"/></b></td>
	                	<td class = "text-red"><b><s:date name="#equipLs.exp_date" format ="yyyy-MM-dd"/></b></td>
	                	<td class = "text-red"><b><s:property value="#equipLs.responsible_dep"/></b></td>
	                	<td class = "text-red"><b><s:property value="#equipLs.responsible_person"/></b></td>
	                	<td class = "text-red"><b><s:property value="#equipLs.person_pic"/></b></td>
	                	<td class = "text-red"><b><s:property value="#equipLs.note"/><small class="label pull-right bg-red">30</small></b></td>
	                	<td><button type = 'button' class = 'btn btn-info' data-toggle='modal' data-target='#modal-info' style = 'padding:1px 3px' onclick = 'editRow(<s:property value="#equipLs.id"/>,0)'><i class = 'fa fa-edit'></i></button>&nbsp;<button type = 'button' class = 'btn btn-info'  style = 'padding:1px 3px' onclick = 'deleteRow(<s:property value="#equipLs.id"/>,0)' ><i class = 'fa  fa-trash'></i></button></td>
	                	</s:if>
	                	
	                	<s:elseif test="#equipLs.status > 30 && #equipLs.status <= 90 ">
	                	<s:if test="#equipLs.status <= 60">
					    <td class = "text-orange"><b><s:property value="#equipLs.area"/></b></td>
	                	<td class = "text-orange"><b><s:property value="#equipLs.department"/></b></td>
	                	<!--<td class = "text-orange"><b><s:property value="#equipLs.roomId"/></b></td>-->
	                	<td class = "text-orange"><b><s:property value="#equipLs.typeName"/></b></td>
	                	<td class = "text-orange"><b><s:property value="#equipLs.specification"/></b></td>
	                	<td class = "text-orange"><b><s:property value="#equipLs.label"/></b></td>
	                	<td class = "text-orange"><b><s:property value="#equipLs.location"/></b></td>
	                	<td class = "text-orange"><b><s:date name="#equipLs.exp_date" format ="yyyy-MM-dd"/></b></td>
	                	<td class = "text-orange"><b><s:property value="#equipLs.responsible_dep"/></b></td>
	                	<td class = "text-orange"><b><s:property value="#equipLs.responsible_person"/></b></td>
	                	<td class = "text-orange"><b><s:property value="#equipLs.person_pic"/></b></td>
	                	<td class = "text-orange"><b><s:property value="#equipLs.note"/><small class="label pull-right bg-orange">60</small></b></td>
	                	<td><button type = 'button' class = 'btn btn-info' data-toggle='modal' data-target='#modal-info' style = 'padding:1px 3px' onclick = 'editRow(<s:property value="#equipLs.id"/>,0)'><i class = 'fa fa-edit'></i></button>&nbsp;<button type = 'button' class = 'btn btn-info'  style = 'padding:1px 3px' onclick = 'deleteRow(<s:property value="#equipLs.id"/>,0)' ><i class = 'fa  fa-trash'></i></button></td>
	                	</s:if>
	                	<s:else>
					    <td class = "text-light-blue"><b><s:property value="#equipLs.area"/></b></td>
	                	<td class = "text-light-blue"><b><s:property value="#equipLs.department"/></b></td>
	                	<!--<td class = "text-light-blue"><b><s:property value="#equipLs.roomId"/></b></td>-->
	                	<td class = "text-light-blue"><b><s:property value="#equipLs.typeName"/></b></td>
	                	<td class = "text-light-blue"><b><s:property value="#equipLs.specification"/></b></td>
	                	<td class = "text-light-blue"><b><s:property value="#equipLs.label"/></b></td>
	                	<td class = "text-light-blue"><b><s:property value="#equipLs.location"/></b></td>
	                	<td class = "text-light-blue"><b><s:date name="#equipLs.exp_date" format ="yyyy-MM-dd"/></b></td>
	                	<td class = "text-light-blue"><b><s:property value="#equipLs.responsible_dep"/></b></td>
	                	<td class = "text-light-blue"><b><s:property value="#equipLs.responsible_person"/></b></td>
	                	<td class = "text-light-blue"><b><s:property value="#equipLs.person_pic"/></b></td>
	                	<td class = "text-light-blue"><b><s:property value="#equipLs.note"/><small class="label pull-right bg-light-blue">90</small></b></td>
	                	<td><button type = 'button' class = 'btn btn-info' data-toggle='modal' data-target='#modal-info' style = 'padding:1px 3px' onclick = 'editRow(<s:property value="#equipLs.id"/>,0)'><i class = 'fa fa-edit'></i></button>&nbsp;<button type = 'button' class = 'btn btn-info'  style = 'padding:1px 3px' onclick = 'deleteRow(<s:property value="#equipLs.id"/>,0)' ><i class = 'fa  fa-trash'></i></button></td>
	                	</s:else>
	                	</s:elseif>
	                	
	                	<s:else>
					    <td><b><s:property value="#equipLs.area"/></b></td>
	                	<td><b><s:property value="#equipLs.department"/></b></td>
	                	<!--<td><b><s:property value="#equipLs.roomId"/></b></td>-->
	                	<td><b><s:property value="#equipLs.typeName"/></b></td>
	                	<td><b><s:property value="#equipLs.specification"/></b></td>
	                	<td><b><s:property value="#equipLs.label"/></b></td>
	                	<td><b><s:property value="#equipLs.location"/></b></td>
	                	<td><b><s:date name="#equipLs.exp_date" format ="yyyy-MM-dd"/></b></td>
	                	<td><b><s:property value="#equipLs.responsible_dep"/></b></td>
	                	<td><b><s:property value="#equipLs.responsible_person"/></b></td>
	                	<td><b><s:property value="#equipLs.person_pic"/></b></td>
	                	<td><b><s:property value="#equipLs.status"/></b></td>
	                	<td><button type = 'button' class = 'btn btn-info' data-toggle='modal' data-target='#modal-info' style = 'padding:1px 3px' onclick = 'editRow(<s:property value="#equipLs.id"/>,0)'><i class = 'fa fa-edit'></i></button>&nbsp;<button type = 'button' class = 'btn btn-info'  style = 'padding:1px 3px' onclick = 'deleteRow(<s:property value="#equipLs.id"/>,0)' ><i class = 'fa  fa-trash'></i></button></td>
	                	</s:else>
					</tr>
					</s:iterator>
					</s:if>
					
					<s:if test="etype == 1"><!-- 证书 -->
	                <s:iterator value="certifLs" id="certifLs">
	                <tr>
	                	<s:if test="#certifLs.status <= 30">
					    <td class = "text-red"><b><s:property value="#certifLs.area"/></b></td>
	                	<td class = "text-red"><b><s:property value="#certifLs.department"/></b></td>
	                	<td class = "text-red"><b><s:property value="#certifLs.name"/></b></td>
	                	<td class = "text-red"><b><s:property value="#certifLs.typeName"/></b></td>
	                	<td class = "text-red"><b><s:property value="#certifLs.specification"/></b></td>
	                	<td class = "text-red"><b><s:property value="#certifLs.label"/></b></td>
	                	<td class = "text-red"><b><s:property value="#certifLs.location"/></b></td>
	                	<td class = "text-red"><b><s:date name="#certifLs.exp_date" format ="yyyy-MM-dd"/></b></td>
	                	<td class = "text-red"><b><s:property value="#certifLs.responsible_dep"/></b></td>
	                	<td class = "text-red"><b><s:property value="#certifLs.responsible_person"/></b></td>
	                	<td class = "text-red"><b><s:property value="#certifLs.person_pic"/></b></td>
	                	<td class = "text-red"><b><s:property value="#certifLs.note"/><small class="label pull-right bg-red">30</small></b></td>
	                	<td><button type = 'button' class = 'btn btn-info' data-toggle='modal' data-target='#modal-info' style = 'padding:1px 3px' onclick = 'editRow(<s:property value="#certifLs.id"/>,1)'><i class = 'fa fa-edit'></i></button>&nbsp;<button type = 'button' class = 'btn btn-info'  style = 'padding:1px 3px' onclick = 'deleteRow(<s:property value="#certifLs.id"/>,1)' ><i class = 'fa  fa-trash'></i></button></td>
	                	</s:if>
	                	
	                	<s:elseif test="#certifLs.status > 30 && #certifLs.status <= 90">
	                	<s:if test="#certifLs.status <= 60">
					    <td class = "text-orange"><b><s:property value="#certifLs.area"/></b></td>
	                	<td class = "text-orange"><b><s:property value="#certifLs.department"/></b></td>
	                	<td class = "text-orange"><b><s:property value="#certifLs.name"/></b></td>
	                	<td class = "text-orange"><b><s:property value="#certifLs.typeName"/></b></td>
	                	<td class = "text-orange"><b><s:property value="#certifLs.specification"/></b></td>
	                	<td class = "text-orange"><b><s:property value="#certifLs.label"/></b></td>
	                	<td class = "text-orange"><b><s:property value="#certifLs.location"/></b></td>
	                	<td class = "text-orange"><b><s:date name="#certifLs.exp_date" format ="yyyy-MM-dd"/></b></td>
	                	<td class = "text-orange"><b><s:property value="#certifLs.responsible_dep"/></b></td>
	                	<td class = "text-orange"><b><s:property value="#certifLs.responsible_person"/></b></td>
	                	<td class = "text-orange"><b><s:property value="#certifLs.person_pic"/></b></td>
	                	<td class = "text-orange"><b><s:property value="#certifLs.note"/><small class="label pull-right bg-orange">60</small></b></td>
	                	<td><button type = 'button' class = 'btn btn-info' data-toggle='modal' data-target='#modal-info' style = 'padding:1px 3px' onclick = 'editRow(<s:property value="#certifLs.id"/>,1)'><i class = 'fa fa-edit'></i></button>&nbsp;<button type = 'button' class = 'btn btn-info'  style = 'padding:1px 3px' onclick = 'deleteRow(<s:property value="#certifLs.id"/>,1)' ><i class = 'fa  fa-trash'></i></button></td>
	                	</s:if>
	                	<s:else>
					    <td class = "text-light-blue"><b><s:property value="#certifLs.area"/></b></td>
	                	<td class = "text-light-blue"><b><s:property value="#certifLs.department"/></b></td>
	                	<td class = "text-light-blue"><b><s:property value="#certifLs.name"/></b></td>
	                	<td class = "text-light-blue"><b><s:property value="#certifLs.typeName"/></b></td>
	                	<td class = "text-light-blue"><b><s:property value="#certifLs.specification"/></b></td>
	                	<td class = "text-light-blue"><b><s:property value="#certifLs.label"/></b></td>
	                	<td class = "text-light-blue"><b><s:property value="#certifLs.location"/></b></td>
	                	<td class = "text-light-blue"><b><s:date name="#certifLs.exp_date" format ="yyyy-MM-dd"/></b></td>
	                	<td class = "text-light-blue"><b><s:property value="#certifLs.responsible_dep"/></b></td>
	                	<td class = "text-light-blue"><b><s:property value="#certifLs.responsible_person"/></b></td>
	                	<td class = "text-light-blue"><b><s:property value="#certifLs.person_pic"/></b></td>
	                	<td class = "text-light-blue"><b><s:property value="#certifLs.note"/><small class="label pull-right bg-light-blue">90</small></b></td>
	                	<td><button type = 'button' class = 'btn btn-info' data-toggle='modal' data-target='#modal-info' style = 'padding:1px 3px' onclick = 'editRow(<s:property value="#certifLs.id"/>,1)'><i class = 'fa fa-edit'></i></button>&nbsp;<button type = 'button' class = 'btn btn-info'  style = 'padding:1px 3px' onclick = 'deleteRow(<s:property value="#certifLs.id"/>,1)' ><i class = 'fa  fa-trash'></i></button></td>
	                	</s:else>
	                	</s:elseif>
	                	
	                	<s:else>
					    <td><b><s:property value="#certifLs.area"/></b></td>
	                	<td><b><s:property value="#certifLs.department"/></b></td>
	                	<td><b><s:property value="#certifLs.name"/></b></td>
	                	<td><b><s:property value="#certifLs.typeName"/></b></td>
	                	<td><b><s:property value="#certifLs.specification"/></b></td>
	                	<td><b><s:property value="#certifLs.label"/></b></td>
	                	<td><b><s:property value="#certifLs.location"/></b></td>
	                	<td><b><s:date name="#certifLs.exp_date" format ="yyyy-MM-dd"/></b></td>
	                	<td><b><s:property value="#certifLs.responsible_dep"/></b></td>
	                	<td><b><s:property value="#certifLs.responsible_person"/></b></td>
	                	<td><b><s:property value="#certifLs.person_pic"/></b></td>
	                	<td><b><s:property value="#certifLs.note"/></b></td>
	                	<td><button type = 'button' class = 'btn btn-info' data-toggle='modal' data-target='#modal-info' style = 'padding:1px 3px' onclick = 'editRow(<s:property value="#certifLs.id"/>,1)'><i class = 'fa fa-edit'></i></button>&nbsp;<button type = 'button' class = 'btn btn-info'  style = 'padding:1px 3px' onclick = 'deleteRow(<s:property value="#certifLs.id"/>,1)' ><i class = 'fa  fa-trash'></i></button></td>
	                	</s:else>
					</tr>
					</s:iterator>
					</s:if>
					
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
$(function () {
	  
	$(".select2").select2();
    $('#table2017').DataTable({
        "paging": true,
        "lengthChange": false,
        "searching": false,
        "ordering": false,
        "info": true,
        "autoWidth": false,
        "iDisplayLength":50,
        "sLoadingRecords" : "载入中...",
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

//Date picker
$('#datepicker').datepicker({
  format: 'yyyy-mm-dd',
  autoclose: true
});

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
			$("#modal_info_text").text("删除成功，刷新显示最新数据！");
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
			$("#modal_info_text").text("删除成功，刷新显示最新数据！");
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

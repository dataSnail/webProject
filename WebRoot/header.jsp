<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!-- Left side column. contains the logo and sidebar -->
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
            <a href="javascript:modifyPassword(0);" class="dropdown-toggle">
              <img src="<%=basePath%>dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
              <span class="hidden-xs">修改密码</span>
            </a>
          </li>
          <li class="dropdown user user-menu">
            <a href="<%=basePath%>userLogout.do?userName=<s:property value = '#session.username'/>" class="dropdown-toggle">
              <span class="hidden-xs">退出</span>
            </a>
          </li>
        </ul>
      </div>
    </nav>
  </header>
  
  
	<div class="modal modal-info fade in" id="modal_password" style="display: none; padding-right: 17px;">
		<div class="modal-dialog" style = "margin-top:10%">
			<div class="modal-content" style="width: 500px;">
				<div class="box box-solid box-info">
					<div class="box-header">
		            <h3 class="box-title">修改密码</h3>
		            <button type="button" class="close" onclick ="javascript: $('#modal_password').hide();" data-dismiss="modal" aria-label="Close">
                  	<span aria-hidden="true">×</span></button>
		          	</div>
					<!-- form start -->
					<form class="form-horizontal" id = "editForm" action = "" method = "POST">
						<div class="box-body">

							<div class="form-group">
							  <label for="inputEmail3" class="col-sm-3 control-label">用户名</label>
							  <div class="col-sm-6">
							    <input type="email" class="form-control" id="password_username" name = "userinfo.username" value = "<s:property value = '#session.username'/>" disabled>
							  </div>
							  <label class="text-red pull-left" id = "password_username_label"></label>
							</div>
							<div class="form-group">
							  <label for="inputEmail3" class="col-sm-3 control-label" id = "edit_label_label">原密码</label>
							  <div class="col-sm-6">
							    <input type="password" class="form-control" id="password_origin" name = "userinfo.password">
							  </div>
							  <label class="text-red pull-left" id = "password_label"></label>
							</div>
							<div class="form-group">
							  <label for="inputEmail3" class="col-sm-3 control-label" id = "edit_label_label">新密码</label>
							  <div class="col-sm-6">
							    <input type="password" class="form-control" id="password_new1" name = "newpassword">
							  </div>
							  <label class="text-red pull-left" id = "password_label1"></label>
							</div>
							<div class="form-group">
							  <label for="inputEmail3" class="col-sm-3 control-label" id = "edit_label_label">确认密码</label>
							  <div class="col-sm-6">
							    <input type="password" class="form-control" id="password_new2" name = "newpassword">
							  </div>
							  <label class="text-red pull-left" id = "password_label2" ></label>
							</div>
						</div>
						  <!-- /.box-body -->
						<div class="box-footer">
						  <button type="button" class="btn btn-default" onclick ="javascript: $('#modal_password').hide();">取消</button>
						  <button type="button" class="btn btn-info pull-right" onclick = "modifyPassword(1);">确认修改</button>
						  <label class="text-red pull-right" id = "password_result"></label>
						</div>
					<!-- /.box-footer -->
					</form>
				</div>
			  </div>
			  <!-- /.modal-content -->
		</div>
	</div>

<script type="text/javascript">
<!--
function modifyPassword(type){
	var result = true;
	$("#password_label").text("");
	$("#password_label1").text("");
	$("#password_label2").text("");
	if(type==0){//显示修改页面
		$("#modal_password").show();
	}else if(type==1){//确认修改
		var username = $("#password_username").val();
		var password = $("#password_origin").val();
		var password1 = $("#password_new1").val();
		var password2 = $("#password_new2").val();
		if(password.length<1){
			result = false;
			$("#password_label").text("密码为空！");
			return;
		}
		if(password1.length<6){
			result = false;
			$("#password_label1").text("密码需大于6位！");
			return;
		}
		if(password1!=password2){
			result = false;
			$("#password_label1").text("密码不一致！");
			$("#password_label2").text("密码不一致！");
			return;
		}
		if(password==password1){
			result = false;
			$("#password_label1").text("与原密码相同！");
			$("#password_label2").text("与原密码相同！");
			return;
		}
		
		if(result){
			$.getJSON({
				url:"<%=basePath%>userapi/updateapi.do",
				type:"post",
				data:{"userinfo.username":username,
					"userinfo.password":password,
					"newpassword":password1
				},
				success:function(data){
					if (data.status>0){
						$("#password_result").text("修改成功！请重新登录！");
						location.href="<%=basePath%>login.jsp";
					}else if(data.status==-2){
						$("#password_result").text("原密码错误！");
					}else{
						$("#password_result").text("修改失败！");
					}
				}
				
			});	
		}
	}
}
//-->
</script>
  
  
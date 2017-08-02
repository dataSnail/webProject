<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
  <!-- sidebar: style can be found in sidebar.less -->
  <section class="sidebar">
    <!-- Sidebar user panel -->
    <div class="user-panel">
      <div class="pull-left image">
        <img src="<%=basePath%>/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
      </div>
      <div class="pull-left info">
        <p>管理员</p>
        <p><s:property value = '#session.username'/></p>
      </div>
    </div>
    <!-- sidebar menu: : style can be found in sidebar.less -->
    <ul class="sidebar-menu">
      <li class="header">主菜单</li>
      <s:set name="lasttype" value= "-1" />
      <s:set name="lastarea" value= "-1" />
      <s:set name="typeend" value='0'/>
      <s:set name="areaend" value='0'/>
      <!-- 设备 证书 head -->
	<s:iterator value="#session.catalog" id="catalog">
	
		<s:if test="#lasttype != #catalog.types_id ">
			<s:if test="#typeend == 1"><%out.print("</ul></li></ul></li>"); %></s:if>
			<li class="treeview ${type!= '' && type==catalog.types_id?'active':'' }">
				<a href="#">
					<i class="fa fa-tasks"></i> <span>${catalog.types}管理</span>
					<span class="pull-right-container">
					<i class="fa fa-angle-left pull-right"></i>
					</span>
				</a>
		    <s:set name="typeend" value= "1" />
		    <%out.print("<ul class=\"treeview-menu\">"); %>
		</s:if>
		
		<s:if test="#lastarea != #catalog.area_id">
			<s:if test="#areaend == 1">
				<s:if test="#lasttype == #catalog.types_id "><%out.print("</ul></li>"); %></s:if>
			</s:if>
			<li class = "${areaid==catalog.area_id?'active':'' }"><a><i class="fa fa-circle-o"></i><s:property value="#catalog.area"/></a>
			<s:set name="areaend" value= "1" />
			<%out.print("<ul class=\"treeview-menu\">"); %>
		</s:if>
		
		<s:if test="#catalog.types_id == 0">
			<li class = "${areaid==catalog.area_id && equipType==catalog.types_type_id?'active':'' }"><a href="<%=basePath%>equip/query.do?areaid=${catalog.area_id}&equipType=${catalog.types_type_id}&type=${catalog.types_id}"><i class="fa fa-circle-o"></i><s:property value="#catalog.types_type"/></a></li>
		</s:if>
		<s:if test="#catalog.types_id == 1">
			<li class = "${areaid==catalog.area_id && certifType==catalog.types_type_id?'active':'' }"><a href="<%=basePath%>certif/query.do?areaid=${catalog.area_id}&certifType=${catalog.types_type_id}&type=${catalog.types_id}"><i class="fa fa-circle-o"></i><s:property value="#catalog.types_type"/></a></li>
		</s:if>
		<s:set name="lasttype" value= "#catalog.types_id" />
		<s:set name="lastarea" value= "#catalog.area_id" />
	</s:iterator>
	<%out.print("</ul></li></ul></li>"); %>
      <li class = "treeview ${type==2?'active':'' }">
        <a href="#">
          <i class="fa fa-calendar-times-o"></i> <span>到期设备证书</span>
          <span class="pull-right-container">
            <i class="fa fa-angle-left pull-right"></i>
          </span>
        </a>
        <ul class="treeview-menu">
          <li class="${timeType==0&&etype == 0?'active':'' }"><a href="<%=basePath%>outdate/query.do?etype=0&timeType=0&type=2"><i class="fa fa-circle-o"></i>30天内到期设备</a></li>
          <li class="${timeType==1&&etype == 0?'active':'' }"><a href="<%=basePath%>outdate/query.do?etype=0&timeType=1&type=2"><i class="fa fa-circle-o"></i>60天内到期设备</a></li>
          <li class="${timeType==2&&etype == 0?'active':'' }"><a href="<%=basePath%>outdate/query.do?etype=0&timeType=2&type=2"><i class="fa fa-circle-o"></i>90天内到期设备</a></li>
          <li class="${timeType==0&&etype == 1?'active':'' }"><a href="<%=basePath%>outdate/query.do?etype=1&timeType=0&type=2"><i class="fa fa-certificate"></i>30天内到期证书</a></li>
          <li class="${timeType==1&&etype == 1?'active':'' }"><a href="<%=basePath%>outdate/query.do?etype=1&timeType=1&type=2"><i class="fa fa-certificate"></i>60天内到期证书</a></li>
          <li class="${timeType==2&&etype == 1?'active':'' }"><a href="<%=basePath%>outdate/query.do?etype=1&timeType=2&type=2"><i class="fa fa-certificate"></i>90天内到期证书</a></li>
        </ul>
      </li>
      <li class="${type==3?'active':'' }">
        <a href="<%=basePath%>qinfo/query.do?type=3">
          <i class="fa fa-calendar-check-o"></i> <span>设备证书查询</span>
        </a>        
      </li>
      <li class="${type==4?'active':'' }">
        <a href="<%=basePath%>up/uploadfile.do?type=4">
          <i class="fa fa-cloud-upload"></i> <span>数据导入</span>
        </a>
      </li>
      <li class="${type==5?'active':'' }">
        <a href="<%=basePath%>user/userInfo.do?type=5">
          <i class="fa fa-user"></i> <span>用户管理</span>
        </a>
      </li>
      <li class="${type==6?'active':'' }">
        <a href="<%=basePath%>qinfo/special.do?type=6">
          <i class="fa fa-calendar-o"></i> <span>特殊设备证书信息</span>
        </a>
      </li>
      <li class="${type==7?'active':'' }">
        <a href="<%=basePath%>qinfo/sta.do?type=7">
          <i class="fa fa-pie-chart"></i> <span>统计信息</span>
        </a>
      </li>
    </ul>
  </section>
  <!-- /.sidebar -->
</aside>
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
      <li class="treeview ${equipType>=0?'active':'' }">
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
      <li class = "treeview ${timeType>=0?'active':'' }">
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
      <li>
        <a href="<%=basePath%>user/userInfo.do">
          <i class="fa fa-user"></i> <span>用户管理</span>
        </a>
      </li>

    </ul>
  </section>
  <!-- /.sidebar -->
</aside>
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
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>数据分析平台</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="<%=basePath %>bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<%=basePath%>dist/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="<%=basePath%>dist/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=basePath %>dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="<%=basePath %>dist/css/skins/_all-skins.min.css">
  <!-- DATA TABLES -->
  <link href="<%=basePath%>plugins/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition skin-blue sidebar-mini">
<!-- Site wrapper -->
<div class="wrapper">
	<jsp:include page="../../header.jsp"/>
  <!-- =============================================== -->
<jsp:include page="../../sider.jsp"/>
  <!-- Left side column. contains the sidebar -->

  <!-- =============================================== -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <section class="content-header">
      <h1>
        <small>设备、证书统计信息</small>
      </h1>
    </section>
    <section class="content-header">
		<div class="callout callout-info">
		  <h4>小贴士!</h4>
		  <p>显示设备和证书的统计信息！</p>
		</div>
    </section>

    <!-- Main content -->
    <section class="content">
	    <div class="row">
	    
    	<s:set name="lasttype" value= "-1" />
    		<s:iterator value="#session.catalog" id="catalog">
					<s:if test="#lasttype != #catalog.types_id ">
						<s:if test="#catalog.types_id == 0 ">
					      <div class="col-xs-12">
					        <div class="box box-solid box-info">
					          <div class="box-header">
					            <h3 class="box-title">设备信息统计</h3>
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
					            <h3 class="box-title">证书信息统计</h3>
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
    	<div class="row">
    	<s:set name="lasttype" value= "-1" />
    		<s:iterator value="#session.catalog" id="catalog">
					<s:if test="#lasttype != #catalog.types_id ">
						<s:if test="#catalog.types_id == 0 ">
				    		<div class = "col-md-6" style = "min-width:650px">
						      <!-- Default box -->
						      <div class="box">
						        <div class="box-header with-border">
						          <h3 class="box-title"><i class="fa fa-pie-chart"></i>设备信息统计</h3>
						          <div class="box-tools pull-right">
						            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="折叠窗口"><i class="fa fa-minus"></i></button>
						            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="关闭窗口"><i class="fa fa-times"></i></button>
						          </div>
						        </div>
						        <div class="box-body">
						        	<div class = "chart">
									<div id="allmap" style="height: 530px; -webkit-tap-highlight-color: transparent; user-select: none; cursor: default; background-color: rgba(0, 0, 0, 0);"></div>
						        	</div>
						        </div>
						        <!-- /.box-body -->
						      </div>
						      <!-- /.box -->
				    		</div>
						</s:if>
						<s:if test="#catalog.types_id == 1 ">
				    		<div class = "col-md-6" style = "min-width:650px">
						      <!-- Default box -->
						      <div class="box">
						        <div class="box-header with-border">
						          <h3 class="box-title"><i class="fa fa-pie-chart"></i>证书信息统计</h3>
						          <div class="box-tools pull-right">
						            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="折叠窗口"><i class="fa fa-minus"></i></button>
						            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="关闭窗口"><i class="fa fa-times"></i></button>
						          </div>
						        </div>
						        <div class="box-body">
						        	<div class = "chart">
									<div id="piegraph" style="height: 530px; -webkit-tap-highlight-color: transparent; user-select: none; cursor: default; background-color: rgba(0, 0, 0, 0);"></div>
						        	</div>
						        </div>
						        <!-- /.box-body -->
						      </div>
						      <!-- /.box -->
				    		</div>
						</s:if>
					</s:if>
					<s:set name="lasttype" value= "#catalog.types_id" />
			</s:iterator>
    	</div>

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

</div>
<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<script src="<%=basePath %>plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="<%=basePath %>bootstrap/js/bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="<%=basePath %>plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="<%=basePath%>plugins/datatables/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="<%=basePath%>plugins/datatables/dataTables.bootstrap.min.js" type="text/javascript"></script>
<!-- FastClick -->
<script src="<%=basePath %>plugins/fastclick/fastclick.js"></script>
<!-- Echarts -->
<script src="<%=basePath %>plugins/echarts/echarts.js"></script>
<!-- AdminLTE App -->
<script src="<%=basePath %>dist/js/app.min.js"></script>

<script type="text/javascript">
var equipChart;
if(document.getElementById('allmap')){
	equipChart= echarts.init(document.getElementById('allmap'));
}
var certifyChart;
if(document.getElementById('piegraph')){
	certifyChart= echarts.init(document.getElementById('piegraph'));
}
var urlstr = "<%=basePath %>api/statistic.do";
//if(dataTable)dataTable.destroy();
//alert(data.areas[0].压力变送器);
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
	        "columns":[
                {
                	"data":"area",
                	"title":"地区",
                	"render":function(data){return "<b>"+data+"</b>";}
               	},{"data":"灭火器","title":"灭火器","render":function(data){if(data>0)return "<b>"+data+"</b>";else return 0;}},
               	{"data":"质量流量计","title":"质量流量计","render":function(data){if(data>0)return "<b>"+data+"</b>";else return 0;}},
               	{"data":"安全阀","title":"安全阀","render":function(data){if(data>0)return "<b>"+data+"</b>";else return 0;}},
               	{"data":"压力表","title":"压力表","render":function(data){if(data>0)return "<b>"+data+"</b>";else return 0;}},
               	{"data":"可燃气体报警仪","title":"可燃气体报警仪","render":function(data){if(data>0)return "<b>"+data+"</b>";else return 0;}},
               	{"data":"车辆","title":"车辆","render":function(data){if(data>0)return "<b>"+data+"</b>";else return 0;}},
               	{"data":"手持可燃气体报警器","title":"手持可燃气体报警器","render":function(data){if(data>0)return "<b>"+data+"</b>";else return 0;}},
               	{"data":"防雷防静电接地电阻","title":"防雷防静电接地电阻","render":function(data){if(data>0)return "<b>"+data+"</b>";else return 0;}},
               	{"data":"建筑消防设施","title":"建筑消防设施","render":function(data){if(data>0)return "<b>"+data+"</b>";else return 0;}},
               	{"data":"气瓶减压阀","title":"气瓶减压阀","render":function(data){if(data>0)return "<b>"+data+"</b>";else return 0;}},
               	{"data":"油罐","title":"油罐","render":function(data){if(data>0)return "<b>"+data+"</b>";else return 0;}},
               	{"data":"泡沫液","title":"泡沫液","render":function(data){if(data>0)return "<b>"+data+"</b>";else return 0;}},
               	{"data":"污水处理协议","title":"污水处理协议","render":function(data){if(data>0)return "<b>"+data+"</b>";else return 0;}},
               	{"data":"垃圾处理协议","title":"垃圾处理协议","render":function(data){if(data>0)return "<b>"+data+"</b>";else return 0;}},
               	{"data":"变压器","title":"变压器","render":function(data){if(data>0)return "<b>"+data+"</b>";else return 0;}},
               	{"data":"特种装备","title":"特种装备","render":function(data){if(data>0)return "<b>"+data+"</b>";else return 0;}},
               	{"data":"管线","title":"管线","render":function(data){if(data>0)return "<b>"+data+"</b>";else return 0;}},
               	{"data":"超声波测厚仪","title":"超声波测厚仪","render":function(data){if(data>0)return "<b>"+data+"</b>";else return 0;}},
               	{"data":"电工用具","title":"电工用具","render":function(data){if(data>0)return "<b>"+data+"</b>";else return 0;}},
               	{"data":"危化证","title":"危化证","render":function(data){if(data>0)return "<b>"+data+"</b>";else return 0;}},
               	{"data":"职业卫生检测","title":"职业卫生检测","render":function(data){if(data>0)return "<b>"+data+"</b>";else return 0;}},
               	{"data":"安全应急预案备案","title":"安全应急预案备案","render":function(data){if(data>0)return "<b>"+data+"</b>";else return 0;}},
               	{"data":"重大危险源备案","title":"重大危险源备案","render":function(data){if(data>0)return "<b>"+data+"</b>";else return 0;}},
               	{"data":"压力变送器","title":"压力变送器","render":function(data){if(data>0)return "<b>"+data+"</b>";else return 0;}},
               	{"data":"加气机","title":"加气机","render":function(data){if(data>0)return "<b>"+data+"</b>";else return 0;}},
               	{"data":"卸气机","title":"卸气机","render":function(data){if(data>0)return "<b>"+data+"</b>";else return 0;}},
               	{"data":"储气井","title":"储气井","render":function(data){if(data>0)return "<b>"+data+"</b>";else return 0;}},
               	{"data":"油气回收检测","title":"油气回收检测","render":function(data){if(data>0)return "<b>"+data+"</b>";else return 0;}},
               	{"data":"未知类型","title":"未知类型","render":function(data){if(data>0)return "<b>"+data+"</b>";else return 0;}}
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
urlstr = encodeURI(urlstr);
dataTable.ajax.url(urlstr).load();
//if(dataTable2)dataTable.destroy();
//alert(data.areas[0].压力变送器);
var dataTable1 = $('#tableData1').DataTable({
	        "paging": true,
	        "lengthChange": false,
	        "searching": false,
	        "ordering": true,
	        "info": true,
	        "autoWidth": false,
	        "iDisplayLength":50,
	        "retrieve": true,
	        "ajax":{
	        	"url":urlstr,
	        	"dataSrc": "data2"},
	        "sLoadingRecords" : "载入中...",
	        "columns":[
                {
                	"data":"area",
                	"title":"地区",
                	"render":function(data){return "<b>"+data+"</b>";}
               	},{"data":"危化证","title":"危化证","render":function(data){if(data>0)return "<b>"+data+"</b>";else return 0;}},
               	{"data":"油气回收检测","title":"油气回收检测","render":function(data){if(data>0)return "<b>"+data+"</b>";else return 0;}},
               	{"data":"成品油经营许可证","title":"成品油经营许可证","render":function(data){if(data>0)return "<b>"+data+"</b>";else return 0;}},
               	{"data":"从业人员健康证","title":"从业人员健康证","render":function(data){if(data>0)return "<b>"+data+"</b>";else return 0;}},
               	{"data":"食品经营许可证","title":"食品经营许可证","render":function(data){if(data>0)return "<b>"+data+"</b>";else return 0;}},
               	{"data":"烟草证","title":"烟草证","render":function(data){if(data>0)return "<b>"+data+"</b>";else return 0;}}
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
//dataTable1.ajax.url(urlstr).load();
	    
genderPie();
function genderPie(){
	$.get('<%=basePath %>api/statistic.do').done(function(data){
		if(equipChart){
		equipChart.setOption({
		    title : {
		        text: '设备信息总共'+(parseInt(data.datae[0]['value'])+parseInt(data.datae[1]['value'])+parseInt(data.datae[2]['value'])+parseInt(data.datae[3]['value']))+'项',
		        subtext: '',
		        x:'center'
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    legend: {
		        orient: 'vertical',
		        left: 'left',
		        data: [data.category[0]+"设备",data.category[1]+"设备",data.category[2]+"设备",data.category[3]+"设备"]
		    },
		    series : [
		        {
		            name: '统计信息',
		            type: 'pie',
		            radius : '55%',
		            center: ['50%', '60%'],
		            data:data.datae,
		            itemStyle: {
		                emphasis: {
		                    shadowBlur: 10,
		                    shadowOffsetX: 0,
		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
		                }
		            }
		        }
		    ]
		});
		};
		if(certifyChart){
		certifyChart.setOption({
		    title : {
		        text: '证书信息总共'+(parseInt(data.datac[0]['value'])+parseInt(data.datac[1]['value'])+parseInt(data.datac[2]['value'])+parseInt(data.datac[3]['value']))+'项',
		        subtext: '',
		        x:'center'
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    toolbox:{
			    feature:{
			    	dataView:{
			    		show : true,
			    		title : '数据视图',
		                readOnly: true,
		                lang : ['数据视图', '关闭', '刷新'],
		                optionToContent: function(opt) {
		                    var series = opt.series;
		                	alert(series[0].data[0]);
		                    var table = '<table style="width:100%;text-align:center"><tbody><tr>'
		                                 + "<td>" + series[0].data[0]+"证书" + '</td>'
		                                 + '<td>' + opt.legend + '</td>'
		                                 + '</tr>';
		                    for (var i = 0, l = series[0].data.length; i < l; i++) {
		                        table += '<tr>'
		                                 + '<td>' + series[0] + '</td>'
		                                 + '<td>' + series[1] + '</td>'
		                                 + '</tr>';
		                    }
		                    table += '</tbody></table>';
		                    return table;
		                }
			    	}
			    }
		    },
		    legend: {
		        orient: 'vertical',
		        left: 'left',
		        data: [data.category[0]+"证书",data.category[1]+"证书",data.category[2]+"证书",data.category[3]+"证书"]
		    },
		    series : [
		        {
		            name: '统计信息',
		            type: 'pie',
		            radius : '55%',
		            center: ['50%', '60%'],
		            data:data.datac,
		            itemStyle: {
		                emphasis: {
		                    shadowBlur: 10,
		                    shadowOffsetX: 0,
		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
		                }
		            }
		        }
		    ]
		});
		};
	});
};
	
</script>

</body>
</html>
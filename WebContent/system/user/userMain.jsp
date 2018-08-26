<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%	
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"
			+request.getServerName()+":"+request.getServerPort()
			+path+"/";
%>
<!DOCTYPE html>
<html>
	<base href="<%=basePath %>"/>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>H+ 后台主题UI框架 - 数据表格</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="hplus/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="hplus/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <!-- Data Tables -->
    <link href="hplus/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">

    <link href="hplus/css/animate.css" rel="stylesheet">
    <link href="hplus/css/style.css?v=4.1.0" rel="stylesheet">

    <!-- Sweet Alert -->
    <link href="hplus/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">

    <!-- Toastr style -->
    <link href="hplus/css/plugins/toastr/toastr.min.css" rel="stylesheet">

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
    	<div class="row">
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label" for="loginName">登录名</label>
                        <input type="text" id="loginName" name="loginName" value="" placeholder="请输入登录名"
                               class="form-control">
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="control-label" for="userName">姓名</label>
                        <input type="text" id="userName" name="userName" value="" placeholder="请输入姓名"
                               class="form-control">
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <div class="col-sm-5 col-sm-offset-2">
                            <button id="searchBtn" type="button" class="btn btn-primary">查 询</button>
                            <button style="display:;" id="addBtn" type="button" class="btn btn-primary"
                            onclick="addObj()" >新 增</button>
                             <button style="display:;" id="removeBtn" type="button" class="btn btn-danger"
                            onclick="removeObj()">删除    </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="table_data_tables.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="table_data_tables.html#">选项1</a>
                                </li>
                                <li><a href="table_data_tables.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">

                        <table class="table table-striped table-bordered table-hover dataTables-example">
                            <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>登录名</th>
                                    <th>真实姓名</th>
                                    <th>性别</th>
                                    <th>创建时间</th>
                                    <th>更新时间</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 全局js -->
    <script src="hplus/js/jquery.min.js?v=2.1.4"></script>
    <script src="hplus/js/bootstrap.min.js?v=3.3.6"></script>

    <!-- Data Tables -->
    <script src="hplus/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="hplus/js/plugins/dataTables/dataTables.bootstrap.js"></script>

    <!-- 自定义js -->
    <script src="hplus/js/content.js?v=1.0.0"></script>
    <!-- Sweet alert -->
    <script src="hplus/js/plugins/sweetalert/sweetalert.min.js"></script>
    <!-- web弹层组件 -->
    <script src="hplus/layer/layer.js"></script>

    <!-- Page-Level Scripts -->
    <script>
        var userTable;
        $(document).ready(function () {
           

            //$('.dataTables-example').dataTable();
            var userName=$("#userName").val();
            var loginName=$("#loginName").val();
            userTable =  $(".dataTables-example").DataTable({
		        "destroy" : true,       //销毁表格对象
		        "aLengthMenu":[5,10],  //用户可自选每页展示数量 5条或10条
		        "searching":false,//禁用搜索（搜索框）
		        "lengthChange":true,
		        "paging": true,//开启表格分页
		        "bProcessing" : true,
		        "bServerSide" : true,
		        "bAutoWidth" : false,
		        //"sort" : "position",
		        "deferRender":true,//延迟渲染
		        //"bStateSave" : false, //在第三页刷新页面，会自动到第一页
		        //"retrieve" : true,       //类似单例模式，重复利用以存在对象。
		        "iDisplayLength" : 5,
		        "iDisplayStart" : 0,
		        "select": {
		            style:    'os',
		            selector: 'td:first-child'
		        },
		        "ordering": false,//全局禁用排序
		        "ajax": {  //ajax方式向后台发送请求
		            "type": "POST",
		            "url":"<%=basePath%>userServlet?action=queryUserPage",
		            "data":{
		            	"userName":function(){return $("#userName").val();},
		            	"loginName":function(){ return $("#loginName").val();}
		            },//传递的数据
		            "dataType" : "json"
		        },
		        "columns" : [
		            //对接收到的json格式数据进行处理，data为json中对应的key
		            { "data": "id" },
                    { "data": "loginName" },
                    { "data": "userName" },
                    { "data": "sex" },
                    { "data": "createTime" },
                    { "data": "updateTime","defaultContent": ''},
                    { "data": "" }
		        ],
		        //渲染
		         "columnDefs": [
		             {
		                 "render": function ( data, type, row ) {
		                     return "<input type='checkbox' name='id'  value='" + data + "'>";
		                 },
		                 "targets": 0 //指定渲染列：第一列(渲染第一列为单选框，data自动匹配为  {"data":"id"}中数据）
		             },
                     {
                         "render": function ( data, type, row ) {
                            if(data=="1"){
                                return "男";
                            }else{
                                return "女";
                            }   
                         },
                         "targets": 3 //指定渲染列：第一列(渲染第一列为单选框，data自动匹配为  {"data":"id"}中数据）
                     },
                     {
                         "render": function ( data, type, row ) {
                           return "<a href='system/user/userModify.jsp?cmd=U&id="+row.id+"'>"+data+"</a>"
                         },
                         "targets": 1 
                     },
                     {
                         "render": function ( data, type, row ) {
                        	 var userName=row.userName;
                        	 if(userName.length>20){
                        		 return userName.substring(0,20)+"...";
                        	 }else{
                        		 return row.userName;
                        	 }
                         },
                         "targets": 2 
                     },
                     {
                         "render": function ( data, type, row ) {
                           return "<a href='system/user/userModify.jsp?cmd=U&id="+row.id+"'>修改</a>&nbsp;<a href='javascript:void(0);' onclick='removeOneObj("+row.id+");'>删除</a>"
                         },
                         "targets": 6 
                     },
		         ],
		        "oLanguage" : { // 国际化配置
		            "sProcessing" : "正在获取数据，请稍后...",
		            "sLengthMenu" : "显示 _MENU_ 条",
		            "sZeroRecords" : "没有找到数据",
		            "sInfo" : "从 _START_ 到  _END_ 条记录 总记录数为 _TOTAL_ 条",
		            "sInfoEmpty" : "记录数为0",
		            "sInfoFiltered" : "(全部记录数 _MAX_ 条)",
		            "sInfoPostFix" : "",
		            "sSearch" : "查询",
		            "sUrl" : "",
		            "oPaginate" : {
		                "sFirst" : "第一页",
		                "sPrevious" : "上一页",
		                "sNext" : "下一页",
		                "sLast" : "最后一页"
		            }
		        }
				//initComplete:initComplete,
		    });
                         
                         
            //绑定查询按钮
            $("#searchBtn").click(function(event) {
                queryUserPage();
            });
        });

        function queryUserPage(){
            userTable.ajax.reload();
        }
        
        function addObj(){
        	window.location.href="system/user/userModify.jsp?cmd=A";
        }
        
        function removeObj(){
        	var ids="";
        	//循环页面上所有的<input name="id">,把id拼起来
        	$("input[name='id']").each(function(){
        		if($(this).is(":checked")==true){
        			ids=ids+$(this).val()+",";
        		}
        	});
        	ids=new String(ids);
        	if(ids!=""){
        		ids=ids.substr(0,ids.length-1);
        	}
            if(ids==""){
                swal("请选择记录!");
                return false;
            }
        	$.ajax({
        		url:"userServlet?action=removeUser",
        		dataType:"json",
        		data:{ids:ids},
        		type:"post",
        		success:function(json){
        			 alert(json.message);
        			 queryUserPage();
        		}
        		
        	});
        }
     
        function removeOneObj(ids){
            if(ids==""){
                swal("请选择记录!");
                return false;
            }
            swal({
                title: "你确定要删除吗?",
                text: "亲，删除后有可能无法恢复数据!",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "是, 我要删除!",
                cancelButtonText: "取消",
                closeOnConfirm: false
            }, function () {
                $.ajax({
                    url:"userServlet?action=removeUser",
                    dataType:"json",
                    data:{ids:ids},
                    type:"post",
                    success:function(json){
                         swal("Success!", "删除成功!", "success");
                         queryUserPage();
                    },
                    error: function () {
                        swal("OMG!", "出错了，请重试!", "error");
                    }
                    
                });
            });   
        }
        
    </script>


</body>

</html>
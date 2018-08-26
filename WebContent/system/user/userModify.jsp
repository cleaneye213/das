<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html>

<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改用户</title>
    <link href="hplus/css/bootstrap.min.css" rel="stylesheet">
    <!-- Toastr style -->
    <link href="hplus/css/plugins/toastr/toastr.min.css" rel="stylesheet">

    <link href="hplus/css/animate.css" rel="stylesheet">
    <link href="hplus/css/style.css" rel="stylesheet">

    <link href="hplus/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="hplus/css/plugins/cropper/cropper.min.css" rel="stylesheet">

    <link href="hplus/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
    <!-- 
    <link href="hplus/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
    <link href="hplus/css/plugins/clockpicker/clockpicker.css" rel="stylesheet">
     -->
    <link href="hplus/css/plugins/daterangepicker/daterangepicker-bs3.css" rel="stylesheet">

    <link href="hplus/css/plugins/summernote/summernote.css" rel="stylesheet">
    <link href="hplus/css/plugins/summernote/summernote-bs3.css" rel="stylesheet">
</head>

<body>

<div id="wrapper">
    <div class="gray-bg">
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10" style="margin-top: 20px;">
                <ol class="breadcrumb">
                    <li>
                        <a href="user/toUserMain">用户管理</a>
                    </li>
                    <li class="active"><strong>修改用户</strong>
                    </li>
                </ol>
            </div>
            <div class="col-lg-2"></div>
        </div>

        <div id="content1" class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-content">
                            <form method="post" class="form-horizontal" id="form1">
                            <!--新增的时候，我传一个A进来，代表add，说明是新增  -->
                            <!--修改的时候，我传一个U进来，代表update，说明是修改  -->
                            <!--查看的时候，我传一个V进来，代表view，说明是查看  -->
                            <input type="hidden" name="cmd" value="${param.cmd}">
                            <input type="hidden" name="id" value="${param.id}"/>
                        
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">用户名：</label>
                                    <div class="col-sm-8">
                                        <input id="loginName" name="loginName" class="form-control" type="text">
                                        <span class="help-block m-b-none"><i
                                                class="fa fa-info-circle"></i> 用户名只允许字母、数字和下划线组合</span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">姓名：</label>
                                    <div class="col-sm-8">
                                        <input id="userName" name="userName" class="form-control" type="text"
                                               aria-required="true" aria-invalid="false" class="valid">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">地址：</label>
                                    <div class="col-sm-8">
                                        <input id="address" name="address" class="form-control" type="text">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">
                                        性别
                                        <br/>
                                        <small class="text-navy"></small>
                                    </label>
                                    <div class="col-sm-8">
                                        <div class="i-checks">
                                            <label>
                                                <input type="radio" value="1" name="sex" > <i></i>
                                                男
                                            </label>
                                        </div>
                                        <div class="i-checks">
                                            <label>
                                                <input type="radio" value="0" name="sex">
                                                <i></i>
                                                女
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">出生年月：</label>
                                    <div class="col-sm-8">
                                        <input id="birthday" name="birthday" class="laydate-icon form-control layer-date"placeholder="YYYY-MM-DD" onclick="laydate({istime:false, format: 'YYYY-MM-DD',fixed:true})">
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <div class="col-sm-4 col-sm-offset-2">
                                        <input type="hidden" name="id" id="id" value="">
                                        <button id="cancelBtn" type="button" class="btn btn-w-m btn-default" >取消</button>
                                        <button id="saveBtn" type="button" class="btn btn-w-m btn-primary">保存</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Mainly scripts -->
<script src="<%=basePath%>hplus/js/jquery.min.js"></script>
<script src="<%=basePath%>hplus/js/bootstrap.min.js"></script>
<!-- 自定义js -->
<script src="<%=basePath%>hplus/js/content.js?v=1.0.0"></script>
<script src="<%=basePath%>hplus/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="<%=basePath%>hplus/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="<%=basePath%>hplus/js/plugins/pace/pace.min.js"></script>

<!-- Custom and plugin javascript -->
<!-- 表单验证 -->
<script src="<%=basePath%>hplus/js/plugins/validate/jquery.validate.min.js"></script>
<script src="<%=basePath%>hplus/js/plugins/validate/messages_zh.min.js"></script>
<!-- Toastr 通知提示插件-->
<script src="<%=basePath%>hplus/js/plugins/toastr/toastr.min.js"></script>

<!-- toastr设置js -->
<script src="<%=basePath%>js/toastrSetting.js"></script>

<!-- iCheck -->
<script src="<%=basePath%>hplus/js/plugins/iCheck/icheck.min.js"></script>

<!-- Input Mask-->
<script src="<%=basePath%>hplus/js/plugins/jasny/jasny-bootstrap.min.js"></script>

<!-- SUMMERNOTE -->
<script src="<%=basePath%>hplus/js/plugins/summernote/summernote.min.js"></script>
<script src="<%=basePath%>hplus/js/plugins/summernote/summernote-zh-CN.js"></script>
<script src="<%=basePath%>js/summernoteUtil.js"></script>

<script src="<%=basePath%>/hplus/js/plugins/layer/laydate/laydate.js"></script>

<!--表单回填-->
<script src="js/work/formUtil.js"></script>
<script>
    $(document).ready(function () {
    	
    	var cmd="${param.cmd}";
    	init();
    	if("A"==cmd){
    		
    	}else if("U"==cmd){
    		getUserInfo();
    	}else if("V"==cmd){
    		getUserInfo();
    		//关闭所有能编辑的输入框
    	}

    });

    $.validator.setDefaults({
        submitHandler: function () {
            var formData = $("#form1").serialize();
            $.ajax({
                url: "userServlet?action=saveUserInfo",
                method: "post",
                dataType: "json",
                data: formData,
                success: function (data) {
                    if (data != null && !data.success) {
                        toastr.error(data.message);
                        $("#saveBtn").attr("disabled", false);
                    } else {
                        toastr(data.message);
                        window.location.href = "system/user/userMain.jsp";
                    }
                },
                error: function () {
                    toastr.error("执行出错了！");
                    $("#saveBtn").attr("disabled", false);
                }
            });
        }
    });
    
    
    function getUserInfo(){
    	var id="${param.id}";
    	$.ajax({
    		url:"userServlet?action=getUserInfo",
    		data:{id:id},
    		dataType:"json",
    		type:"post",
    		success:function(user){
    			   $("#loginName").val(user.loginName)	;
    			   $("#userName").val(user.userName)	;
    			   $("#birthday").val(user.birthday)	;
    			   $("#address").val(user.address)	;
    			   $("#loginFailCount").val(user.loginFailCount)	;
    			   var sex=user.sex;
    			   $("input:radio[name='sex']").each(function(){
    				   if($(this).val()==sex){
    					   $(this).prop("checked",true);
    					   return;
    				   }
    			   });
    			   
    		}
    	});
    }
    
    function init(){
    	$('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green'
        });

        //用户名只允许字母、数字和下划线组合
        $.validator.addMethod("isLoginName", function (value) {
            if (value.match(/^[a-zA-z0-9_]*$/) == null) {
                return false;
            }
            else {
                return true;
            }
        }, '只允许数字、字母和 _ .');

        //表单验证信息
        $("#form1").validate({
            rules: {
                loginName: {required: true, maxlength: 64, isLoginName: true},
                userName: {required: true, maxlength: 20},
            },
            messages: {
                loginName: {required: "请输入登录名", maxlength: "登录名长度不能超过64位", isLoginName: "用户名只允许字母、数字和下划线组合"},
                userName: {required: "请输入真实姓名", maxlength: "真实姓名长度不能超过20位"},
            },
            errorPlacement: function (error, element) {
                $("#saveBtn").attr("disabled", false);
                error.appendTo(element.parent());
            }
        });

        $("#saveBtn").click(function () {
            $("#saveBtn").attr("disabled", true);
            $("#form1").submit();
        });
        
        $("#cancelBtn").click(function () {
            location.href="system/user/userMain.jsp";
        });
    }
    
    
</script>

</body>
</html>

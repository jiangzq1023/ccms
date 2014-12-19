<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String path=request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>电商平台一期_支撑平台</title>
	<meta name="viewport" content="">
	<meta name="description" content="">
	<meta name="author" content="handpay">
    <!--引入bootstrap文件-->
	<link id="bs-css" href="css/common/bootstrap.css" rel="stylesheet">
	<link id="bs-css" href="css/common/bootstrap.min.css" rel="stylesheet">
    <!--/引入bootstrap文件-->
    
    <!--新增-->
    <link id="bs-css" href="css/common/login.css" rel="stylesheet">
    <!--/新增-->
    
    <!--让ie678识别html标签-->
	<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->	
    <!--/让ie678识别html标签-->
  <style>
  body{ background:url(images/login-pic.png) no-repeat center center; width:100%; height:100%; min-height:600px;}
  form{ margin:0; padding:0;}
  #login{position:absolute;left:-6px; top:-6px; width:350px; min-height:302px;border:6px solid #CCC; padding:0; border-radius:6px; -webkit-border-radius:6px; -moz-border-right-colors:6px;-moz-opacity:0.5;-webkit-opacity: 0.5;opacity: 0.5; z-index:-1;-webkit-box-shadow:2px 2px 18px #292929;x-shadow:2px 2px 18px #292929;box-shadow:2px 2px 18px #292929;}
  #login2{ position:relative;  width:330px; min-height:282px; list-style:none; background:#FFF;  padding:10px; margin-left:60%; margin-top:200px; z-index:9;}
  #login2 li{line-height:38px; clear:both}
  #login2 li span{ float:left}
  #login2 li span a{ font-size:12px; text-decoration:underline}
  #login2 li span a:hover{ text-decoration:none; color:#F60;}
  #login2 li span a img{ margin:0px; margin-right:6px; margin-left:10px; line-height:28px; padding:0; overflow:hidden; height:28px; padding-bottom:8px;}
  #login2 li .left-title{ width:86px; display:block; text-align:right}
  #login2 .title{ line-height:normal; padding-top:10px; padding-bottom:4px; padding-left:0px; font-size:16px; font-family:"微软雅黑","黑体"; color:#3695cd; font-weight:bolder; margin-left:12px; margin-right:2px; border-bottom:1px solid #3695cd;}
  .top{ margin-top:40px;}
  .heng-info{ border-bottom:1px solid #CCC; position:relative;}
  .tixing{ display:block; padding:0; padding-left:6px; padding-right:6px; background:#FFF; position:absolute; left:25%; top:-20px; color:#666; font-size:12px;}
  .br{ height:35px; line-height:35px;}
  #bottom{position:absolute;bottom:0;border-top:1px solid #D5D5D5; line-height:30px;padding:10px 0;  width:100%; text-align:center}
  .topper{ position:absolute; left:30px; top:47px; padding:4px; width:77%; padding-left:8px; padding-right:8px;}
  </style>  
    
</head>

<body onload="window.document.forms[0].username.focus();">
    <ul id="login2"><form action="<%=path%>/j_spring_security_check" name="form" id="form" method="post">
       <li class="title">用户登录</li>
       <div class="alert alert-error topper" style="display: ${sessionScope['SPRING_SECURITY_LAST_EXCEPTION'].message == null ? 'none' : 'block'}">${sessionScope['SPRING_SECURITY_LAST_EXCEPTION'].message}</div>
       <li class="top"><span class="left-title">用户名：</span><span><input type="text" name="username" value="${sessionScope['SPRING_SECURITY_LAST_USERNAME']}"/></span></li>
       <li><span class="left-title">密&nbsp;&nbsp;&nbsp;码：</span><span><input type="password" name="password"/></span></li>
       <li><span class="left-title">验证码：</span><span><input type="text" class="span1" name="validateCode" maxlength="4"/></span><span><img id="image" src="validateCode.jsp?Math.radom();" onclick="return call_image()"></span></li>
       <li><span class="left-title">&nbsp;</span><span><button class="btn btn-primary" type="button" onclick="loginCheck()">登 录</button>&nbsp;&nbsp;<button class="btn" type="reset">取 消</button></span></li>
       <li class="br">&nbsp;</li>
       <li class="heng-info"><font class="tixing">客服服务热线 021-68680000</font></li>
       <div id="login"></div><!--边缘透明--></form>
    </ul>
    <div id="bottom">上海瀚银 版权所有 Copyright © 2012 All Rights Reserved</div>
</body>
</html>
<!--需要在页尾加载的js-->
	<script src="js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript">
	//提交
	function loginCheck(){
		var name = document.getElementsByName("username")[0].value;
		var pwd = document.getElementsByName("password")[0].value;
		var validateCode = document.getElementsByName("validateCode")[0].value;
		if(name == ""){
			document.getElementsByName("username")[0].value = "";
			document.getElementsByName("username")[0].focus(); 
			alert("请输入用户名！");
		}else if(pwd == ""){
			document.getElementsByName("password")[0].value = "";
			document.getElementsByName("password")[0].focus(); 
			alert("请输入密码！");
		}else if(validateCode == "" || validateCode.length != 4){
			document.getElementsByName("validateCode")[0].value = "";
			document.getElementsByName("validateCode")[0].focus(); 
			alert("请输入验证码！");
		}else{
			window.document.forms[0].submit();
		}
	}
	//切换验证码
	function call_image(){
		document.getElementById("image").src = "validateCode.jsp?" + Math.random();
	}
	</script>
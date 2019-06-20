<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html  class="x-admin-sm">
<head>
	<meta charset="UTF-8">
	<title>后台登录</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/login.css">
	<link rel="stylesheet" href="./css/xadmin.css">
	<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="./lib/layui/layui.js" charset="UTF-8"></script>
    
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="login-bg">
    
    <div class="login layui-anim layui-anim-up">
        <div class="message">管理登录</div>
        <div id="darkbannerwrap"></div>
        
        <form method="post" class="layui-form" >
            <input name="username" id="username" placeholder="用户名"  type="text" lay-verify="username" class="layui-input" >
            <hr class="hr15">
            <input name="password" id="password" lay-verify="password" placeholder="密码"  type="password" class="layui-input">
            <hr class="hr15">
            <input value="登录" lay-submit lay-filter="login"  style="width:100%;" type="submit">
            <hr class="hr20" >
        </form>
    </div>

    <script>
        $(function  () {
			
        	layui.use('form', function(){
                var form = layui.form;
                form.verify({
                	username: [
                		/[\S]+/
                	    ,'用户名不能为空！'
                	  ] ,
                	  password: [
                  		/[\S]+/
                  	    ,'密码不能为空！'
                  	  ]   		  
          		})
          		
          		
          		
        	form.on('submit(login)', function(data){
     				var url = '${pageContext.request.contextPath}/login_submit';
                	var param = $(".layui-form").serialize();
                	//var param={username:$("#username").val(),password:$("#password").val()};
                	$.post(url, param, function (data) {
                        if(data.flag == 1){
                        	alert(data.content);
                        	location.href='${pageContext.request.contextPath}/index';
                        }else{
                        	alert(data.content);
                        }
                    });
        	})

        	})
        	
        	
          	
              
      });
        	
    </script>
    <!-- 底部结束 -->
    
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./lib/layui/css/layui.css">
<style>
	.singer_bg{
		width:500px;
		margin:0 auto;
		margin-top:50px;
	}
	input{
		margin-top:20px;
	}
	p{
		margin-top:20px;
	}
	
	.headerd img{
		margin-top:20px;
		width:100px;
		height:100px;
		clear:both;
	}
</style>
<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script src="./lib/layui/layui.js" charset="utf-8"></script>
<script src="./js/jquery.form.js" charset="UTF-8"></script>
<script src="./js/jquery.min.js" charset="utf-8"></script>

</head>
<body>
<form id="form1" action="${pageContext.request.contextPath}/add_singer_submit" method="post" enctype="multipart/form-data">
<div class="singer_bg">
歌手名字：<input class="singerName" name="singerName" type="text"><br>
头像：<input class="file"  name="multipartFile" type="file"> <br>
性别：<input type="radio" name="singerSex" value="0" />女
<input type="radio" name="singerSex" value="1" />男   <br>
<input type="submit" class="layui-btn"  value="提交"/>
</div>
</form>
</body>
</html>
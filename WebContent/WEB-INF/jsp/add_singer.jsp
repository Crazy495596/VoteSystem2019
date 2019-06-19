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
</style>
<script type="text/javascript" src="./js/jquery-3.4.1.min.js"></script>
<script src="./lib/layui/layui.js" charset="utf-8"></script>
</head>
<body>
<form id="form1" method="post">
<div class="singer_bg">
歌手名字：<input class="singer_name" name="singer_name" type="text"><br>
头像：<input type="file"><br>
性别：<input type="radio" name="sex" value="0" />女
<input type="radio" name="sex" value="1" />男   <br>
<p class="layui-btn" onclick="add_singer()" >提交</p>
</div>
</form>

<script>
function add_singer() {

    $.ajax({
    	url:"${pageContext.request.contextPath}/add_singer_submit",
		data:$("#form1").serialize(),
		dataType:"json",
		success:function(result){
			
			alert(result.content)
		}
    }); 
   

}

</script>
</body>
</html>
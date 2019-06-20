<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style type="text/css">
			body{
				background: url(./images/bg1.bmp);
			}
			#VoteMain {
				width: 1000px;
				height: 450px;
				margin: 0 auto;
				margin-top: 0px;
				padding: 20px 20px 20px 20px;
				display: flex;
				justify-content: center;
			
			}
			.top{
				width: 100%;
				height: 60px;
				margin-top: 10px;
				font-size: 40px;
				text-align: center;
				color: red;
			}
			.VoteItem {
				width: 150px;
				height: 100%;
				float: left;
				margin-left: 30px;
				margin-right: 30px;
				display: flex;
				flex-direction: column-reverse;
			}
			
			.VoteValue {
				width: 80px;
				height: 100px;
				background-color: #f47920;
				margin: 0 auto;
				margin-bottom: 0px;
				border: 1px solid #fff;
			}
			
			.VoteItem:hover .VoteSpan {
				display: block;
			}
			
			.VoteValue:hover {
				-webkit-box-shadow: 0px 0px 5px #808080;
				-moz-box-shadow: 0px 0px 5px #808080;
				box-shadow: 0px 0px 5px #808080;
			}
			
			.VoteSpan {
				width: 80px;
				height: 30px;
				
				float: left;
				margin-top: -38px;
				font-size: 32px;
				text-align: center;
				line-height: 30px;
				color: orange;
				text-align: center;
				position: relative;
				
			}
			
			.VoteImg {
				width: 60px;
				height: 60px;
				position: relative;
				-webkit-box-shadow: 0px 0px 5px #ccc;
				-moz-box-shadow: 0px 0px 5px #ccc;
				box-shadow: 0px 0px 5px #ccc;
				-webkit-border-radius: 50%;
				-moz-border-radius: 50%;
				border-radius: 50%;
				border: 2px solid #fff;
				margin: 0 auto;
				margin-left: 5px;
				margin-top: 10px;
				cursor: pointer;
			}
			
			.VoteImg:hover {
				border-color: #4e72b8;
				-webkit-box-shadow: 0px 0px 5px #444693;
				-moz-box-shadow: 0px 0px 5px #444693;
				box-shadow: 0px 0px 5px #444693;
			}
			
			.VoteText {
				font: 15px "微软雅黑", Arial, Helvetica, sans-serif;
				text-align: center;
				font-weight: 600;
				color: #333;
				line-height: 10px;
				margin-top: 5px;
			}
			
			.VoteSpanTri {
				position: absolute;
				width: 10px;
				height: 6px;
				background-image: url(tri.png);
				margin-top: 30px;
				margin-left: -15px;
				
			}
		</style>
</head>
<body>
<div id="Demo" style="text-align:center;">
			<div class="top">第一轮比赛</div>
			<div id="VoteMain">
				<c:forEach items="${Voteshowlist}" var="list">
				<div class="VoteItem">
					<div class="votename">
						<p class="VoteText">${list.singerName }</p>
					</div>
					<div class="voteimg">
						<img title="支持一下" src="" class="VoteImg">
					</div>
					<div class="VoteValue" style="height: 220px;">
						<div class="VoteSpan">${list.votesum }<span class="VoteSpanTri"></span></div>
					</div>	
				</div>
				</c:forEach>
				
				<!-- 
				<div class="VoteItem">
					<div class="votename">
						<p class="VoteText">Sona</p>
					</div>
					<div class="voteimg">
						<img title="支持一下" src="img/2.jpg" class="VoteImg">
					</div>
					<div class="VoteValue" style="height: 161px;">
						<div class="VoteSpan">161<span class="VoteSpanTri"></span></div>
					</div>
					
				</div>
				<div class="VoteItem">
					<div class="votename">
						<p class="VoteText">Sona</p>
					</div>
					<div class="voteimg">
						<img title="支持一下" src="img/3.jpg" class="VoteImg">
					</div>
					<div class="VoteValue" style="height: 130px;">
						<div class="VoteSpan">100<span class="VoteSpanTri"></span></div>
					</div>
					
				</div>
				<div class="VoteItem">
					<div class="votename">
						<p class="VoteText">Sona</p>
					</div>
					<div class="voteimg">
						<img title="支持一下" src="img/img2.jpg" class="VoteImg">
					</div>
					<div class="VoteValue" style=" height: 211px;">
						<div class="VoteSpan">211<span class="VoteSpanTri"></span></div>
					</div>
					
				</div> -->
			</div>
		</div>

</body>
</html>
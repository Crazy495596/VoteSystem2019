<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
			*{
				margin: 0;
				padding: 0;
			}
			html,body{
				width: 100%;
				height: 100%;
				background: brown;
				
			}
			.box{
				width: 100%;
				height:100%;
				display: flex;
				
				display: flex;
				flex-direction: column;
			}
			.name{
				width: 100%;
				height: 7%;
				color: red;
				font-size: 34px;
				text-align: center;
				
			}
			.content{
				width: 100%;
				height: 93%;
				display: flex;
				align-items: center;
				justify-content: center;
			}
			.img img{
				width: 150px;
				height: 150px;
			}
			.player{
				width: 90%;
				height: 95%;
				
				display: flex;
				flex-direction: column;
				align-items: center;
				
			}
			.top_player{
				width: 90%;
				height: 37.5%;
				display: flex;
				flex-direction: row;
				justify-content: center;
				
			}
			
			.img{
				width: 40%;
				height: 25%;
				display: flex;
				justify-content: center;
				align-items: center;
			}
			.img img{
				width: 150px;
				height: 150px;
				
			}
			.bottom_player{
				width: 90%;
				height: 37.5%;
				
				display: flex;
				flex-direction: row;
				justify-content: center;
			}
			.player1{
				width: 50%;
				height: 100%;
				
				display: flex;
				position: relative;
				flex-direction: column;
				align-items: center;
			}
			.user{
				width: 120px;
				height: 120px;
				
				
			}
			.headimg{
				width: 120px;
				height: 120px;
				border-radius: 120px;
				
				
			}
			.vote2{
				position: absolute;
				width: 120px;
				height: 120px;
				margin-top: -120px;
			}
			.vote img{
				width: 60px;
				height: 30px;
				margin-top: 15%;
			}
			.username{
				margin-top: 10%;
				font-size: 24px;
			}
			
		</style>	
</head>
<body>
<div class="box">
			<div class="name">第一轮比赛</div>
			<div class="content">
				<div class="player">
					<div class="top_player">
						<div class="player1">
							<div class="user">
								<img class="headimg" src="img/1.jpg" />
								<img class="vote2" src="img/vote2.png" />
							</div>
							<div class="username">小姐姐</div>
							<div class="vote">
								<img src="img/vote1.png" />
							</div>
							
						</div>
						<div class="player1">
							<div class="user">
								<img class="headimg" src="img/1.jpg" />
								<img class="vote2" src="img/vote2.png" />
							</div>
							<div class="username">小姐姐</div>
							<div class="vote">
								<img src="img/vote1.png" />
							</div>
							
						</div>
					
					</div>
					<div class="img">
						<img src="./images/pk.png" />
					</div>
					<div class="bottom_player">
						<div class="player1">
							<div class="user">
								<img class="headimg" src="" />
								<img class="vote2" src="./images/vote2.png" />
							</div>
							<div class="username">小哥哥</div>
							<div class="vote">
								<img src="./images/vote1.png" />
							</div>
						</div>
						<div class="player1">
							<div class="user">
								<img class="headimg" src="" />
								<img class="vote2" src="../images/vote2.png" />
							</div>
							<div class="username">小哥哥</div>
							<div class="vote">
								<img src="../images/vote1.png" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

</body>
</html>
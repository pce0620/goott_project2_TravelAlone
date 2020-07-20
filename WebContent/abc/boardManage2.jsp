<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	p{
		font-size: 15px;
	}

	#board1{
	width: 1250px;
	height: 500px;
    padding: 30px 30px 5px 30px; 
    border: 1px solid gray;
    border-radius: 2px;
    margin-top: -2px;
    box-shadow: 0px 2px 1px 0px #EAEAEA;
    color: #6e6e6e;
	}
	
	#nav1, #board1{
		margin-left: 170px;
	}
	#nav1{
		margin-top : 30px;
		padding: 0px;
	}
	#meet, #review, #free{
		padding: 2px 20px 2px 20px;
		height: 40px;
		font-size: 15px;
		background-color: #C4DEFF;	
		color: gray;
		border-radius: 40px;
	}	
	
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){	
		$('#meet').click(function(){
			$('#board1').load("../Project/together.jsp");
		});
		$('#review').click(function(){
			$('#board1').load("review.jsp");
		});
		$('#free').click(function(){
			$('#board1').load("../Project/freeboard.jsp");
		});
		
		$("#meet").click(function(){
			$('#meet').css("background-color", "#fff").css("color", "black").css("font-weight", "bold").css("font-size", "17px");
			$('#review').css("background-color", "#C4DEFF").css("color", "black");
			$('#free').css("background-color", "#C4DEFF").css("color", "black");
		});	
		$("#review").click(function(){
			$('#review').css("background-color", "#fff").css("color", "black").css("font-weight", "bold").css("font-size", "17px");
			$('#meet').css("background-color", "#C4DEFF").css("color", "black");
			$('#free').css("background-color", "#C4DEFF").css("color", "black");
		});	
		$("#free").click(function(){
			$('#free').css("background-color", "#fff").css("color", "black").css("font-weight", "bold").css("font-size", "17px");
			$('#meet').css("background-color", "#C4DEFF").css("color", "black");
			$('#review').css("background-color", "#C4DEFF").css("color", "black");
		});	
	});	
</script>
</head>
<body>
<br />
<p>홈 > 게시판관리 > <a href="">커뮤니티 관리</a></p>
	<h2>커뮤니티 관리</h2>
		<div id="nav1">
		<a>[ 커뮤니티 ]</a><br /><br />
			<button id="meet" value="동행 찾아요">동행 찾아요</button>
			<button id="review" value="후기 게시판">후기 게시판</button>
			<button id="free" value="자유 게시판">자유 게시판</button>
		</div>	
		<div id="board1">
			  <jsp:include page="../Project/together.jsp"></jsp:include>
		</div>
</body>
</html>
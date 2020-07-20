<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardManage.jsp</title>
<style type="text/css">
	p{
		font-size: 15px;
	}

	#board{
	width: 1250px;	
	height: 500px;
    padding: 30px 30px 5px 30px; 
    border: 1px solid gray;
    border-radius: 2px;
    margin-top: -2px;
    box-shadow: 0px 2px 1px 0px #EAEAEA;
    color: #6e6e6e;
	}
	
	#nav, #board{
		margin-left: 170px;
	}
	#nav{
		margin-top : 30px;
		padding: 0px;
	}
	#notice, #qna, #faq{
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
		$('#qna').click(function(){
			$('#board').load("../abc/qna_board/list.jsp");
		});	
		$('#notice').click(function(){
			$('#board').load("../abc/noticeboard/notice_list.jsp");
		});
		$('#faq').click(function(){
			$('#board').load("../abc/faqboard/faq_list.jsp");
		});
		
		$("#qna").click(function(){
			$('#qna').css("background-color", "#fff").css("color", "black").css("font-weight", "bold").css("font-size", "17px");
			$('#notice').css("background-color", "#C4DEFF").css("color", "black");
			$('#faq').css("background-color", "#C4DEFF").css("color", "black");
		});	
		$("#notice").click(function(){
			$('#notice').css("background-color", "#fff").css("color", "black").css("font-weight", "bold").css("font-size", "17px");
			$('#qna').css("background-color", "#C4DEFF").css("color", "black");
			$('#faq').css("background-color", "#C4DEFF").css("color", "black");
		});	
		$("#faq").click(function(){
			$('#faq').css("background-color", "#fff").css("color", "black").css("font-weight", "bold").css("font-size", "17px");
			$('#notice').css("background-color", "#C4DEFF").css("color", "black");
			$('#qna').css("background-color", "#C4DEFF").css("color", "black");
		});	
	});
</script>

</head>
<body>
<p>홈 > 게시판관리 > <a href="">고객센터 관리</a></p>
	<h2>고객센터 관리</h2>
		<div id="nav">
		<a>[ 고객센터 ]</a><br /><br />
			<button id="qna" value="Q&A"> Q & A </button>
			<button id="notice" value="공지사항">공지사항</button>
			<button id="faq" value="자주 묻는 질문">자주 묻는 질문</button>
		</div>		
		<div id="board">
			  <jsp:include page="../abc/qna_board/list.jsp"></jsp:include>
		</div>
		
</body>
</html>
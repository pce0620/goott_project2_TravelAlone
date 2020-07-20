<%@page import="team_vo.QnABoardVO"%>
<%@page import="team_dao.QnABoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

	#detail_table{
		width : 1200px;
		border-spacing: 2px;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
	}

	#detail_title, #detail_writer, #detail_time{
		border-collapse: collapse;
		font-size: 15px;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
		text-align: center;
		border-top: 1px solid black;
		border-right: 1px solid #ddd;
		height : 15px;
		padding-top: 13px;
		padding-bottom: 13px;
	}
	
	#detail_col1, #detail_col2{
		padding : 10px;
		margin-left : 10px;
		border-collapse: collapse;
		font-size: 13px;
   		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
		border-top: 1px solid black;
		height : 15px;
		padding-top: 13px;
		padding-bottom: 13px;
	}
	
	#detail_modifybutton, #detail_delConfirm{
		float : right;
		margin-right : 5px;
	}
	
	#detail_modifybutton, #detail_delConfirm, #detail_list{
    	color: #555;
   		font-size: 13px;
    	padding: 0 10px 0 10px;
    	min-width: 50px;
    	height: 28px;
    	line-height: 26px;
    	text-align: center;
    	font-weight: 600;
    	text-decoration: none;
    	background: #fff;
    	border: 1px solid #ddd;
	}
	
	#summernote{
		width: 900px;
	}
</style>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote css/js-->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			height : 600,
			minHeight : 600,
			maxHeight : 600,
			lang : 'ko-KR',
			focus: true,
			toolbar : false,
		    disableResizeEditor: true,
			onImageUpload : function(files, editor, welEditable) {
				sendFile(files[0], editor, welEditable);
			}
		});
		$('#summernote').summernote('disable');
		
	});
</script>
</head>
<body>
	<!-- 게시글 번호에 따른 데이터 조회 결과를 각 td에 출력해보세요 -->
	<%
		String no = request.getParameter("bno");
	
		QnABoardDAO dao = new QnABoardDAO();
		QnABoardVO vo = new QnABoardVO();
		
		if(no!=null){
			int bno = Integer.parseInt(no);
			//조회수 증가 메소드 추가
			dao.raiseHits(bno);
			
			vo = dao.getData(bno);
		}else {
			response.sendRedirect("../abc/qna_boardlist.jsp");
		}
			
	%>
	<div id="listdiv1">
	<table id="detail_table">
		<tr>
			<th id="detail_title">제목</th>
			<td id="detail_col1" colspan="4"><%=vo.getBtitle() %></td>
		</tr>
		
		<tr>
			<th id="detail_writer">작성자</th>
			<td id="detail_col2"><%=vo.getMname() %></td>
			<th id="detail_time">작성일시</th>
			<td id="detail_col2"><%=vo.getBregdate() %></td>
		</tr>
		
		<tr id="detail_contents">
			<td colspan="6" id="ct">
				<%=vo.getBcontents() %>
			</td>
		</tr>
		
		<tr>
			<td colspan="6">
				<input type="button" value="목록" id="detail_list"/>
				<%-- <a href="modify.jsp?bno=<%=vo.getBno() %>" ><input type="button" value="수정" id="detail_modifybutton" /></a> --%>
				<button value="<%=vo.getBno()%>" id="modifybt" id="detail_modifybutton">수정</button>
				<a href="../abc/qna_board/deleteOk.jsp?bno=<%=vo.getBno() %>"><input type="button" value="삭제"  id="detail_delConfirm"/></a>
				
			</td>
		</tr>
		
	</table>
	</div>
<script type="text/javascript">
	
	
	$('#detail_list').click(function(){
		
		$('#listdiv1').load("../abc/qna_board/list.jsp");
		
	});
	
	$('#modifybt').click(function(){
		var bno = this.value;
		$('#listdiv1').load("../abc/qna_board/modify.jsp?bno="+bno);
		
	});
	
	
</script>


</body>
</html>
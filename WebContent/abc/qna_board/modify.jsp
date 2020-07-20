<%@page import="team_vo.QnABoardVO"%>
<%@page import="team_dao.QnABoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
	
		width : 820px;
		margin : 0 auto;
		border-spacing: 2px;
		margin-top: 340px;
		margin-left: 580px;
	}


	#title, #writer, #time, #contentshead{

		padding : 10px;
		border-collapse: collapse;
		border-top : 1px black solid;
		border-bottom : 1px black solid;
		font-size: 13px;
   		font-family: "나눔고딕",Nanum Gothic,Malgun Gothic,"Spoqa Han Sans", "돋움",Dotum,"굴림",Gulim, AppleGothic, Sans-serif;
		text-align: center;

	}
	
	#col1, #col2{
	
		padding : 10px;
		margin-left : 10px;
		border-collapse: collapse;
		border-top : 1px black solid;
		border-bottom : 1px black solid;
		font-size: 13px;
   		font-family: "나눔고딕",Nanum Gothic,Malgun Gothic,"Spoqa Han Sans", "돋움",Dotum,"굴림",Gulim, AppleGothic, Sans-serif;
		
	}
	
	#confirm {
		
		float : right;
		margin-right : 5px;
	}
	
	#confirm, #list{
		

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
</style>
<!-- include libraries(jQuery, bootstrap) -->
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
			height : 300,
			minHeight : 300,
			maxHeight : 300,
			lang : 'ko-KR',		    
			focus: true,
		    disableResizeEditor: true,
			onImageUpload : function(files, editor, welEditable) {
				sendFile(files[0], editor, welEditable);
			
			}
		});
	});
</script>
</head>
<body>
	<%
		String no = request.getParameter("bno");
		QnABoardDAO dao = new QnABoardDAO();
		QnABoardVO vo = new QnABoardVO();
		
		if(no!=null){
			
			int bno = Integer.parseInt(no);
			
			vo = dao.getData(bno);
			
		}else {
			
			response.sendRedirect("../abc/qna_boardlist.jsp");
		}
	
	%>
	<form action="../abc/qna_boardmodifyOk.jsp">
		<input type="hidden" name="bno" value="<%=vo.getBno() %>" />
		<table>
			<tr>
				<th id="title">제목</th>
				<td id="col1" colspan="4"><input type="text" name="btitle" id="" value="<%=vo.getBtitle() %>"/></td>
			</tr>
			
			<tr>
				<th id="writer">작성자</th>
				<td id="col2"><%=vo.getMname() %></td>
				<th id="time">작성일시</th>
				<td id="col2"><%=vo.getBregdate() %></td>
			</tr>
			
			<tr id="contentsmain">
				<td colspan="4">
					<textarea name="bcontents" id="summernote" cols="200" rows="10" >
						<%=vo.getBcontents() %>
					</textarea>
				</td>
			</tr>
			
			<tr>
				<td colspan="6">
					<a href="../abc/qna_boardlist.jsp"><input type="button" value="목록" id="list"/></a>
					<input type="submit" value="확인" id="confirm" />
					
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
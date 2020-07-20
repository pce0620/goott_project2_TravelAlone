<%@page import="team_vo.QnABoardVO"%>
<%@page import="team_dao.QnABoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String cp = request.getParameter("cp");

	int currentPage = 0;
	
	if(cp!=null){
		currentPage = Integer.parseInt(cp);
	}else{
		currentPage = 1;
	}
	
	QnABoardDAO dao = new QnABoardDAO();
	QnABoardVO vo1 = new QnABoardVO();
	int totalCount = dao.getTotalCount();
	
	int recordByPage = 10;
	
	int totalPage = (totalCount/recordByPage==0)?totalCount/recordByPage:totalCount/recordByPage+1;
	
	int startNo = (currentPage-1)*recordByPage+1;
	int endNo = currentPage*recordByPage;
	
	
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	
	#listdiv1{
		width : 830px;
		height: 100%;
		float : left;
		margin-bottom: 50px;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
	}
	
	#qnaTable{
		width : 1200px;
		margin : 0 auto;
		border-collapse: separate;
		border-spacing: 2px;
		font-size: 13px;
   		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
	}
	
	#qnaTable, #qnaTable tr, #qnaTable th, #qnaTable td{
		border-top : 1px black solid;
		border-bottom : 1px black solid;
		border-collapse: collapse;
		font-size: 15px;
	}
	
	#qnaTable th, #qnaTable td{
		height : 13px;
		padding-top: 7px;
		padding-bottom: 7px;
	}
	
	
	#list_col1{
		width : 10%;
		text-align: center;
	}

	#list_col2{
		width : 50%;
	}
	
	#list_col3{
		width : 15%;
		text-align: center;
	}
	
	#list_col4 {
		width : 15%;
		text-align: center;
	}
	
	#list_col5{
		width : 10%;
		text-align: center;
	}
	
	.btn{
		padding-left : 770px;
	}
	
	#searchbox{
		position : relative;
		float : right;
	}
	
	.qnalistbutton{
		background: white;
		border : 0px;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
		font-size: 15px;
		cursor: pointer;
	}
	
	.bt2{
		margin-left: 300px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/httpRequest.js"></script>
</head>
<body>
	<div>
		<div id="listdiv1">
			<table id="qnaTable">
				<tr>
					<th id="list_col1">번호</th>
					<th id="list_col2">제목</th>
					<th id="list_col3">작성자</th>
					<th id="list_col4">작성일</th>
					<th id="list_col5">조회수</th>
				</tr>
			<%
			ArrayList<QnABoardVO> list = dao.getAllData(startNo, endNo);
			for(QnABoardVO vo : list){
			%>
				<tr>
					<td id="list_col1"><%=vo.getBno() %></td>
					<td id="list_col22">
					<% 
					
					String pw1 = vo.getBpassword();
					
					if(pw1==null){
						
					%>
					<button id="bt" value="<%=vo.getBno()%>" class="qnalistbutton"><%=vo.getBtitle() %></button>
					
					<%
					
					}else if(pw1!=null){
						
					%>
					<button id="bt1" value="<%=vo.getBno()%>" class="qnalistbutton">[비밀글]<%=vo.getBtitle() %></button>

					<%
					}
					%>
					
					</td>
					<td id="list_col3"><%=vo.getMname() %></td>
					<td id="list_col4"><%=vo.getBregdate() %></td>
					<td id="list_col5"><%=vo.getBhits() %></td>
				</tr>
				<%
				}
				%>
				<tr>
					<td colspan="5">
						<%
							for(int i = currentPage-4; i<=currentPage+5; i++){
								if(i<=0){
									continue;
								}else if(i>totalPage){
									break;
								}else{
						%>
						<a href="../abc/qna_boardlist.jsp?cp=<%=i %>"><span id="list_page"> <%=i %></span></a>			
						<%
								}//if end
						}//for end
						%>
					</td>
				</tr>
				<tr>
					<td colspan="5" class="btn">
					<button value="<%=vo1.getBno()%>" class="bt2">공지글 등록</button>
					<!-- <a href="write.jsp"><input type="button" value="글쓰기" width="20px"/></a> -->
					</td>
				</tr>
					
			</table>
			<form action="../abc/qna_board/search.jsp">
			<div id="searchbox">
				<select name="searchsel" id="searchsel">
					<option value="none">--선택--</option>		
					<option value="btitle" id="btitle" >제목</option>
					<option value="contentssearch" id="bcontents">내용</option>
					<option value="writersearch" id="mname">작성자</option>
				</select>
				<input type="text" name="searchtext" id="searchtext" />
				<input type="submit" value="검색" />
			</div>
		</form>	
		</div>

	</div>
</body>
<%
QnABoardVO vo = new QnABoardVO();
String pw1 = vo.getBpassword();
if(pw1==null){
	
%>

<script type="text/javascript">
	
	
	$('#bt').click(function(){
		var bno = this.value;
		$('#listdiv1').load('../abc/qna_board/detail.jsp?bno='+bno);
	});
	
	$('#bt1').click(function(){
		var bno = this.value;
		$('#listdiv1').load('../abc/qna_board/passwordcheck.jsp?bno='+bno);
		
	});
	
	$('#bt2').click(function(){
		$('#listdiv1').load("../abc/qna_board/write.jsp");
	});

</script>
<%
}
%>
</html>
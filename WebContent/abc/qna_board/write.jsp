<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write.jsp</title>
<style type="text/css">

	#contents1{
		margin : 0 auto;
		width : 800px;
	/* 	margin-top: 340px;
		margin-left: 580px;
		margin-bottom: 200px; */
	}
	
	#col1{
	
		display : inline-block;
		margin : 0 ;
		padding : 10px;
		width : 95px;
		height : 35px;
		font-size: 13.5px;
		font-weight : bold;
   		font-family: "나눔고딕",Nanum Gothic,Malgun Gothic,"Spoqa Han Sans", "돋움",Dotum,"굴림",Gulim, AppleGothic, Sans-serif;
		text-align: center;
	}
	
	#title, #writer, #pw{
		
		
		font-size: 13px;
   		font-family: "나눔고딕",Nanum Gothic,Malgun Gothic,"Spoqa Han Sans", "돋움",Dotum,"굴림",Gulim, AppleGothic, Sans-serif;
		height: 28px;
		
		
	}
	
	#td1{
		width : 700px;
		height: 35px;
		padding : 10px;
	}
	
	#title{
		width : 300px;
	
	}
	
	
	#addFile1, #addFile2{
	
		display : inline;
		float : left;
		padding-left: 35px;
	}
	
	.button{
		display: block;
	
	}
	
	#list{
		display : inline;
		margin-left: 10px;
		margin-top: 30px;
	}
	
	
	#write{
		display : inline;
		float : right;
		margin-top: 30px;
	}
	
	.line{
	
		border-bottom: 1px solid #e1e1e1;
		border-top: 1px solid #e1e1e1;	
	}

</style>
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
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
			width : 600,
			minHeight : 600,
			maxHeight : 600,
			lang : 'ko-KR',
			
			onImageUpload : function(files, editor, welEditable) {
				sendFile(files[0], editor, welEditable);
			
			}
		});
	});
</script>
</head>
<body> 
	<form action="../abc/qna_boardwriteOk.jsp" name="frm">
		<div id="contents1">
			
			<table>
				<tr class="line">
					<th id="col1">제목</th>
					<td id="td1"><input type="text" name="btitle" id="title" width="400"/></td>
				</tr>
				<tr class="line">
					<th id="col1">작성자</th>
					<td id="td1"><input type="text" name="mname" id="writer" width="200"/></td>
				</tr>
				<tr>
					<td colspan="2" id="td1">
					<textarea name="bcontents" id="summernote" cols="30" rows="20"></textarea>
					</td>
				</tr>
				<tr class="line">
					<th id="col1">비밀번호 </th>
					<td id="td1"><input type="password" name="bpassword" id="pw" /></td>
				</tr>
				<tr class="line">
					<td colspan="2" id="td1">
						<a href="../abc/qna_boardlist.jsp"><input type="button" value="목록" id="list"/></a>
						<input type="submit" value="글쓰기" id="write" />	
					</td>
				</tr>
			</table>
		</div>
		<div>
			<input type="text" name="search" id="" />
		</div>
	</form>
</body>
</html>	
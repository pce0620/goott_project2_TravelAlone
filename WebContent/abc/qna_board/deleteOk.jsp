<%@page import="team_dao.QnABoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- deleteOk.jsp -->

<%
	String b = request.getParameter("bno");

	if(b!=null){
		int bno = Integer.parseInt(b);
		
		QnABoardDAO dao = new QnABoardDAO();
		dao.deleteData(bno);
		
		response.sendRedirect("list.jsp");
		
	}else{
		response.sendRedirect("list.jsp");
		
	}


%>
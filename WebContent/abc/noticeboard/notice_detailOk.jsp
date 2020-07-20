<%@page import="team_dao.NoticeBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String b = request.getParameter("bno");

	if(b!=null){
		int bno = Integer.parseInt(b);
		
		NoticeBoardDAO dao = new NoticeBoardDAO();
		dao.deleteData(bno);
		
		response.sendRedirect("../abc/noticeboard/notice_list.jsp");
		
	}else{
		response.sendRedirect("../abc/noticeboard/notice_list.jsp");
	}
%>
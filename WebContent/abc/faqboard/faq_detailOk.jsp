<%@page import="team_dao.FAQBoard_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String b = request.getParameter("bno");

	if(b!=null){
		int bno = Integer.parseInt(b);
		
		FAQBoard_DAO dao = new FAQBoard_DAO();
		dao.deleteData(bno);
		
		response.sendRedirect("..abc/faqboard/faq_list.jsp");
		
	}else{
		response.sendRedirect("..abc/faqboard/faq_list.jsp");
	}
%>

<%@page import="team_vo.QnABoardVO"%>
<%@page import="team_dao.QnABoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	String btitle = request.getParameter("btitle");
	String mname = request.getParameter("mname");
	String bcontents = request.getParameter("bcontents");
	String bpassword = request.getParameter("bpassword");

	
	QnABoardDAO dao = new QnABoardDAO();
	QnABoardVO vo = new QnABoardVO();
	
	vo.setBtitle(btitle);
	vo.setMname(mname);
	vo.setBcontents(bcontents);
	vo.setBpassword(bpassword);

	dao.addData(vo);
	
	
	
	response.sendRedirect("../MainBoard/MainBoard.jsp");



%>
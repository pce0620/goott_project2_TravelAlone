<%@page import="team_vo.NoticeBoardVO"%>
<%@page import="team_dao.NoticeBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	String mname = request.getParameter("mname");
	String btitle = request.getParameter("btitle");
	String bcontents = request.getParameter("bcontents");

	
	NoticeBoardDAO dao = new NoticeBoardDAO();
	NoticeBoardVO vo = new NoticeBoardVO();
	
	vo.setMname(mname);
	vo.setBtitle(btitle);
	vo.setBcontents(bcontents);
	
	dao.addData(vo);
	
	response.sendRedirect("../abc/noticeboard/notice_list.jsp");

%>
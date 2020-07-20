<%@page import="team_dao.QnABoardDAO"%>
<%@page import="team_vo.QnABoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String btitle = request.getParameter("btitle");
	String bcontents = request.getParameter("bcontents");
	String no = request.getParameter("bno");
	

	if(no!=null){
		int bno = Integer.parseInt(no);
		
		QnABoardVO vo = new QnABoardVO();
		QnABoardDAO dao = new QnABoardDAO();
		vo.setBno(bno);
		vo.setBtitle(btitle);
		vo.setBcontents(bcontents);
		
		dao.modifyData(vo);
		
		response.sendRedirect("../MainBoard/MainBoard.jsp");
	}else {
		response.sendRedirect("../MainBoard/MainBoard.jsp");
	}

%>
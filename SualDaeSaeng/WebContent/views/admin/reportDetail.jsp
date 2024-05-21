<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/header.jsp" %>

<%
	BoardVO boardVo =(BoardVO) request.getAttribute("boardVO");
%>

<%@include file="/footer.jsp" %>



<%@page import="vo.AdminInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	AdminInfoVO vo = (AdminInfoVO) session.getAttribute("adminResult");
%>

	{
		"admin_id" : "<%= vo.getAdmin_id() %>",
		"admin_power" : "<%= vo.getPower() %>"
	}














    
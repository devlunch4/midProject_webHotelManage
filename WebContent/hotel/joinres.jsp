<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String) request.getAttribute("resId");
	if (id != null) {
%>
{"sw" : "가입 실패"}

<%
	} else {
%>

{"sw" : "가입 성공"}

<%
	}
%>

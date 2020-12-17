<%@page import="vo.MemberInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	MemberInfoVO vo = (MemberInfoVO) request.getAttribute("res");
	
%>

	
{
	"mem_id" : "<%= vo.getMem_id()%>",
	"mem_name" : "<%= vo.getMem_name()%>",
	"mem_bir" : "<%= vo.getMem_bir()%>",
	"mem_tel" : "<%= vo.getMem_tel()%>",
	"mem_addr" : "<%= vo.getMem_addr()%>",
	"mem_email" : "<%= vo.getMem_email()%>"
}








    
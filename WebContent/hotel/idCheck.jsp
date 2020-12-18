<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
    //컨트롤러에서 저장한 이름.
    String resId = (String) request.getAttribute("resId");
    if(resId != null){
    %>
{ "sw" : " 사용 불가능 아이디"}

<%	
    }else{
    	%>
{ "sw" : " 사용 가능 아이디"}

<%
    }
    %>
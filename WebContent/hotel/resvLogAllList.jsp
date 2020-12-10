<%@page import="vo.ResvlogVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<ResvlogVO> list = (List<ResvlogVO>) request.getAttribute("list");
%>

[
	<%
		for (int i = 0; i < list.size(); i++) {
			ResvlogVO vo = list.get(i);
			if(i >0){
				out.print(",");
			}%>
	
	{
		"resev_no" : "<%=vo.getRESEV_NO()%>",
		"room_in" : "<%=vo.getROOM_IN()%>",
		 "room_out" : "<%=vo.getROOM_OUT()%>",
		  "mem_id" : "<%=vo.getMEM_ID()%>",
		"room_no" : "<%=vo.getROOM_NO()%>",
		"room_pl" : "<%=vo.getROOM_PL()%>",
		"room_type" : "<%=vo.getROOM_TYPE()%>",
		 "room_num" : "<%=vo.getROOM_NUM()%>",
		"resev_state" : "<%=vo.getRESEV_STATE()%>",
		 "resev_date" : "<%=vo.getRESEV_DATE()%>"
	}
	<%} %>
]

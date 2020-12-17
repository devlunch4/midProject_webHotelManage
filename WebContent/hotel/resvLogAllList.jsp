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
		"resev_no" : "<%=vo.getResev_no()%>",
		"room_in" : "<%=vo.getRoom_in()%>",
		 "room_out" : "<%=vo.getRoom_out()%>",
		  "mem_id" : "<%=vo.getMem_id()%>",
		"room_no" : "<%=vo.getRoom_no()%>",
		"room_pl" : "<%=vo.getRoom_pl()%>",
		"room_type" : "<%=vo.getRoom_type()%>",
		 "room_num" : "<%=vo.getRoom_num()%>",
		"resev_state" : "<%=vo.getResev_state()%>",
		 "resev_date" : "<%=vo.getResev_date()%>",
		 "sales" : "<%=vo.getSales()%>"
	}
	<%} %>
]

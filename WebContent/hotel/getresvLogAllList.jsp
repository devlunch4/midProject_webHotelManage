<%@page import="vo.ResvlogVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<ResvlogVO> list = (List<ResvlogVO>) request.getAttribute("list");
%>
[
	<%
	for(int i=0; i < list.size(); i++) {
	
		ResvlogVO vo = list.get(i);
		if(i > 0) out.print(",");
	%>
			{
				"RESEV_NO" : "<%= vo.getResev_no() %>",
				"ROOM_IN" : "<%= vo.getRoom_in() %>",
				"ROOM_OUT" : "<%= vo.getRoom_out() %>",
				"MEM_ID" : "<%= vo.getMem_id() %>",
				"ROOM_PL" : "<%= vo.getRoom_pl() %>",
				"ROOM_NO" : "<%= vo.getRoom_no() %>",
				"ROOM_TYPE" : "<%= vo.getRoom_type() %>",
				"ROOM_NUM" : "<%= vo.getRoom_num() %>",
				"RESEV_STATE" : "<%= vo.getResev_state() %>",
				"RESEV_DATE" : "<%= vo.getResev_date() %>"
			}
	<%		
		}
	%>
]



















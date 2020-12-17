
<%@page import="vo.RevReplyVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<RevReplyVO> list = (List<RevReplyVO>)request.getAttribute("list");
%>
[

	<%
		for(int i=0; i<list.size(); i++){
				RevReplyVO vo = list.get(i);
				if(i>0) out.print(",");
	
	%>
		{
			"revrep_no" : "<%= vo.getRevrep_no() %>",		
			"revrep_cont" : "<%= vo.getRevrep_cont().replaceAll("\r","").replaceAll("\n", "<br>") %>",
			"revrep_date" : "<%= vo.getRevrep_date() %>",		
			"mem_id" : "<%= vo.getMem_id() %>",
			"rev_no" : "<%= vo.getRev_no() %>"
		}
<%
	}
%>
]
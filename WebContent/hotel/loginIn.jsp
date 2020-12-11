<%@page import="vo.MemberInfoVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<MemberInfoVO> list = (List<MemberInfoVO>) request.getAttribute("list");
%>
[
	<%
	for(int i=0; i < list.size(); i++) {
	
		MemberInfoVO vo = list.get(i);
		if(i > 0) out.print(",");
	%>
			{
				"mem_id" : "<%= vo.getMem_id() %>",
				"mem_pass" : "<%= vo.getMem_pass() %>",
				"mem_name" : "<%= vo.getMem_name() %>"
			}
	<%		
		}
	%>
]

    
    
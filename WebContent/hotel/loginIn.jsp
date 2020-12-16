<%@page import="vo.MemberInfoVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//List<MemberInfoVO> list = (List<MemberInfoVO>) request.getAttribute("list");
	MemberInfoVO vo = (MemberInfoVO) session.getAttribute("result");
	if(vo!=null){
%>

	{
				"mem_id" : "<%= vo.getMem_id() %>",
				"mem_name" : "<%= vo.getMem_name() %>",
				"mem_email" : "<%= vo.getMem_email() %>",
				"power" : "<%= vo.getPower() %>"
	}
<% }else{ %>
	{
				"power" : "1"
	}
<%} %>	
<%-- 	<%
		session.setAttribute("mem_id", vo.getMem_id());
		session.setAttribute("mem_name", vo.getMem_name());
		session.setAttribute("mem_email", vo.getMem_email());
	%> --%>
	<%-- 
[
	<%
	for(int i=0; i < list.size(); i++) {
	
		MemberInfoVO vo = list.get(i);
		if(i > 0) out.print(",");
	%>
			{
				"mem_id" : "<%= vo.getMem_id() %>",
				"mem_pass" : "<%= vo.getMem_pass() %>",
				"mem_name" : "<%= vo.getMem_name() %>",
				"mem_email" : "<%= vo.getMem_email() %>"
			}
	<%		
		}
	%> 
]
	--%>

    
    
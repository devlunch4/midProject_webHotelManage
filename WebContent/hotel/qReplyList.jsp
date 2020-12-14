
<%@page import="vo.QReplyVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<QReplyVO> list = (List<QReplyVO>)request.getAttribute("list");
%>
[

	<%
		for(int i=0; i<list.size(); i++){
				QReplyVO vo = list.get(i);
				if(i>0) out.print(",");
	
	%>
		{
			"qre_no" : "<%= vo.getQre_no() %>",		
			"q_no" : "<%= vo.getQ_no() %>",
			"qre_cont" : "<%= vo.getQre_cont().replaceAll("\r","").replaceAll("\n", "<br>") %>",
			"qre_date" : "<%= vo.getQre_date() %>",		
			"admin_id" : "<%= vo.getAdmin_id() %>"
			
		}
<%
	}
%>
]
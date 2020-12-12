
<%@page import="vo.VoteVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<VoteVO> list = (List<VoteVO>)request.getAttribute("list");
%>
[
	<%
		for(int i=0; i<list.size(); i++){
			VoteVO vo = list.get(i);
			if(i > 0){
				out.print(",");
			}
	%> 
		{
			"code" : "<%=vo.getStaff_code() %>",
			"count" : "<%=vo.getStaff_score() %>"
			
		}
			
	<%		
		}
	%>


		



]
  


<%@page import="vo.QBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  List<QBoardVO> list = (List<QBoardVO>)request.getAttribute("list");
  int total = (Integer)request.getAttribute("tp");
  int startp = (Integer)request.getAttribute("sp");
  int endp = (Integer)request.getAttribute("ep");
%>
{
  "tp"  : "<%= total %>",
  "sp"  : "<%= startp %>",
  "ep"  : "<%= endp %>",
  "datas"  : 

[
	<%
		for(int i=0; i<list.size(); i++){
			QBoardVO vo = list.get(i);
			if(i>0) out.print(",");
	%>
			{
				"q_no" 	:  "<%= vo.getQ_no() %>",
				"q_title"  :  "<%= vo.getQ_title() %>",
				"q_cont" :  "<%= vo.getQ_cont().replaceAll("\r","").replaceAll("\n", "<br>") %>",
				"q_date"   :  "<%= vo.getQ_date() %>",
				"mem_id"  :  "<%= vo.getMem_id() %>"
			}


<% 	}
%>
]
}




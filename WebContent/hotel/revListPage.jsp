
<%@page import="vo.ReviewVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  List<ReviewVO> list = (List<ReviewVO>)request.getAttribute("list");
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
			ReviewVO vo = list.get(i);
			if(i>0) out.print(",");
	%>
			{
				"rev_no" 	:  "<%= vo.getRev_no() %>",
				"rev_title"  :  "<%= vo.getRev_title() %>",
				"rev_cont" :  "<%= vo.getRev_cont().replaceAll("\r","").replaceAll("\n", "<br>") %>",
				"rev_date"   :  "<%= vo.getRev_date() %>",
				"mem_id"  :  "<%= vo.getMem_id() %>"
			}


<% 	}
%>
]
}




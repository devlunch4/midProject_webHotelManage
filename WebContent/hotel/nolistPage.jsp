<%@page import="vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<NoticeVO> list = (List<NoticeVO>)request.getAttribute("list");
  int total = (Integer)request.getAttribute("tp");
  int startp = (Integer)request.getAttribute("sp");
  int endp = (Integer)request.getAttribute("ep");
%>
{
  "tp"  : "<%=total%>",
  "sp"  : "<%=startp%>",
  "ep"  : "<%=endp%>",
  "datas"  : 

[
	<%
	for(int i=0; i<list.size(); i++){
	NoticeVO vo = list.get(i);
	if(i>0) out.print(",");
%>
			{
				"noti_no" 	:  "<%= vo.getNoti_no() %>",
				"noti_title"  :  "<%= vo.getNoti_title() %>",
				"noti_cont" :  "<%= vo.getNoti_cont().replaceAll("\r","").replaceAll("\n", "<br>") %>",
				"noti_date"   :  "<%= vo.getNoti_date() %>",
				"admin_id"  :  "<%= vo.getAdmin_id() %>"
			}


<% 	}
%>
]
}




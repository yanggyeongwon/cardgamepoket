<%@page import=portfolio.CardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>input_proc.jsp</title>
</head>
<body>

<%
	request.setCharacterEncoding("utf-8");


int ts = Integer.parseInt(request.getParameter("ts"));
int tm = Integer.parseInt(request.getParameter("tm"));
String name = request.getParameter("rank_input_text");
String modes = request.getParameter("emtex");
System.out.println(ts);
System.out.println(tm);
System.out.println(name);
System.out.println(modes);

CardDAO dao = CardDAO.getInstance();
int cnt = dao.insert_Rank(ts,tm,name,modes);
System.out.println(cnt);
if (cnt>0){
	response.sendRedirect("main.jsp");
}
%>
</body>
</html>
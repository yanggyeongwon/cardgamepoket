<%@page import="java.util.ArrayList"%>
<%@page import="portfolio.CardDTO"%>
<%@page import="portfolio.CardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="style.css" rel="stylesheet" type="text/css">
    <script src="jquery-3.5.1.min.js" type="text/javascript"></script>
    <script src="script.js" type="text/javascript"></script>
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Anton&family=Black+Han+Sans&display=swap" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<%
request.setCharacterEncoding("utf-8");
	CardDAO dao = CardDAO.getInstance();
	ArrayList<CardDTO> dtos = dao.select_rank();
%>
<body>
    <div id="rankpage">
    	<img src="images_num/RANKINGPAGE2.png" alt="no">
    	<div id="returnbtn">
    		<a href="main.jsp"><img src="images_num/returnbtn.png" alt="no"></a>
   	 	</div>
   	 	<%
   	 	System.out.println("size:"+dtos.size());
   	 	if(dtos.size() >= 5){
   	 		for(int j=0; j<dtos.size();j++){
   	 			System.out.println("tm:"+dtos.get(j).getTm_tab());
   	 			System.out.println("ts:"+dtos.get(j).getTs_tab());
   	 			int ts = dtos.get(j).getTs_tab();
   	 			int tm = dtos.get(j).getTm_tab();
   	 			int cnt = dao.delete_rank(ts,tm);	
   	 			
   	 		}
   	 	}else{
	   	 	for(int i=0; i<dtos.size();i++){
	 			%>
	 				<div class="rank_lists" id="lists<%=i %>">
	   	 		<form>
	   	 			<span>이름 : </span><input type="text" name="id" value=<%=dtos.get(i).getName_tab() %> size="10" readonly>
	   	 			<span>시간 : </span><input type="text" name="times" value="0<%=dtos.get(i).getTm_tab() %>:<%=dtos.get(i).getTs_tab() %>" size="5" readonly>   	
	   	 			<span>모드 : <%=dtos.get(i).getModes() %></span> 			
	   	 		</form>
	   	 	</div>
	 			<%
			}
   	 	}
   	 	%>
   	 			
    </div>
    
</body>
</html>
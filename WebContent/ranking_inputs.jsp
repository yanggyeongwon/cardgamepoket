<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script src="jquery-3.5.1.min.js" type="text/javascript"></script>
    <script src="script.js" type="text/javascript"></script>
    <link href="https://fonts.googleapis.com/css2?family=Anton&family=Black+Han+Sans&display=swap" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="style.css" rel="stylesheet" type="text/css">
    <title>Document</title>
</head>
<%
	int ts = Integer.parseInt(request.getParameter("ts"));
	int tm = Integer.parseInt(request.getParameter("tm"));
	String modes = request.getParameter("emtex");
%>
<body>
    <div id="rank_input">
        <form action="input_proc.jsp?tm=<%=tm %>&ts=<%=ts %>" target="_blank" method="post">
            <span>시간</span><span class="time_input"><%=tm %>:<%=ts %></span><br>
            <input type="hidden" name="emtex" value="<%=modes%>">
            <span>이름</span><input type="text" name="rank_input_text" size="10" placeholder="입력">
            <button onclick="return blank_page()">입력</button>
        </form>
    </div>
    <script>
    	function blank_page(){
    		if($("#rank_input input[name='rank_input_text']").val() == ""){
        		alert("이름을 입력하세요")
        		return false;
        	}
    		window.open("about:blank","_self").close();
    	}
    	
    </script>
</body>
</html>
<%@page import="java.util.TimerTask"%>
<%@page import="java.util.Timer"%>
<%@page import="portfolio.CardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="style.css" rel="stylesheet" type="text/css">
    <script src="jquery-3.5.1.min.js" type="text/javascript"></script>
    <script src="script.js" type="text/javascript"></script>
    <link href="https://fonts.googleapis.com/css2?family=Anton&family=Black+Han+Sans&display=swap" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<%
	int arry = Integer.parseInt(request.getParameter("arry"));
	int arrwidth = arry+1;

%>
<body style="background-color:#e2cdcd;">
    <div class="time">
        <p>시간 </p>
        <div class="mode">
        	<%
        		if(arry == 7){
        			%><em><%=arry %>x<%=arry-1 %></em><%
        		}else if (arry == 5){
        			%><em><%=arry %>x<%=arry-1%></em><%
        		}else{
        			%><em><%=arry %>x<%=arry%></em><%
        		}
        	%>
                    
        </div>
    </div>
   	
    <script>
   
		var printCnt = document.getElementById("cardpack");
		
		var current = 0; //pair 카드 비교 배열 변수로 들감
		var canFlip = true; //카드 비교 하기 위한 boolen
		var total = 0; //게임 종료를 위한 갯수 카운트 		 
		var cardNum; //카드 갯수
		var Real; // 카드 랜덤 변수
		var Back; // 뒷면 카드 변수  
		var clear; //카드 종료 하기 위한 boolen
		var arrylen; // 카드 종료 변수, 뒷면 생성
		var pair = new Array(2);
		
		if(<%=arry%> == 4){
			cardNum = new Array(16);//16//30
			Real = new Array(8);//8//16
			Back = new Array(16);//16
			clear = new Array(16);
			arrylen =16;
		}else if(<%=arry%> == 5){
			cardNum = new Array(20);
			Real = new Array(10);
			Back = new Array(20);
			clear = new Array(20);
			arrylen = 20;
		}else if(<%=arry%> == 7){
			cardNum = new Array(42);
			Real = new Array(21);
			Back = new Array(42);
			clear = new Array(42);
			arrylen =42;
		}
		
		for(var i=0; i< Real.length;i++){
			Real[i] = 0;
		}
				
		for(var i=0; i<clear.length;i++){
			clear[i] = false;
		}
		
		for(var i=0; i<Back.length;i++){
			Back[i] = "poket.png";
		}
		
		var game = document.createElement('div');
  		  game.id = "cardpack";
  		var uls = document.createElement('ul');
  		  document.body.appendChild(game);  
 		  game.appendChild(uls);
 		  
 		  if(<%=arry%> == 4){
 			  $("ul").css({width:"40%"})
 		  }else if(<%=arry%> == 5){
 			 $("ul").css({width:"50%"})
 		  }else if(<%=arry%> == 7){
 			 $("ul").css({width:"70%"})
 			 $('body').css({background:"url(images_num/yadon.gif"})
 			 $("#cardpack img").css({width:"120px"})
 		  }
 		  
     for(i=0;i<arrylen;i++){ // 카드뒷면 생성 
    	 var lis = document.createElement('li');
 		  uls.appendChild(lis);
 		  
         Back[i] = document.createElement('img');
         Back[i].src="images_num/poket.png"
         Back[i].id=i;
         Back[i].setAttribute("onclick","cardFlip(this)");
         //Back[i].style.visibility ='visible';
         
        
         lis.appendChild(Back[i]);

         Back.width=50;
         Back.height=50;
         if(<%=arry%> == 4){
        	 console.log("4칸");
        	 Back.className =Back[i]%4;
         }else if(<%=arry%> == 5){
        	 console.log("5칸");
        	 Back.className =Back[i]%10;
         }else if(<%=arry%> == 7){
        	 console.log("7칸");
        	 Back.className =Back[i]%21;
         }
                 
         Back.alt='';
     }
     function Random(){
    	 if(<%=arry%> == 4){
    		 //console.log("Math.floor(Math.random():"+Math.floor(Math.random() * 8+1));
    		 return Math.floor(Math.random() * 8+1);//9
 		}else if(<%=arry%> == 5){
 			//console.log("Math.floor(Math.random():"+Math.floor(Math.random() * 10+1));
 			return Math.floor(Math.random() * 10+1);
 		}else if(<%=arry%> == 7){
 			//console.log("Math.floor(Math.random():"+Math.floor(Math.random() * 21+1));
 			return Math.floor(Math.random() * 21+1);
 		}
    	
     }
  // 카드 종류 정하기
     function shuffle() {
         for (var i = 0; i < cardNum.length; i++) {
             console.log("random: "+Random())
        	 var tmp = Random();

             while (Real[tmp-1] >= 2) {// random값 카드 랜덤 숫자를  맞추기 ㅇ위해 -1
                 tmp = Random();
                 console.log(tmp);
             }

             cardNum[i] = tmp;
             //console.log("tmp"+tmp);
             Real[tmp - 1]++;
         }
     }
     //카드 뒤집기
  shuffle(); 
     
  var starFlag = true;
  var time = 0;
  var min = 0;
  var sec = 0;
  var timer;
  var tm;
  var ts;
  
  const winwidth = $(window).width();
  const winheight = $(window).height();
  
  var emtex = $(".mode em").text();
  
  const popx = (document.body.offsetWidth / 2) - (180 / 2);
  const popy = (window.screen.height / 2) - (590 / 2);

  
  function start_time(){
	  if(starFlag){
	  		starFlag = false;
	  		if(time ==0){
	  			$(".time p").text("00:00")
	  		}
	  		timer = setInterval(function(){
	  			time++;
	  			
	  			min = Math.floor(time/60);
	  			sec = time%60;
	  			
	  			tm = min;
	  			ts = sec;
	  			
	  			if(tm < 10){
	  				tm = "0" + min;
	  			}
	  			if(ts < 10){
	  				ts = "0" + sec;
	  			}
	  			$(".time p").text(tm + ":" + ts);
	  		},1000)
	  		
	  	}
  }
  function flip(){
	  $('body').css({backgroundColor:"#e2cdcd"})
  }
  function cardFlip(obj) {
            if (canFlip) {
                if (Back[obj.id]){
                    pair[current] = obj.id;  
                    // 현재에서 1.2카드 비교
                }
                obj.src =  'images_num/'+cardNum[obj.id]+ '.png';
                if (Back[obj.id]){  // 뒷면 번호
                	start_time();
                    current++;   // 현재 클릭 1 
                    Back[obj.id] = false;  //번호아니면
                }
                if (current == 2) { 
                    canFlip = false;

                    if (cardNum[pair[0]] == cardNum[pair[1]]) { // 두개의 카드가 맞는지 확인 
                        clear[pair[0]] = clear[pair[1]] = true;
                        total += 2;  // 맞다면 2개 
                        $('body').css({backgroundColor:"green"})
                        setTimeout(flip,400)
                        // 게임 종료
                        if (total >= arrylen){  // 다 뒤집으면 게임 끝
                        	
                            
                            
                            
                           	window.open("ranking_inputs.jsp?tm="+tm+"&ts="+ts+"&emtex="+emtex,'window팝업','top='+popy+', left='+popx+', width=600, height=180, menubar=no, status=no, toolbar=no')
                            setTimeout(function re() {
                            	
                            	clearInterval(timer);
                                starFlag = true;
                                time = 0;
                                
                            }, 10);       
                        }
                    }else{
                    	$('body').css({backgroundColor:"red"})
                    	setTimeout(flip,400)
                    	
                    }
                    // 카드 다시 뒤집기
                    setTimeout(function cardReFlip() {
                        var reFlip = 0;  // 다시 
                        var tmpID;

                        for (var i = 0; i < cardNum.length; i++) {
                            if (!Back[i] && !clear[i]) {  
                                reFlip++;

                                tmpID = document.getElementById(i);
                                tmpID.src = "images_num/poket.png";  
                                Back[i] = true;
                            }
                            if (reFlip >= 2) {
                            	break; 
                            }
                        }
                        current = 0; // 초기화 
                        canFlip = true;  // 이제 다시 뒤집을 수 있다
                    }, 500);
                }
            }
        }
        </script>
        
</body>
</html>
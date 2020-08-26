

window.onload = function() {    
     setTimeout(loding,3000);  
     setTimeout(lefttree,3000)
     setTimeout(righttree,3000)
     setTimeout(centertree,3000)
     setTimeout(sun,3000)
}
function loding(){
	$('#loding').fadeOut()
}
$(function(){
	$('#tree1').css({left:"-100%"});
	$('#tree2').css({right:"-100%"});
	$('#tree_center').css({bottom:"-100%"});
	$('#sun').css({top:"-100%"});
	$('#gora').css({bottom:"-100%"})
	$('#yadon').css({bottom:"-100%"})
	$('#moon').css({top:"-100%"})
	
	
	$('.bar_choice li img').eq(0).mouseenter(function(){
		$('#gora').animate({bottom:"0%"})
	})
	$('.bar_choice li img').eq(0).mouseleave(function(){
		$('#gora').animate({bottom:"-100%"})
	})
	
	
	
	$('.bar_choice li img').eq(1).mouseenter(function(){
		$('#yadon').animate({bottom:"0%"})
	})
	$('.bar_choice li img').eq(1).mouseleave(function(){
		$('#yadon').animate({bottom:"-100%"})
	})
	
	
	$('.bar_choice li img').eq(2).mouseenter(function(){
		$('#moon').stop().animate({top:"0%"})
		$('#sun').stop().animate({top:"-100%"})
		setTimeout(moon,500)
	})
	$('.bar_choice li img').eq(2).mouseleave(function(){
		$('#moon').stop().animate({top:"-100%"})
		$('#sun').stop().animate({top:"0%"})
		$('body').stop().css({backgroundColor:"#fff"})
	})

})
function moon(){
	$('body').css({backgroundColor:"#1A2951"},1000)

}
function sun(){
	$('#sun').animate({top:"0"},1000)
}

function lefttree(){
	$('#tree1').animate({left:"0"},1000)
}
function righttree(){
	$('#tree2').animate({right:"0"},1000)
}
function centertree(){
	$('#tree_center').animate({bottom:"-22.5%"},1000)
}


$(document).ready(function(){
	window.addEventListener("message",function(event){
		$(".esc").css("display",+event.data.show?"none":"block");
	});
});
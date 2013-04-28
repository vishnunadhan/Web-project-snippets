<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="source/js/jquery-1.9.1.js"></script>
<title>Show More test</title>
<script type="text/javascript">

$(document).ready(function(){
  $("#buttonDiv").click(function(){
		//alert($("#slideDiv").hasClass("detVisible"));
		//var buttonDiv = $("#buttonDiv").html();
		if(!($("#slideDiv").hasClass("detVisible"))) {
			var content = $("#slideDiv").html();
			content = "<br/><hr/>" + content;
			
			$(content).appendTo("#buttonDiv"); 
			$("#buttonDiv").animate({'margin-top':'-200px',height:'200px'});
			$("#slideDiv").addClass("detVisible");
		}
		else {
			$("#buttonDiv").animate({'margin-top':'0px',height:'30px'},500);
			$("#slideDiv").removeClass("detVisible");
			setTimeout(function() {
				$("#buttonDiv").empty();
				$("#buttonDiv").append("<center>Show More</center>");
			},500);
			
		}
	});
});

</script>
</head>
<body>
<div style="border:1px solid; height:100%">
	<div style="background-color:yellow; border:1px solid; height:55%"></div>
	<div style="background-color:green; border:1px solid; height:30%"></div>
	<br/><br/>
	<div id="buttonDiv" style="background-color:#D6F5FF; border:1px solid; height:23px; width:1331px; position:absolute; bottom:53; "><center>Show More</center></div>
	<div id="slideDiv" style="background-color:#D6F5FF; border:1px solid;height:100px; display:none;width:1331px;"><!--  -->
	Explanation<br/>
	Explanation<br/>
	Explanation<br/>
	Explanation<br/>
	Explanation<br/>
	</div>
	<div id="footerDiv" style="background-color:#33CCFF; border:1px solid;position:absolute; height:45px; bottom:6; width:1331px; "> 
	P:jhdgkj sofhskfh iashfoiashf asifhaoifhaoishfoasifhoifhaofishfoishf
	</div>
</div>
</body>
</html>

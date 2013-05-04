<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="source/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="source/js/jquery.dataTables.js"></script>
<link rel="stylesheet" type="text/css" href="CSS/jquery.dataTables.css">
<title>Data table</title>

<script>
$(document).ready(function(){
  
$("#table1_radio").click(function(){
	var optV = $("#table1_radio").attr("name");
	var newstring = "#" + optV;
	alert(newstring);
	//fnLoadNewData(newstring,"arraysnew.txt");
	newTable = $(newstring).dataTable();
	newTable.fnReloadAjax( 'arraysnew.txt' );

});
$("#table2_radio").click(function(){
	var optV = $("#table2_radio").attr("name");
	var newstring = "#" + optV;
	//fnLoadNewData(newstring,"arraysnew.txt");
	newTable = $(newstring).dataTable();
//	newTable.fnReloadAjax( 'arraysnew.txt' );
	fnLoadNewDataViaAjax(newTable, '' );
});
$("#table3_radio").click(function(){
	var optV = $("#table3_radio").attr("name");
	var newstring = "#" + optV;
	//fnLoadNewData(newstring,"arraysnew.txt");
	newTable = $(newstring).dataTable();
	newTable.fnReloadAjax( 'arraysnew.txt');
});

setInterval(function(){
	tableId ="#" + "table1";
	table = $(tableId).dataTable();
	var oTableToUpdate =  $(table).dataTable();
  	oTableToUpdate.fnReloadAjax();
	//alert(oTable_1.fnSettings());
	/* oTable_1.fnDestroy(); */
/* 	oTable_1.fnClearTable();
	oTable_1._fnAjaxUpdate(oTable_1.fnSettings()); */
	/* oTable_1.fnClearTable();
	oTable_1._fnAjaxUpdateDraw(oTable_1.fnSettings(),"arraysnew.txt"); */
	//oTable_1.fnReloadAjax(oTable_1.fnSettings());
	/* var newTable = $("#table1").dataTable();
	newTable.fnReloadAjax(oTable_1.fnSettings()); */
	/* oTable_2.fnReloadAjax();
	oTable_3.fnReloadAjax();  */
	/* $('#table1').dataTable()._fnAjaxUpdate();
	$('#table2').dataTable()._fnAjaxUpdate();
	$('#table3').dataTable()._fnAjaxUpdate(); */
}, 15000);

	
	oTable_1 = $('#table1').dataTable( {
		"sAjaxSource": "arrays.txt",
		"bSearchable":false,
        "bPaginate": true,
        "bLengthChange": false,
        "bSort": false,
        "iDisplayLength":6,
/*         "aaColumns": [{ 
        	"sWidth": "6%", 
        	"sWidth": "6%",
        	"sWidth": "6%",
        	"sWidth": "6%"
         }] */
         
    } );
	oTable_2 = $('#table2').dataTable( {
		"sAjaxSource": "arrays2.txt",
		"bSearchable":false,
        "bPaginate": true,
        "bLengthChange": false,
        "bSort": false,
        "iDisplayLength":6,
/*         "aaColumns": [{ 
        	"sWidth": "6%", 
        	"sWidth": "6%",
        	"sWidth": "6%",
        	"sWidth": "6%"
         }] */
         /* "fnInitComplete": function(oSettings, json) {
        	 alert("intialixinggnng");
         } */
         
    } );

	oTable_3 = $('#table3').dataTable( {
		"sAjaxSource": "arrays3.txt",
		"bSearchable":false,
        "bPaginate": true,
        "bLengthChange": false,
        "bSort": false,
        "iDisplayLength":6,
/*         "aaColumns": [{ 
        	"sWidth": "6%", 
        	"sWidth": "6%",
        	"sWidth": "6%",
        	"sWidth": "6%"
         }] */
         
    });
	

	
	function fnLoadNewData(tableId, urlData)
	{
	  $.getJSON(urlData, null, function( json )
	  {
	    table = $(tableId).dataTable();
	    oSettings = table.fnSettings();
	    
	    table.fnClearTable(this);

	    for (var i=0; i<json.aaData.length; i++)
	    {
	      table.oApi._fnAddData(oSettings, json.aaData[i]);
	    }

	    oSettings.aiDisplay = oSettings.aiDisplayMaster.slice();
	    table.fnDraw();
	  });
	}
	$.support.cors = true;
	function fnLoadNewDataViaAjax(tableId, urlData)
	{
		table = $(tableId).dataTable();
	    oSettings = table.fnSettings();
	    
	    table.fnClearTable(this);
		$.ajax({
			      type: "GET",
			      dataType: "json",
			      url: "http://jsonmoon.jsapp.us/",
			//      url: "http://services.faa.gov/airport/status/IAD?format=application/json",
			      data: { },
			      success: function( msg ) 
			      { 
			    	  alert("sucdc");
			    	  //data = JSON.stringify(msg);
			    	//  alert(json.msg[0].last);
			    	  table.fnAddData(["rgrs","df","rh","sfs"]);
			      },
			      error: function (xhr, ajaxOptions, thrownError) {
			          alert(xhr.status);
			          alert(thrownError);
			        }
	
		});
	    oSettings.aiDisplay = oSettings.aiDisplayMaster.slice();
	    table.fnDraw();
	}
	
	$.fn.dataTableExt.oApi.fnReloadAjax = function ( oSettings, sNewSource, fnCallback, bStandingRedraw )
	{
		if ( typeof sNewSource == 'undefined' && sNewSource == null ) {
			alert("refreshing");
		}
	    if ( typeof sNewSource != 'undefined' && sNewSource != null )
	    {
	        oSettings.sAjaxSource = sNewSource;
	    }
	    this.oApi._fnProcessingDisplay( oSettings, true );
	    var that = this;
	    var iStart = oSettings._iDisplayStart;
	    var aData = [];

	    this.oApi._fnServerParams( oSettings, aData );

	    oSettings.fnServerData( oSettings.sAjaxSource, aData, function(json) {
	        /* Clear the old information from the table */
	        that.oApi._fnClearTable( oSettings );

	        /* Got the data - add it to the table */
	        var aData =  (oSettings.sAjaxDataProp !== "") ?
	            that.oApi._fnGetObjectDataFn( oSettings.sAjaxDataProp )( json ) : json;

	        for ( var i=0 ; i<aData.length ; i++ )
	        {
	            that.oApi._fnAddData( oSettings, aData[i] );
	        }

	        oSettings.aiDisplay = oSettings.aiDisplayMaster.slice();
	        that.fnDraw();

	        if ( typeof bStandingRedraw != 'undefined' && bStandingRedraw === true )
	        {
	            oSettings._iDisplayStart = iStart;
	            that.fnDraw( false );
	        }

	        that.oApi._fnProcessingDisplay( oSettings, false );

	        /* Callback user function - for event handlers etc */
	        if ( typeof fnCallback == 'function' && fnCallback != null )
	        {
	            fnCallback( oSettings );
	        }
	    }, oSettings );
	}
	
});

</script>
</head>
<body>
<div>
<table style="border:1px solid black; float:left;" id="table1">
<thead>
<tr>
	<th>Column1</th>
	<th>Column2</th>
	<th>Column3</th>
	<th>Column4</th>
</thead>
<tbody>

</tbody>	
</table>
</div>
<div>
<table  style="border:2px solid red; float:left;" id="table2">
<thead>
<tr>
	<th>Column1</th>
	<th>Column2</th>
	<th>Column3</th>
	<th>Column4</th>
</thead>
<tbody>

</tbody>	
</table>
<table  style="border:1px solid green; float:left;" id="table3">
<thead>
<tr>
	<th>Column1</th>
	<th>Column2</th>
	<th>Column3</th>
	<th>Column4</th>
</thead>
<tbody>

</tbody>	
</table>
</div>
<div style="border:1px solid blue;align:center">
	<input type="radio" id="table1_radio" name="table1" value="Table1_loadNewAjax">Table1_loadNewAjax
	<input type="radio" id="table2_radio" name="table2" value="Table2_loadNewAjax"/>Table2_loadNewAjax
	<input type="radio" id="table3_radio" name="table3" value="Table3_loadNewAjax"/>Table3_loadNewAjax

</div>
</body>
</html>

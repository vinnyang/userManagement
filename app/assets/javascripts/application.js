// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// = require jquery
// = require jquery_ujs
// = require_tree .

var lastsel;
$(function(){	
	$("#userTable").jqGrid({
	   	url:'server.php?q=2',
		datatype: "json",
	   	colNames:['Inv No','Date', 'Client', 'Amount','Tax','Total','Notes'],
	   	colModel:[
	   		{name:'id',index:'id', width:55},
	   		{name:'invdate',index:'invdate', width:90, editable:true},
	   		{name:'name',index:'name', width:100,editable:true},
	   		{name:'amount',index:'amount', width:80, align:"right",editable:true},
	   		{name:'tax',index:'tax', width:80, align:"right",editable:true},		
	   		{name:'total',index:'total', width:80,align:"right",editable:true},		
	   		{name:'note',index:'note', width:150, sortable:false,editable:true}		
	   	],
	   	rowNum:10,
	   	rowList:[10,20,30],
	   	pager: '#prowed3',
	   	sortname: 'id',
	    viewrecords: true,
	    sortorder: "desc",
		onSelectRow: function(id){
			if(id && id!==lastsel){
				jQuery('#rowed3').jqGrid('restoreRow',lastsel);
				jQuery('#rowed3').jqGrid('editRow',id,true);
				lastsel=id;
			}
		},
		editurl: "server.php",
		caption: "Using events example"
	});
  jQuery("#rowed3").jqGrid('navGrid',"#prowed3",{edit:false,add:false,del:false});
})

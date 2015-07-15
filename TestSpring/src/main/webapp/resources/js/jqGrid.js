/* 
* jqGrid  4.7.1  
* Copyright (c) 2008, Tony Tomov, tony@trirand.com 
*  License: http://guriddo.net/?page_id=103334 
*/
/*
 Guriddo jqGrid JS 4.7.0 (2014-12-08)
 Copyright (c) 2008, Tony Tomov, tony@trirand.com

 License: http://guriddo.net/?page_id=103334
*/

/*var mydata = [
{ id : "one", "name" : "row one" },
{ id : "two", "name" : "row two" },
{ id : "three", "name" : "row three" }
];*/
jQuery(document).ready(function(){ 
jQuery("#grid").jqGrid({
//$("#grid").jqGrid({ //set your grid id
//data: mydata, //insert data from the data object we created above
datatype: "json",
width: 500, //specify width; optional
colNames:['Id','Nombre'], //define column names
colModel:[
{name:'id', index:'id', key: true, width:50},
{name:'name', index:'name', width:100}
], //define column models
pager: '#pager', //set your pager div id
sortname: 'id', //the column according to which data is to be sorted; optional
viewrecords: true, //if true, displays the total number of records, etc. as: "View X to Y out of Z” optional
sortorder: "asc", //sort order; optional
caption:"jqGrid Example" //title of grid
});
});
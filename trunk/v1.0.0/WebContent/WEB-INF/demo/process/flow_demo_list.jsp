<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html >
<head>

<%@include file="/bsp/abdf/common.jsp"%>
<SCRIPT>
 function add_flow_demo()
 {
    var processId=flow_demo1_PROCESS_ITEM.getKey();
     var activityId=flow_demo1_PROCESS_ITEM.getValue();
    location.href="<%=baseURL%>/initSimpleProcessDemo_demo.do?wfss_processId="+processId+"&wfss_activityId="+activityId
     
 }
 
  function add_flow_demo2()
 {
     var processId=flow_demo2_PROCESS_ITEM.getKey();
     var activityId=flow_demo2_PROCESS_ITEM.getValue();
       location.href="<%=baseURL%>/initSimpleProcessDemo_demo.do?wfss_processId="+processId+"&wfss_activityId="+activityId
 }
 
   function add_flow_demo3()
 {
     var processId=flow_demo3_PROCESS_ITEM.getKey();
     var activityId=flow_demo3_PROCESS_ITEM.getValue();
       location.href="<%=baseURL%>/initSimpleProcessDemo_demo.do?wfss_processId="+processId+"&wfss_activityId="+activityId
 }
    function add_flow_demo4()
 {
     var processId=flow_demo4_PROCESS_ITEM.getKey();
     var activityId=flow_demo4_PROCESS_ITEM.getValue();
       location.href="<%=baseURL%>/initSimpleProcessDemo_demo.do?wfss_processId="+processId+"&wfss_activityId="+activityId
 }
     function add_flow_demo5()
 {
     var processId=flow_demo5_PROCESS_ITEM.getKey();
     var activityId=flow_demo5_PROCESS_ITEM.getValue();
       location.href="<%=baseURL%>/initSimpleProcessDemo_demo.do?wfss_processId="+processId+"&wfss_activityId="+activityId
 }
</SCRIPT>
</head>
<fe:body>
 <fe:topTable><fe:powerTool funCode="FLOW_DEMO" groupName="list" type="td"/></fe:topTable>
  <fe:span></fe:span>
 <fe:bottomTable></fe:bottomTable>
</fe:body>

</html>

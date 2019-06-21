<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>角色列表</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <link rel="stylesheet" href="./css/font.css">
        <link rel="stylesheet" href="./css/xadmin.css">
        <script src="./lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="./js/xadmin.js"></script>
        
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
        <script type="text/javascript" src="./js/jquerySession.js"></script>
        <script type="text/javascript">
        $(function(){
        /* 	 var arr=new Array();
        	 arr=$.session.get('arr');
        	 for ( var i = 0; i <arr.length; i++){
        		    alert(arr[i]);
        		} */
        	
        	$("#createVote").click(function(){
        		$.ajax({
            		url: "${pageContext.request.contextPath}/Create_pk2",
                    type: "POST",
                    dataType: "json",
                    data: { pkName: $("input[name='pkName']").val(),pkType:$("#pkType option:selected").val(),pkTurn:1},
                    success: function (result) {
                        alert(result.content);
                        window.location.href="${pageContext.request.contextPath}/create_pk?pages=0";
                    },
                    error: function (result) {
                        alert(err);
                    }
            	})
        	})
        	
        	wait=function(a){
        		alert("不可点击")
        	};
        	
			start1=function(a,b){
				
				$.ajax({
            		url: "${pageContext.request.contextPath}/updatsStatus",
                    type: "get",
                    dataType: "json",
                    data: { pkStatus:'开启',pkId:a},
                    success: function (result) {
                    	if(result.flag==0){
                    		alert(result.content);
                    	}else{
                    		 window.location.href="${pageContext.request.contextPath}/create_pk?pages="+b;
                    	}
                    },
                    error: function (err) {
                        alert(err);
                    }
            	})		
			};
			
			pause=function(a,b){
				$.ajax({
            		url: "${pageContext.request.contextPath}/updatsStatus",
                    type: "get",
                    dataType: "json",
                    data: { pkStatus:'暂停',pkId:a},
                    success: function (result) {
                    	if(result.flag==0){
                    		alert(result.content);
                    	}else{
                    		 window.location.href="${pageContext.request.contextPath}/create_pk?pages="+b;
                    	}
                    },
                    error: function (err) {
                        alert(err);
                    }
            	})	
			};
			
			end1=function(a,b){
				$.ajax({
            		url: "${pageContext.request.contextPath}/updatsStatus",
                    type: "get",
                    dataType: "json",
                    data: { pkStatus:'结束',pkId:a},
                    success: function (result) {
                    	if(result.flag==0){
                    		alert(result.content);
                    	}else{
                    		 window.location.href="${pageContext.request.contextPath}/create_pk?pages="+b;
                    	}
                    },
                    error: function (err) {
                        alert(err);
                    }
            	})	
			};
			
			addturn=function(add,a,b,c,d){
				$.ajax({
            		url: "${pageContext.request.contextPath}/Create_pk2",
                    type: "post",
                    dataType: "json",
                    data: {pkId:add, pkName:a,pkType:b,pkTurn:c+1},
                    success: function (result) {
                    	 alert(result.content);
                         window.location.href="${pageContext.request.contextPath}/create_pk?pages="+d;
                    },
                    error: function (err) {
                        alert(err);
                    }
                    
            	})	
			};
        	
			voteshow=function(a){
				 window.location.href="${pageContext.request.contextPath}/voteshow?pkId="+a;
			};
				
        })
        </script>
      
    </head>
    <body>
        <div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="">首页</a>
            <a href="">演示</a>
            <a>
              <cite>导航元素</cite></a>
          </span>
          <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
            <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
        </div>
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-body ">
                            <form class="layui-form layui-col-space5">
                                <div class="layui-inline layui-show-xs-block">
                                   <p>投票名称</p>
                                </div>
                          
                                <div class="layui-inline layui-show-xs-block">
                                    <input type="text" name="pkName"  placeholder="请输入投票名称" autocomplete="off" class="layui-input">
                                </div>
                                 <div class="layui-inline layui-show-xs-block">
                                   <p>投票类型</p>
                                </div>
                                 <div class="layui-inline layui-show-xs-block">
                                 	 <select name="modules" id="pkType"  lay-search="">
							     	      <option value="正票">正票</option>
							     	      <option value="倒票">倒票</option>
							     	      
									 </select>
                                </div>
                                <div class="layui-inline layui-show-xs-block">
                                    <p class="layui-btn" id="createVote" ><i class="layui-icon"></i>添加</p>
                                </div>
                            </form>
                        </div>
                        <div class="layui-card-header">
                            <button class="layui-btn layui-btn-danger" id="piliangdel" ><i class="layui-icon"></i>批量删除</button>    
                        </div>
                        <div class="layui-card-body ">
                            <table class="layui-table layui-form">
                              <thead>
                                <tr>
                                  <th>
                                    <input type="checkbox"  id="checkalls" lay-filter="checkalls"  lay-skin="primary">
                                  </th>
                                  <th style="width:5%">ID</th>
                                  <th>投票名称</th>
                                  <th>添加时间</th>
                                  <th>类型</th>
                                  <th>场次</th>
                                  <th style="width:300px">状态</th>
                                  <th>操作</th>
                              </thead>
                              <tbody id="checkBoxList">
                              <c:forEach items="${Pklist}" var="list" varStatus="num">
                              
                                <tr>
                                  <td>
                                    <input type="checkbox" name="cityId" class="cityId" id="selectdel"  lay-skin="primary" value="${list.pkId}">
                                  </td>
                                  <td>${num.index+1+fenye.page*6}</td>
                                  <td>${list.pkName}</td>
                                  <td>${list.addtime}</td>
                                  <td>${list.pkType}</td>
                                  <td>第${list.pkTurn}场</td>
                                  <td class="td-status">
     <span class="layui-btn" <c:if test="${list.pkStatus=='等待'}">style="background:red"</c:if> <c:if test="${list.pkStatus!='等待'}">style="background:silver; cursor:not-allowed;"</c:if>   >等待</span>
     <span class="layui-btn" <c:if test="${list.pkStatus=='开启'}">style="background:red"</c:if><c:if test="${list.pkStatus=='结束'}">style="background:silver; cursor:not-allowed;"</c:if> <c:if test="${list.pkStatus!='结束'}">onclick="start1(${list.pkId},${fenye.page})"</c:if> >开启</span>
     <span class="layui-btn" <c:if test="${list.pkStatus=='暂停'}">style="background:red"</c:if><c:if test="${list.pkStatus=='结束'}">style="background:silver; cursor:not-allowed;"</c:if>     <c:if test="${list.pkStatus!='结束'}">onclick="pause(${list.pkId},${fenye.page})"</c:if>  >暂停</span>
     <span class="layui-btn" <c:if test="${list.pkStatus=='结束'}">style="background:red"</c:if>  onclick="end1(${list.pkId},${fenye.page})">结束</span></td>
                               	 <td class="td-manage">
                                 	 <span  class="layui-btn" onclick="voteshow(${list.pkId})">查看</span>
                                    <button class="layui-btn" onclick="addturn(${list.pkId},'${list.pkName}','${list.pkType}',${list.pkTurn},${fenye.page})"><i class="layui-icon"></i>添加场次</button>                      
                                  </td>
                                </tr>
                                </c:forEach>
                              </tbody>
                            </table>
                        </div>
                        <div class="layui-card-body ">
                            <div class="page">
                                <div>
                                
                                  
                                  
                                 
                       
                        <c:if test="${fenye.page==0}">
                                  <span class="current">${fenye.page+1}</span>
                                  <a class="num" href="${pageContext.request.contextPath}/create_pk?pages=1">${fenye.page+2}</a>
                                  <a class="num" href="${pageContext.request.contextPath}/create_pk?pages=2">${fenye.page+3}</a>
                                   <span class="current">共${ fenye.totalpage+1}页</span>
                                   <a class="next" href="${pageContext.request.contextPath}/create_pk?pages=1">&gt;&gt;</a> 
                        </c:if>
                     
                         <c:if test="${fenye.page !=0  && fenye.page != fenye.totalpage}">
                             <a class="prev" href="${pageContext.request.contextPath}/create_pk?pages=${fenye.page-1}">&lt;&lt;</a>
                                  <a class="num" href=" ${pageContext.request.contextPath}/create_pk?pages=${fenye.page-1}">${fenye.page}</a>
                                  <span class="current">${fenye.page+1}</span>
                                  <a class="num" href="${pageContext.request.contextPath}/create_pk?pages=${fenye.page+1}">${fenye.page+2}</a>
                            <span class="current">共${ fenye.totalpage+1}页</span>
                                   <a class="next" href="${pageContext.request.contextPath}/create_pk?pages=${fenye.page+1}">&gt;&gt;</a> 
                         </c:if>
                         
                          <c:if test="${fenye.page==fenye.totalpage}">
                           <a class="prev" href="${pageContext.request.contextPath}/create_pk?pages=${fenye.page-1}">&lt;&lt;</a>
                                  <a class="num" href="${pageContext.request.contextPath}/create_pk?pages=${fenye.page-2}">${fenye.page-1}</a>
                                  <a class="num" href="${pageContext.request.contextPath}/create_pk?pages=${fenye.page-1}">${fenye.page} </a>
                                   <span class="current">${fenye.page+1}</span>
                                    <span class="current">共${ fenye.totalpage+1}页</span>
                          </c:if>
                                 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
    </body>
    <script>
      layui.use(['laydate','form'], function(){
        var laydate = layui.laydate;
        var form = layui.form;
        
        form.on('checkbox(checkalls)', function (data) {
            var a = data.elem.checked;
            if (a == true) {
                $(".cityId").prop("checked", true);
                form.render('checkbox');
            } else {
                $(".cityId").prop("checked", false);
                form.render('checkbox');
            }
            
        });
        
      /*   form.on('checkbox(cityId)', function (data) {
        	 $("input:checkbox[name='cityId']:checked").each(function(i){
                 alert($(this).val())
             });
   	 */
            
        });
        
        

      });
      
     /*  $("#piliangdel").click(function(){
    	  var arr=new Array();
    	  $("input:checkbox[name='cityId']:checked").each(function(i){
              arr.push($(this).val())
          });
    	/*   $.session.set('arr',arr) */
	
		}) */
		
		

     
     </script>
</html>
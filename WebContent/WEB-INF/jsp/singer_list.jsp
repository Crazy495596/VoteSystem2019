<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
       <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    	<script src="./lib/layui/layui.js" charset="UTF-8"></script>
        <script type="text/javascript" src="./js/xadmin.js"></script>
        <script>
        $(function(){
        	layui.use('form', function(){
            var form = layui.form;
            
        	//全选
        	form.on('checkbox(checkall)', function(data){
        		if($("#checkall").prop('checked')){
        			$("#singer_lists input[type=checkbox]").each(function() {
            			$(".checkd").prop("checked", true);
        			});
        		} else {
        			$("#singer_lists input[type=checkbox]").each(function() {
        				$(this).prop("checked", false);
        			});
        		}
        	});
        	
        	
        	
        	
        })
   	
        		      
   });
        </script>
        <!--[if lt IE 9]>
          <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
          <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
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
                                    <input type="text" name="username"  placeholder="请输入用户名" autocomplete="off" class="layui-input">
                                </div>
                                <div class="layui-inline layui-show-xs-block">
                                    <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
                                </div>
                            </form>
                        </div>
                        <div class="layui-card-header">
                            <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
                            <button class="layui-btn" onclick="xadmin.open('添加用户','./add_singer',600,400)"><i class="layui-icon"></i>添加</button>
                        </div>
                        <div class="layui-card-body ">
                            <table class="layui-table layui-form">
                              <thead>
                                <tr>
                                  <th>
                                    <input type="checkbox" id="checkall" name="checkall"  lay-skin="primary" lay-filter="checkall">
                                  </th>
                                  <th>编号</th>
                                  <th>歌手名</th>
                                  <th>性别</th>
                                  <th>添加时间</th>
                                  <th>操作</th>
                              </thead>
                              <tbody id="singer_lists">
                              <c:forEach items="${singers}" var="item" varStatus="num">
                                <tr>
	                                  <td>
	                                    <input type="checkbox" class="checkd" name="checkd"  lay-skin="primary">
	                                  </td>
	                                  <td>${num.index+1}</td>
	                                  <td>${item.singerName}</td>
	                                  <td> <c:if test="${item.singerSex==1}">男</c:if>
       										<c:if test="${item.singerSex==0}">女</c:if>
       								  </td>
	                                  <td>${item.addtime}</td>
	                                  <td class="td-manage">
	                                   <!--  <a onclick="member_stop(this,'10001')" href="javascript:;"  title="启用">
	                                      <i class="layui-icon">&#xe601;</i>
	                                    </a>
	                                    <a title="编辑"  onclick="xadmin.open('编辑','role-add.html')" href="javascript:;">
	                                      <i class="layui-icon">&#xe642;</i>
	                                    </a> -->
	                                    <a title="删除" onclick="member_del(this,${item.singerId})" href="javascript:;">
	                                      <i class="layui-icon">&#xe640;</i>
	                                    </a>
	                                  </td>
                                </tr>
                               </c:forEach>
                              </tbody>
                            </table>
                        </div>
                        <div class="layui-card-body ">
                            <div class="page">
                                <div>
                                  <a class="prev" href="">&lt;&lt;</a>
                                  <a class="num" href="">1</a>
                                  <span class="current">2</span>
                                  <a class="num" href="">3</a>
                                  <a class="num" href="">489</a>
                                  <a class="next" href="">&gt;&gt;</a>
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
        
        //执行一个laydate实例
        laydate.render({
          elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
          elem: '#end' //指定元素
        });
      });

       /*用户-停用*/
      function member_stop(obj,id){
          layer.confirm('确认要停用吗？',function(index){

              if($(obj).attr('title')=='启用'){

                //发异步把用户状态进行更改
                $(obj).attr('title','停用')
                $(obj).find('i').html('&#xe62f;');

                $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                layer.msg('已停用!',{icon: 5,time:1000});

              }else{
                $(obj).attr('title','启用')
                $(obj).find('i').html('&#xe601;');

                $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                layer.msg('已启用!',{icon: 5,time:1000});
              }
              
          });
      }

      /*用户-删除*/
      function member_del(obj,id){
          layer.confirm('确认要删除吗？',function(index){
        	var url = '${pageContext.request.contextPath}/singer_del';
          	var param = {singerId:id};
          	$.post(url, param, function (data) {       		
          		layer.msg('已删除!',{icon:1,time:1000});
          		if(data.flag == 1){
                  	location.href='${pageContext.request.contextPath}/singer_list';
                  } 
              });
              
          });
      }



      function delAll (argument) {

        var data = tableCheck.getData();
  
        layer.confirm('确认要删除吗？'+data,function(index){
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
      }
    </script>
    <script>
    	 var _hmt = _hmt || []; (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
      })(); 
    </script>
</html>
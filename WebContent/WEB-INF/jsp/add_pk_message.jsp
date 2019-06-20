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
        <script type="text/javascript">
        $(function(){
        	$("#createpkmess").click(function(){
        		var messPkid=$("#messPkid option:selected").val();
        		var messSingerid=$("#messSingerid option:selected").val();
        		var messMusic=$("input[name='messMusic']").val();
        		
        		$.ajax({
            		url: "${pageContext.request.contextPath}/create_pkmessae",
                    type: "POST",
                    dataType: "json",
                    data: { messPkid:messPkid,messSingerid:messSingerid,messMusic:messMusic},
                    success: function (result) {
                        alert(result.content);
                        window.location.href="${pageContext.request.contextPath}/add_pk_message";
                    },
                    error: function (result) {
                        alert(err);
                    }
            	})
            	
        		
        	})
        	
        	
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
                                 	 <select name="modules" id="messPkid"  lay-search="">
                                 	 <c:forEach items="${pklist}" var="pk">
                                 		  <option value="${pk.pkId}">${pk.pkName}</option>
                                 	 </c:forEach>
							     	     
							     	     
							     	      
									 </select>
                                </div>
                                
                                 <div class="layui-inline layui-show-xs-block">
                                   <p>参赛选手</p>
                                </div>
                                 <div class="layui-inline layui-show-xs-block">
                                 	 <select name="modules" id="messSingerid"  lay-search="">
							     	     <c:forEach items="${singerlist}" var="singer">
                                 		  <option value="${singer.singerId}">${singer.singerName}</option>
                                 	 </c:forEach>
							     	      
									 </select>
                                </div>
                                
                                   <div class="layui-inline layui-show-xs-block">
                                   <p>歌曲名称</p>
                                </div>
                          
                                <div class="layui-inline layui-show-xs-block">
                                    <input type="text" name="messMusic"  placeholder="请输入歌曲名称" autocomplete="off" class="layui-input">
                                </div>
                                
                                <div class="layui-inline layui-show-xs-block">
                                    <p class="layui-btn" id="createpkmess" >确定</p>
                                </div>
                            </form>
                        </div>
                        <div class="layui-card-header">
                            <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>    
                        </div>
                        <div class="layui-card-body ">
                            <table class="layui-table layui-form">
                              <thead>
                                <tr>
                                  <th>
                                    <input type="checkbox" name=""  lay-skin="primary">
                                  </th>
                                  <th>ID</th>
                                  <th>pk名称</th>
                                  <th>参赛选手</th>
                                  <th>演唱歌曲</th>
                                   <td>得分</td>
                                  <th>添加时间</th>
                                  <th>操作</th>
                              </thead>
                              <tbody>
                              <c:forEach items="${pkmessagelist}" var="list" varStatus="num">
                              
                                <tr>
                                  <td>
                                    <input type="checkbox" name=""  lay-skin="primary" value="${list.messageId}">
                                  </td>
                                  <td>${num.index+1}</td>
                                  <td>${list.pkName}</td>
                                  <td>${list.singerName}</td>
                                  <td>${list.messMusic}</td>
                                   <td>${list.votesum}</td>
                                  <td>${list.addtime}</td>
                                    
                                 	 <td class="td-manage">
                                   <span class="layui-btn layui-btn-normal layui-btn-mini">删除</span>
                                                     
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
              //发异步删除数据
              $(obj).parents("tr").remove();
              layer.msg('已删除!',{icon:1,time:1000});
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
    <script>var _hmt = _hmt || []; (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
      })();</script>
</html>
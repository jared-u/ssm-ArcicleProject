<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String localPath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    Date date = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String nowDate = sdf.format(date);
%>
<html>
<head>
    <title>后台管理</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<%=localPath%>/static/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=localPath%>/static/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="<%=localPath%>/static/layui/css/layui.css"/>
 
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo" style="font-size: 17px;"><strong>文章管理系统</strong></div>
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="<%=localPath%>/page" style="text-decoration: none;"><strong>首页</strong></a></li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;" style="text-decoration: none;">
                    <img src="<%=localPath%>/static/img/avatar.jpg" class="layui-nav-img">
                    <strong>${sessionScope.name}</strong>
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="#" style="text-decoration: none;"><strong>基本资料</strong></a></dd>
                    <dd><a href="#" style="text-decoration: none;"><strong>安全设置</strong></a></dd>
                    <hr/>
                    <dd><a href="<%=localPath%>/outLogin" style="text-decoration: none;;"><strong>退出登录</strong></a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a style="text-decoration: none">
                    <span class="fa fa-github"></span>
                    <strong>Github</strong>
                </a>
                <dl class="layui-nav-child">
                    <dd><a style="text-decoration: none;"><strong>联系Leader</strong></a></dd>
                    <hr/>
                    <dd><a style="text-decoration: none;"><strong>github地址</strong></a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="<%=localPath%>/outLogin" style="text-decoration: none;;"><strong>退出</strong></a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item">
                    <a style="text-decoration: none;"><strong><span class="fa fa-leaf fa-fw"></span>&nbsp;&nbsp;&nbsp;文章管理</strong></a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" onclick="javascript: toArticleManage();" style="text-decoration: none;"><strong>文章列表</strong></a></dd>
                        <dd><a href="javascript:;" onclick="javascript: toArticleWrite();" style="text-decoration: none;"><strong>文章草稿</strong></a></dd>
                        <dd><a href="javascript:;" onclick="javascript: toArticleTrash();" style="text-decoration: none;"><strong>回收站</strong></a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                	<a href="#" style="text-decoration: none;">
                		<strong>
                			<span class="fa fa-twitter fa-fw"></span>&nbsp;&nbsp;&nbsp;关于我们
                		</strong>
                	</a>
                </li>
                <li class="layui-nav-item">
	                <a href="#" style="text-decoration: none;">
	                	<strong>
	                		<span class="fa fa-send-o fa-fw"></span>&nbsp;&nbsp;&nbsp;联系我们
	                	</strong>
	                </a>
                </li>
            </ul>
        </div>
    </div>
    <!-- 以上都是共享内容 -->
	
    <!-- 内容主体区域 -->
    <div class="layui-body">
        <div id="content">
            <div style="font-size: 45px;color: #00FFFF;margin-top: 300px;" class="text-center"><strong>欢迎登录后台管理系统</strong></div>
            <p class="text-center">
                <strong style="color: #00FFFF;">本系统由各种Copy来的代码实现功能以及页面的美化</strong>
            </p>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        <strong>©&nbsp;2019 后台管理系统&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;---->&nbsp;Update by Jared</strong>
        <strong class="layui-layout-right">系统时间：<%=nowDate%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>
    </div>
</div>
</body>
<script src="<%=localPath%>/static/layui/layui.js"></script>
<script src="<%=localPath%>/static/js/bootstrap.min.js"></script>
<script src="<%=localPath%>/static/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
    layui.use('element', function(){
        var element = layui.element;
    });
</script>
<script type="text/javascript">
    function toArticleWrite() {
        document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"<%=localPath%>/article/toArticleWrite\" width=\"100%\" height=\"100%\"></object>";
    }
    function toArticleManage() {
        document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"<%=localPath%>/article/toArticleManage\" width=\"100%\" height=\"100%\"></object>";
    }
    function toArticleTrash() {
        document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"<%=localPath%>/article/toArticleTrash\" width=\"100%\" height=\"100%\"></object>";
    }
</script>
</html>
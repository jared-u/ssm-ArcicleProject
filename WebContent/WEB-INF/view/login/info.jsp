<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String localPath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
    <link rel="stylesheet" href="<%=localPath%>/static/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=localPath%>/static/layui/css/layui.css"/>
    <link rel="stylesheet" href="<%=localPath%>/static/css/font-awesome.min.css"/>
    <style type="text/css">
        .header{
            background-image: url("<%=localPath%>/static/img/santis.jpeg");
            background-size: 100%;
            height: 240px;
        }
        #labela{
			color:white;
			text-decoration: none;
		}
		#labela:hover {
			color:#fef123;
		}
    </style>
</head>
<body>
<div class="header">
    <div style="margin: 0 45% 0 45%;padding-top:5%;text-align:center;">
        <div style="height:19%;width:90%;background:black;text-align:center;">
            <h2 style="font-family: Menlo;color:white;padding-top:5%;"><strong>Jared</strong></h2>
        </div>
        <h4 style="margin-top:19%;margin-left:-10%; color:white;">
            &nbsp;
            <span style="font-size:20px;" class="fa fa-github fa-fw"></span>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span style="font-size:20px;" class="fa fa-home fa-fw"></span>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span style="font-size:20px;" class="fa fa-linkedin fa-fw"></span>
            <br/>
            <label><a href="https://github.com/Jaredtop" id="labela" target="_block">GitHub</a></label>
            &nbsp;&nbsp;&nbsp;
            <label><a href="http://blog.jared.top" id="labela">Blog</a></label>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <label><a href="https://www.zhihu.com/people/tomo-83-82/activities" id="labela">ZhiHu</a></label>
        </h4>
    </div>
</div>

<div class="container">
    <div class="text-center">
        <br/>
        <br/>
        <br/>
        <br/>
        <h1 style="color:#009688">错误信息</h1>
        <hr/>
        <br/>
        <h3 style="color:#FF5722">${message}</h3>
        <br/>
        <br/>
        <button class="btn btn-primary btn-lg" type="button"><a href="<%=localPath%>/index" style="text-decoration: none;color:white;">点击我返回登录页面</a></button>
    </div>
</div>
</body>
</html>

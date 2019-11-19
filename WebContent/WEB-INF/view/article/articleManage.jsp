<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String localPath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=localPath%>/static/layui/css/layui.css"/>
    <link rel="stylesheet" href="<%=localPath%>/static/css/bootstrap.min.css"/>
</head>
<body>
<div class="container" style="width: 90%;">
    <br/>
    <br/>
    <c:if test="${sessionScope.identity_id != 4}">
        <fieldset class="layui-elem-field layui-field-title">
            <legend style="margin-left: 20px;padding: 0 10px;text-align: left;width: 170px;border-bottom: none;"><strong>文章信息列表</strong></legend>
        </fieldset>
        <br/>
        <h5 style="margin-top: -20px;">
            <i class="fa fa-paper-plane-o fa-fw" style="color: #299A74"></i>
            <span style="color: #299A74;"><strong>输入查询信息</strong></span>
        </h5>
        <hr style="margin-top: 0;"/>
        <div class="form table">
            <div>
                <form class="layui-form form-inline" action="<%=localPath%>/article/findByPage" role="form" method="post">
                    <div class="layui-form-item">
                        <label class="layui-form-label" style="margin-left: -10px;padding-left:0;"><strong>文章作者</strong></label>
                        <div class="layui-input-inline">
                            <input name="a_name" placeholder="请输入文章作者姓名查询" class="layui-input" type="text">
                        </div>
                        <label class="layui-form-label" style="width:8%;"><strong>审核状态</strong></label>
                        <div class="layui-input-inline" style="width: 100px;">
                            <select name="r_verify">
                                <option></option>
                                <option>已审核</option>
                                <option>未审核</option>
                            </select>
                        </div>
                        <label class="layui-form-label" style="width:8%;"><strong>发布状态</strong></label>
                        <div class="layui-input-inline" style="width: 100px;">
                            <select name="r_publish">
                                <option></option>
                                <option>已发布</option>
                                <option>未发布</option>
                            </select>
                        </div>
                        <label class="layui-form-label" style="width:8%;"><strong>存在状态</strong></label>
                        <div class="layui-input-inline" style="width: 100px;">
                            <select name="r_status">
                                <option></option>
                                <option>存在</option>
                                <option>已删除</option>
                            </select>
                        </div>
                        <div class="layui-input-inline" style="margin-left: 50px;">
                            <button class="layui-btn" type="submit">查询</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </c:if>
    <h5>
        <i class="fa fa-paper-plane-o fa-fw" style="color: #299A74"></i>
        <span style="color: #299A74;"><strong>查询结果展示</strong></span>
    </h5>
    <hr style="margin-top: 0;"/>
    <c:if test="${sessionScope.identity_id != 4}">
        <div class="layui-inline">
            <button type="button" id="cleanBtnMore" class="layui-btn layui-btn-danger">批量删除</button>
            <a href="<%=localPath%>/article/toArticleWrite"><button type="button" id="addBtn" class="layui-btn layui-btn">添加文章</button></a>
        </div>
    </c:if>
    <br/>
    <br/>
    <div class="table-responsive">
        <table class="table table-striped table-hover" id="countTable">
            <thead>
            <tr>
                <th style="text-align: center"><input type="checkbox" id="all" onclick="selectAll(this);"/></th>
                <th style="text-align:center;">文章编号</th>
                <th style="text-align: center">文章简介</th>
                <th style="text-align: center">文章作者</th>
                <th style="text-align: center">发表日期</th>
                <c:if test="${sessionScope.identity_id != 4}">
                    <th style="text-align: center">审核状态</th>
                    <th style="text-align: center">发布状态</th>
                    <th style="text-align: center">存在状态</th>
                    <th style="text-align: center;">操作</th>
                </c:if>
            </tr>
            </thead>
            <tbody style="text-align: center">
            <c:forEach items="${requestScope.page.beanList}" var="article">
                <tr>
                    <td><input class="r_id" name="r_id" value="${article.r_id}" type="checkbox"/></td>
                    <td>${article.r_id}</td>
                    <td>${article.r_summary}</td>
                    <td>${article.r_author}</td>
                    <td>${article.r_date}</td>
                    <c:if test="${sessionScope.identity_id != 4}">
                        <td>
                            <c:if test="${article.r_verify == 0}">
                                <label style="color: #FF5722">未审核</label>
                            </c:if>
                            <c:if test="${article.r_verify == 1}">
                                已审核
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${article.r_publish == 0}">
                                未发布
                            </c:if>
                            <c:if test="${article.r_publish == 1}">
                                已发布
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${article.r_status == 0}">
                                存在
                            </c:if>
                            <c:if test="${article.r_status == 1}">
                                <label style="color: #FF5722">已删除</label>
                            </c:if>
                        </td>
                        <td>
                            <a href="<%=localPath%>/article/toArticleView?r_id=${article.r_id}"><button type="button" class="layui-btn layui-btn-sm">查看</button></a>
                            <a href="<%=localPath%>/article/toEditPage?r_id=${article.r_id}"><button type="button" class="layui-btn layui-btn-sm layui-btn-normal">编辑</button></a>
                            <button type="button" onclick="return clean(${article.r_id});" class="layui-btn layui-btn-sm layui-btn-danger">删除</button>
                        </td>
                    </c:if>
                	 <c:if test="${sessionScope.identity_id != 4}">
                        <td>
                            <a href="<%=localPath%>/article/toArticleView?r_id=${article.r_id}"><button type="button" class="layui-btn layui-btn-sm">查看文章</button></a>
                        </td>
                    </c:if>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <form class="listForm" name="listForm" method="post" action="<%=localPath%>/article/findByPage">
        <div class="row">
            <div class="form-inline" style="margin-left: 15px;">
                <label style="font-size:14px;margin-top:22px;">
                    <strong>共<b>${requestScope.page.totalCount}</b>条记录，共<b>${requestScope.page.totalPage}</b>页</strong>
                    &nbsp;
                    &nbsp;
                    <strong>每页显示</strong>
                    <select class="form-control" name="pageSize">
                        <option value="2"
                                <c:if test="${requestScope.page.pageSize == 2}">selected</c:if> >2
                        </option>
                        <option value="3"
                                <c:if test="${requestScope.page.pageSize == 3}">selected</c:if> >3
                        </option>
                        <option value="4"
                                <c:if test="${requestScope.page.pageSize == 4}">selected</c:if> >4
                        </option>
                        <option value="5"
                                <c:if test="${requestScope.page.pageSize == 5}">selected</c:if> >5
                        </option>
                    </select>
                    <strong>条</strong>
                    &nbsp;
                    &nbsp;
                    <strong>到第</strong>&nbsp;<input type="text" size="3" id="page" name="pageCode"
                                                    class="form-control input-sm"
                                                    style="width:11%"/>&nbsp;<strong>页</strong>
                    &nbsp;
                    <button type="submit" class="btn btn-sm btn-info">GO!</button>
                </label>
                <ul class="pagination" style="float:right;">
                    <li>
                        <a href="<%=localPath%>/article/findByPage?pageCode=1&pageSize=${requestScope.page.pageSize}"><strong>首页</strong></a>
                    </li>
                    <li>
                        <c:if test="${requestScope.page.pageCode > 2}">
                            <a href="<%=localPath%>/article/findByPage?pageCode=${requestScope.page.pageCode - 1}&pageSize=${requestScope.page.pageSize}">&laquo;</a>
                        </c:if>
                    </li>

                    <!-- 写关于分页页码的逻辑 -->
                    <c:choose>
                        <c:when test="${requestScope.page.totalPage <= 5}">
                            <c:set var="begin" value="1"/>
                            <c:set var="end" value="${requestScope.page.totalPage}"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="begin" value="${requestScope.page.pageCode - 1}"/>
                            <c:set var="end" value="${requestScope.page.pageCode + 3}"/>

                            <!-- 头溢出 -->
                            <c:if test="${begin < 1}">
                                <c:set var="begin" value="1"/>
                                <c:set var="end" value="5"/>
                            </c:if>

                            <!-- 尾溢出 -->
                            <c:if test="${end > requestScope.page.totalPage}">
                                <c:set var="begin" value="${requestScope.page.totalPage -4}"/>
                                <c:set var="end" value="${requestScope.page.totalPage}"/>
                            </c:if>
                        </c:otherwise>
                    </c:choose>

                    <!-- 显示页码 -->
                    <c:forEach var="i" begin="${begin}" end="${end}">
                        <!-- 判断是否是当前页 -->
                        <c:if test="${i == requestScope.page.pageCode}">
                            <li class="active"><a href="javascript:void(0);">${i}</a></li>
                        </c:if>
                        <c:if test="${i != requestScope.page.pageCode}">
                            <li>
                                <a href="<%=localPath%>/article/findByPage?pageCode=${i}&pageSize=${requestScope.page.pageSize}">${i}</a>
                            </li>
                        </c:if>
                    </c:forEach>

                    <li>
                        <c:if test="${requestScope.page.pageCode < requestScope.page.totalPage}">
                            <a href="<%=localPath%>/article/findByPage?pageCode=${requestScope.page.pageCode + 1}&pageSize=${requestScope.page.pageSize}">&raquo;</a>
                        </c:if>
                    </li>
                    <li>
                        <a href="<%=localPath%>/article/findByPage?pageCode=${requestScope.page.totalPage}&pageSize=${requestScope.page.pageSize}"><strong>末页</strong></a>
                    </li>
                </ul>
            </div>
        </div>
    </form>
</div>
</body>
<script src="<%=localPath%>/static/js/jquery-3.3.1.min.js"></script>
<script src="<%=localPath%>/static/layui/layui.all.js"></script>
<script src="<%=localPath%>/static/js/bootstrap.min.js"></script>
<script type="text/javascript">
    layui.use('element', function () {
        var element = layui.element;
    });
</script>
<script type="text/javascript">
    //删除
    function clean(r_id){
        layer.open({
            title: '警告信息',
            content: '你确定要删除？（文章将保存在回收站中）',
            btn: ['确定','取消'],
            btn1: function(index,layero){
                $.ajax({
                    url: '<%=localPath%>/article/clean',
                    type: 'POST',
                    data: {r_id: r_id},
                    success: function(data){
                        layer.open({
                            title: '提示信息',
                            content: '删除成功',
                            time: 2000
                        });
                        $("body").html(data);
                    },
                    error: function(){
                        layer.open({
                            title: '提示信息',
                            content: '删除失败'
                        });
                    }
                });
                layer.close(index);
            }
        });
    }

    //编辑
    function edit(r_id){
        $.ajax({
            url: '<%=localPath%>/article/toEditPage.do',
            type: 'GET',
            data: {r_id: r_id},
            success: function(data){
                $("body").html(data);
            },
            error: function(){
                layer.open({
                    title: '提示信息',
                    content: '发生错误'
                });
            }
        });
    }

    $("#cleanBtnMore").click(function(){
        layer.open({
            title: '警告信息',
            content: '你确定要删除所选文章吗？',
            btn: ['确定','取消'],
            btn1: function(index,layero){
                layer.close(index);
            }
        });
    });

    //全选
    function selectAll(obj){
    	$(".r_id").prop("checked",obj.checked);
    }
</script>
</html>

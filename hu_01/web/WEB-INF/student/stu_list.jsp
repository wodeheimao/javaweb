<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <style>
        .table{
            margin-top: 10px;
        }
        .table th, .table td {
            text-align: center;
            vertical-align: middle !important;
        }
    </style>
    <title>学生列表</title>
    <link rel="stylesheet" href="/bootstrap-3.3.7/css/bootstrap.min.css">
    <script src="/bootstrap-3.3.7/js/jquery.min.js"></script>
    <script src="/bootstrap-3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
<div class="container">
    <div class="page-header">
        <h3>
            <small>
                学生列表信息
            </small>
        </h3>
    </div>

    <div class="panel panel-success">
        <div class="panel-heading">
            学生列表
        </div>
        <div class="panel-body">

                    <div class="row">
                        <div class="col-md-3">
                        </div>
                        <div class="col-md-1">
                            <a href="/student?method=list" class="btn btn-default">查询</a>
                        </div>
                        <div class="col-md-4">
                        </div>
                        <div class="col-md-1">
                            <a class="btn btn-default" data-toggle="modal" data-target="#addStu">新增</a>
                            <%--新增的弹窗--%>
                            <div class="modal fade" id="addStu">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="close">
                                                <span>&times;</span></button>
                                            <h4>新增学生</h4>
                                        </div>
                                        <div class="modal-body">
                                            <form action="/student?method=addStudent" method="post"  class="form-horizontal">
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">学生姓名</label>
                                                    <div class="col-md-10">
                                                        <input type="text" name="sname" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">学生年龄</label>
                                                    <div class="col-md-10">
                                                        <input type="text" name="sage" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">学生性别</label>
                                                    <div class="col-md-10">
                                                        <div class="radio">
                                                            <label>
                                                                <input type="radio" name="sex" value="男" checked>男
                                                            </label>
                                                            <label>
                                                                <input type="radio" name="sex" value="女">女
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">学生住址</label>
                                                    <div class="col-md-10">
                                                        <input type="text" name="addr" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">班级</label>
                                                    <div class="col-md-10">
                                                        <select class="form-control" name="cid">
                                                            <option value="1">1301班</option>
                                                            <option value="2">1302班</option>
                                                            <option value="3">1305班</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <input type="button"  value="关闭" class=" btn btn-default" data-dismiss="modal">
                                                    <input type="submit" value="保存" class="btn btn-primary">
                                                </div>
                                            </form>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>

            </div>


            <table class="table table-bordered table-hover table-striped">
                <tr>
                    <th>学号</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>年龄</th>
                    <th>住址</th>
                    <th>所在班级</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${students}" var="stud">
                    <tr>
                        <td>${stud.sid}</td>
                        <td>${stud.sname}</td>
                        <td>${stud.sex}</td>
                        <td>${stud.age}</td>
                        <td>${stud.addr}</td>
                        <td>${stud.cname}</td>
                        <td>
                            <a href="/student?method=updateStudent&sid=${stud.sid}" class="glyphicon glyphicon-pencil btn btn-success btn-sm">修改</a>
                            <a href="/student?method=deleteStudent&sid=${stud.sid}" class="glyphicon glyphicon-trash btn btn-danger btn-sm">删除</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div class="panel-footer text-right">
            泽林教育2000-2019.
        </div>
    </div>
</div>
</body>
</html>
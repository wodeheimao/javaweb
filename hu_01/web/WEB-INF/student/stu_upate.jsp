<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改学生</title>
    <link rel="stylesheet" href="/bootstrap-3.3.7/css/bootstrap.min.css">
    <script src="/bootstrap-3.3.7/js/jquery.min.js"></script>
    <script src="/bootstrap-3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header">
            <h4>修改学生</h4>
        </div>
        <div class="modal-body">
            <form action="/student?method=addStudent" method="post" class="form-horizontal">
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
                    <input type="button" value="关闭" class=" btn btn-default" data-dismiss="modal">
                    <input type="submit" value="保存" class="btn btn-primary">
                </div>
            </form>
        </div>

    </div>
</div>
</body>
</html>

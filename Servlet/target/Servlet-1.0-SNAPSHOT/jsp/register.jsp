<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <title>register Page</title>

    <!-- 本地CSS文件 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap-icons.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/overlayscrollbars.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/adminlte.css"/>

    <style>
        html,
        body {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f8f9fa;
        }

        .login-box {
            max-width: 400px;
            width: 100%;
            padding: 20px;
        }

        .login-logo P {
            font-size: 32px;
            font-weight: 400;
            color: gray;
        }

        .textSize {
            font-size: 12px;
        }
    </style>
</head>

<body class="login-page bg-body-secondary">
<div class="login-box">
    <div class="login-logo" style="text-align: center;">
        <p>EasyMeal</p>
    </div>
    <div class="card">
        <div class="card-body login-card-body">
            <p class="login-box-msg" style="text-align: center;">注册界面</p>

            <!-- 注册表单 -->
            <form action="${pageContext.request.contextPath}/register" method="post" style="margin-bottom: 50px;">
                <div class="input-group mb-3">
                    <input type="text" class="form-control" name="username" placeholder="用户名" required/>
                </div>
                <div class="input-group mb-3">
                    <input type="text" class="form-control" name="account" placeholder="昵称" required/>
                </div>
                <div class="input-group mb-3">
                    <input type="password" class="form-control" name="password" placeholder="密码" required/>
                </div>
                <div class="input-group mb-3">
                    <input type="password" class="form-control" name="confirmPassword" placeholder="再次密码" required/>
                </div>
                <div class="input-group mb-3">
                    <input type="password" class="form-control" name="adminPassword" placeholder="管理员密码，若无留空"/>
                </div>

                <!-- 注册按钮 -->
                <div class="social-auth-links text-center mb-3 d-grid gap-2" style="margin-top: 10px;">
                    <button type="submit" class="btn btn-primary">注册</button>
                </div>
            </form>

            <p class="mb-0 textSize">
                <a href="${pageContext.request.contextPath}/login.jsp" class="text-center">已经有账号？</a>
            </p>
        </div>
    </div>
</div>
</body>

</html>

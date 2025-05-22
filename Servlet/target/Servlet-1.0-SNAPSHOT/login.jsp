<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <title>Login Page</title>

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
            <p class="login-box-msg" style="text-align: center;">登录界面</p>

            <!-- 登录表单 -->
            <form action="${pageContext.request.contextPath}/login" method="post" style="margin-bottom: 50px;">
                <div class="input-group mb-3">
                    <input type="text" class="form-control" name="username" placeholder="用户名" required/>
                </div>
                <div class="input-group mb-3">
                    <input type="password" class="form-control" name="password" placeholder="密码" required/>
                </div>

                <div>
                    <p class="mb-1 textSize" style="text-align: right;"><a href="#">忘记密码</a></p>
                </div>

                <!-- 登录按钮 -->
                <div class="social-auth-links text-center mb-3 d-grid gap-2" style="margin-top: 10px;">
                    <button type="submit" class="btn btn-primary">登录</button>
                </div>
            </form>

            <p class="mb-0 textSize">
                <a href="${pageContext.request.contextPath}/register.jsp" class="text-center">注册一个新账号</a>
            </p>
        </div>
    </div>
</div>
</body>

</html>

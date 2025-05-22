<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
  <meta charset="UTF-8">
  <title>主页</title>
  <style>
    body {
      margin: 0;
      font-family: Arial, sans-serif;
      display: flex;
    }

    .sidebar {
      width: 200px;
      height: 100vh;
      background-color: #2c3e50;
      padding-top: 20px;
    }

    .sidebar a {
      display: block;
      color: white;
      padding: 12px 16px;
      text-decoration: none;
    }

    .sidebar a:hover {
      background-color: #34495e;
    }

    .content {
      flex-grow: 1;
      height: 100vh;
    }

    iframe {
      width: 100%;
      height: 100%;
      border: none;
    }
  </style>
</head>
<body>

<!-- 侧边栏 -->
<div class="sidebar">
  <a href="content/welcome.jsp" target="mainFrame">首页</a>
  <a href="content/product.jsp" target="mainFrame">商品</a>
  <a href="content/order.jsp" target="mainFrame">订单</a>
  <a href="content/user.jsp" target="mainFrame">用户</a>
  <a href="content/about.jsp" target="mainFrame">关于</a>
</div>

<!-- 内容区域 -->
<div class="content">
  <iframe name="mainFrame" src="content/welcome.jsp"></iframe>
</div>

</body>
</html>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>主页 - 带侧边栏</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            margin: 0;
            overflow-x: hidden;
        }
        /* 侧边栏 */
        #sidebar {
            position: fixed;
            top: 0;
            left: 0;
            height: 100vh; /* 视口高度全屏 */
            width: 250px;
            background: #343a40;
            color: white;
            padding-top: 0; /* 不留顶部间距 */
            transition: width 0.3s ease;
            overflow-x: hidden;
            z-index: 1040; /* 低于导航栏 */
        }
        /* 侧边栏收缩状态 */
        #sidebar.collapsed {
            width: 60px;
        }
        /* 侧边栏导航链接 */
        #sidebar .nav-link {
            color: #ccc;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            padding-left: 1rem;
        }
        #sidebar .nav-link:hover,
        #sidebar .nav-link.active {
            background-color: #495057;
            color: white;
        }
        /* 子菜单内边距 */
        .submenu {
            padding-left: 1.5rem;
        }

        /* 顶部导航栏 */
        nav.navbar {
            position: fixed;
            top: 0;
            left: 250px; /* 默认侧边栏宽度 */
            width: calc(100% - 250px);
            height: 60px;
            background: #f8f9fa;
            display: flex;
            align-items: center;
            padding: 0 1rem;
            z-index: 1050; /* 高于侧边栏 */
            box-shadow: 0 2px 5px rgb(0 0 0 / 0.1);
            transition: left 0.3s ease, width 0.3s ease;
        }
        /* 导航栏收缩时 */
        nav.navbar.collapsed {
            left: 60px;
            width: calc(100% - 60px);
        }

        /* 按钮样式 */
        #toggleSidebarBtn {
            font-size: 1.5rem;
            cursor: pointer;
            border: none;
            background: transparent;
            outline: none;
            color: #333;
        }
        /* 主内容区域 */
        #content {
            margin-left: 250px; /* 默认侧边栏宽度 */
            padding-top: 60px; /* 顶部导航栏高度 */
            transition: margin-left 0.3s ease;
            height: calc(100vh - 60px);
        }
        /* 收缩时内容左边距 */
        #content.collapsed {
            margin-left: 60px;
        }
        iframe {
            width: 100%;
            height: 100%;
            border: none;
        }

        /* 响应式处理 */
        @media (max-width: 991.98px) {
            #sidebar {
                width: 0;
                overflow: hidden;
            }
            #sidebar.collapsed {
                width: 0;
            }
            #content {
                margin-left: 0;
            }
            #content.collapsed {
                margin-left: 0;
            }
            nav.navbar {
                left: 0 !important;
                width: 100% !important;
            }
            nav.navbar.collapsed {
                left: 0 !important;
                width: 100% !important;
            }
        }
    </style>
</head>
<body>

<!-- 顶部导航栏 -->
<nav class="navbar" id="topNavbar">
    <button id="toggleSidebarBtn" aria-label="切换侧边栏">☰</button>
    <span class="ms-3 fs-5">主页 - 带侧边栏</span>
</nav>

<!-- 侧边栏 -->
<div id="sidebar">
    <nav class="nav flex-column pt-3">
        <a class="nav-link" data-bs-toggle="collapse" href="#menu1" role="button" aria-expanded="false" aria-controls="menu1">
            首页
        </a>
        <div class="collapse submenu" id="menu1">
            <nav class="nav flex-column">
                <a class="nav-link" href="./jsp/content/welcome.jsp" target="mainFrame">仪表盘</a>
                <a class="nav-link" href="./jsp/content/about.jsp" target="mainFrame">关于我们</a>
            </nav>
        </div>

        <a class="nav-link" data-bs-toggle="collapse" href="#menu2" role="button" aria-expanded="false" aria-controls="menu2">
            商品
        </a>
        <div class="collapse submenu" id="menu2">
            <nav class="nav flex-column">
                <a class="nav-link" href="./jsp/content/products.jsp" target="mainFrame">商品列表</a>
                <a class="nav-link" href="./jsp/content/addProduct.jsp" target="mainFrame">添加商品</a>
                <a class="nav-link" href="./jsp/content/category.jsp" target="mainFrame">商品分类</a>
                <a class="nav-link" href="./jsp/content/type.jsp" target="mainFrame">商品类型</a>
            </nav>
        </div>

        <a class="nav-link" data-bs-toggle="collapse" href="#menu3" role="button" aria-expanded="false" aria-controls="menu3">
            订单
        </a>
        <div class="collapse submenu" id="menu3">
            <nav class="nav flex-column">
                <a class="nav-link" href="./jsp/content/orderList.jsp" target="mainFrame">订单列表</a>
                <a class="nav-link" href="./jsp/content/orderSetting.jsp" target="mainFrame">订单设置</a>
                <a class="nav-link" href="./jsp/content/returnApply.jsp" target="mainFrame">退货申请</a>
                <a class="nav-link" href="./jsp/content/returnReason.jsp" target="mainFrame">退货原因</a>
            </nav>
        </div>

        <a class="nav-link" data-bs-toggle="collapse" href="#menu4" role="button" aria-expanded="false" aria-controls="menu4">
            用户
        </a>
        <div class="collapse submenu" id="menu4">
            <nav class="nav flex-column">
                <a class="nav-link" href="./jsp/content/userList.jsp" target="mainFrame">用户列表</a>
            </nav>
        </div>
    </nav>
</div>

<!-- 主内容区域 -->
<div id="content">
    <iframe name="mainFrame" id="mainFrame" src="./jsp/content/welcome.jsp"></iframe>
</div>

<!-- Bootstrap 5 JS（包含 Popper） -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
    const toggleBtn = document.getElementById('toggleSidebarBtn');
    const sidebar = document.getElementById('sidebar');
    const content = document.getElementById('content');
    const navbar = document.getElementById('topNavbar');

    toggleBtn.addEventListener('click', () => {
        sidebar.classList.toggle('collapsed');
        content.classList.toggle('collapsed');
        navbar.classList.toggle('collapsed');
    });
</script>

</body>
</html>

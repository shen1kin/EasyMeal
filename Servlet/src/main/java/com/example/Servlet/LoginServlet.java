package com.example.Servlet;

import com.example.model.User;
import com.example.dao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Optional;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private UserDao userDao = new UserDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 设置编码，避免中文乱码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // 获取表单参数
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // 调用 DAO 检查用户
        Optional<User> userOpt = userDao.checkLogin(username, password);

        if (userOpt.isPresent()) {
            // 登录成功：保存用户信息到 session，并跳转首页
            HttpSession session = request.getSession();
            session.setAttribute("user", userOpt.get());
            response.sendRedirect("index.jsp"); // 登录成功后跳转
        } else {
            // 登录失败：跳回登录页，并附带错误信息
            request.setAttribute("msg", "用户名或密码错误");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 直接跳转到登录页面
        response.sendRedirect("login.jsp");
    }
}

package com.example.Servlet;

import com.example.model.User;
import com.example.dao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Optional;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private UserDao userDao = new UserDao();
    private String adminPassword = "123456";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 设置请求编码为 UTF-8，防止中文乱码
        request.setCharacterEncoding("UTF-8");

        // 设置响应类型为 HTML 或 UTF-8 文本
        response.setContentType("text/html;charset=UTF-8");

        // 获取表单中的参数
        String username = request.getParameter("username");
        String account = request.getParameter("account");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String role = "user";

        if (password == null || password.isEmpty()) {
            request.setAttribute("errorMsg", "密码不能为空！");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        if (!password.equals(confirmPassword)) {
            request.setAttribute("errorMsg", "两次输入的密码不一致！");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        //判断管理员
        if (role.equals(adminPassword)) {
            role = "admin";
        }

        // 调试输出
        System.out.println("register: username=" + username + ", account=" + account + ", password=" + password + ", role=" + role);

        // 调用 DAO 进行用户注册
        Optional<User> userOpt = userDao.addUser(username, account, password, role);

        // 输出响应内容
        PrintWriter out = response.getWriter();

        if (userOpt.isPresent()) {
            // 注册成功，跳转或输出信息
            response.sendRedirect("login.jsp");
        } else {
            // 注册失败
            out.println("<h2>注册失败！</h2>");
            out.println("<p>该账号可能已存在，请重试。</p>");
        }

        out.close();
    }
}

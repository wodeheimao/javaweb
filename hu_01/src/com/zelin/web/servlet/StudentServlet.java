package com.zelin.web.servlet;

import com.zelin.web.dao.Impl.StudentDaoImpl;
import com.zelin.web.dao.StudentDao;
import com.zelin.web.pojo.Student;

import javax.servlet.ServletException;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/student")
public class StudentServlet extends HttpServlet {
    StudentDao studentDao = new StudentDaoImpl();
    @Override
    public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String method = request.getParameter("method");
        System.out.println(method);
        if (null != method && !"".equals(method)){
             //查询
            if ("list".equals(method)){
                list(request,response);
            } else if ("toaddStudent".equals(method)) {      //新增页面
//                toaddStudent(request, response);
            }else if ("addStudent".equals(method)) {        //新增
                addStudent(request,response);
            } else if ("updateStudent".equals(method)) {       //修改
                updateStudent(request,response);
            } else if ("deleteStudent".equals(method)) {       //删除
                deleteStudent(request,response);
            }
        }else{
            list(request,response);
        }

    }



    private void deleteStudent(ServletRequest request, ServletResponse response) throws ServletException, IOException {
        int sid = Integer.parseInt(request.getParameter("sid"));
        studentDao.deleteStudent(sid);
        List<Student> students = studentDao.findAll();
        request.setAttribute("students", students);
        request.getRequestDispatcher("/WEB-INF/student/stu_list.jsp").forward(request,response);
    }

    private void updateStudent(ServletRequest request, ServletResponse response) throws ServletException, IOException {

        HttpServletResponse res = (HttpServletResponse) response;
        res.sendRedirect("/WEB-INF/student/stu_update.jsp");
//        request.getRequestDispatcher("/WEB-INF/student/stu_update.jsp").forward(request, response);
    }
//    private void toaddStudent(ServletRequest request, ServletResponse response) throws ServletException, IOException {
//        request.getRequestDispatcher("/WEB-INF/student/stu_add.jsp").forward(request, response);
//    }
    private void addStudent(ServletRequest request, ServletResponse response) throws ServletException, IOException {
        String sname = request.getParameter("sname");
        String sex = request.getParameter("sex");
        String ageStr = request.getParameter("sage");
        int age = ageStr != null && !"".equals(ageStr) ? new Integer(ageStr) : 0;
        String addr = request.getParameter("addr");
        int cid = Integer.parseInt(request.getParameter("cid"));
        Student student = new Student(sname,sex,age,addr,cid);
        System.out.println(student);
        int n = studentDao.addStudent(student);
        List<Student> students = studentDao.findAll();
        request.setAttribute("students", students);
        request.getRequestDispatcher("/WEB-INF/student/stu_list.jsp").forward(request, response);
}

    //查询
    private void list(ServletRequest request, ServletResponse response) throws ServletException, IOException {
        List<Student> students = studentDao.findAll();
        request.setAttribute("students", students);
        request.getRequestDispatcher("/WEB-INF/student/stu_list.jsp").forward(request, response);
    }
}

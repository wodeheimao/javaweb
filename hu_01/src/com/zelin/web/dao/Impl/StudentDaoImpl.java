package com.zelin.web.dao.Impl;

import com.zelin.web.dao.StudentDao;
import com.zelin.web.pojo.Student;
import com.zelin.web.utils.JdbcUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class StudentDaoImpl implements StudentDao {
    @Override
    public List<Student> findAll() {
        QueryRunner qr  = new QueryRunner(JdbcUtils.getDataSource());
        List<Student> students = null;
        try {
            students = qr.query("select s.*,c.cname from student s, class c where s.cid = c.cid", new BeanListHandler<>(Student.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }

    @Override
    public int addStudent(Student student) {
        QueryRunner qr = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "INSERT INTO student (sname,sex,age,addr,cid) VALUES (?,?,?,?,?)";
        Object[] prams = {student.getSname(), student.getSex(), student.getAge(), student.getAddr(), student.getCid()};
        int n = 0;
        try {
            n = qr.update(sql, prams);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return n;
    }

    @Override
    public int deleteStudent(int id) {
        Student stu = findById(id);
        if(stu==null){
            System.out.println("删除失败");
            return 0;
        }else{
            QueryRunner qr = new QueryRunner(JdbcUtils.getDataSource());
            String sql  = "delete from student where sid =  ?";
            try {
                System.out.println("删除成功");
                return  qr.update(sql, id);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return 0;
    }

    @Override
    public int updateStudent(Student student) {
        Student stu = findById(student.getSid());
        if(stu==null){
            return 0;
        }else{
            QueryRunner qr = new QueryRunner(JdbcUtils.getDataSource());
            String sql  = "update student set sname =?,sex =?,age =?,addr =?,cid =? where sid = ?";
            Object[] prams = {student.getSname(), student.getSex(), student.getAge(), student.getAddr(), student.getCid(),student.getSid()};
            try {
                return qr.update(sql,prams);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return 0;
    }

    @Override
    public Student findById(int id) {
        QueryRunner qr = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "select s.*,c.cname from student s, class c where s.cid = c.cid and sid = ?";
        Student student = null;
        try {
            student = qr.query(sql, new BeanHandler<Student>(Student.class),id);
        } catch (SQLException e) {
            System.out.println("不存在该学生");
            e.printStackTrace();
        }
        return student;
    }
}

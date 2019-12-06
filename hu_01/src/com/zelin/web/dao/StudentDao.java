package com.zelin.web.dao;

import com.zelin.web.pojo.Student;

import java.util.List;

public interface StudentDao {
    List<Student> findAll();
    int addStudent(Student student);

    int deleteStudent(int id);

    int updateStudent(Student student);

    public Student findById(int id);
}

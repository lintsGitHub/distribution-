package org.lint;

import static org.junit.Assert.assertTrue;

import org.junit.Before;
import org.junit.Test;
import org.lint.DAO.IStudentDAO;
import org.lint.DAO.IStudentDAOImpl;
import org.lint.beans.Student;

/**
 * Unit test for simple App.
 */
public class AppTest 
{
    private IStudentDAO iStudentDAO = null ;
    @Before
    public void before(){
        iStudentDAO = new IStudentDAOImpl();
    }


    @Test
    public void insert(){
        iStudentDAO.insertStu(new Student("赵六",23,89));
    }
    @Test
    public void ls(){
        Student stu = iStudentDAO.stulist("赵六");
        System.out.println(stu.toString());
    }
}

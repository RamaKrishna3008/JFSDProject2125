package com.klef.jfsd.sdp.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;

@Entity
@Table(name = "studentcoursemapping_table")
public class StudentCourseMapping {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "student_id", nullable = false)
    private Student student;

    @ManyToOne
    @JoinColumn(name = "course_id", nullable = false)
    private Course course;

    @Column(nullable = false)
    private int section;

    @ManyToOne
    @JoinColumn(name = "faculty_id", nullable = false)
    private Faculty faculty;

    @Column(nullable = false, columnDefinition = "int default -1")
    @Min(value = -1, message = "Student internals cannot be less than -1")
    @Max(value = 60, message = "Student internals cannot exceed 60")
    private int studentInternals = -1;

    @Column(nullable = false, columnDefinition = "int default -1")
    @Min(value = -1, message = "Student externals cannot be less than -1")
    @Max(value = 40, message = "Student externals cannot exceed 40")
    private int studentExternals = -1;

    @Column(nullable = false, columnDefinition = "int default -1")
    @Min(value = -1, message = "Grade cannot be less than -1")
    @Max(value = 10, message = "Grade cannot exceed 10")
    private int grade = -1;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public int getSection() {
        return section;
    }

    public void setSection(int section) {
        this.section = section;
    }

    public Faculty getFaculty() {
        return faculty;
    }

    public void setFaculty(Faculty faculty) {
        this.faculty = faculty;
    }

    public int getStudentInternals() {
        return studentInternals;
    }

    public void setStudentInternals(int studentInternals) {
        this.studentInternals = studentInternals;
        calculateGrade();
    }

    public int getStudentExternals() {
        return studentExternals;
    }

    public void setStudentExternals(int studentExternals) {
        this.studentExternals = studentExternals;
        calculateGrade();
    }

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    private void calculateGrade() {
        int total = studentInternals + studentExternals;
        if (total >= 90 && studentInternals >= 25 && studentExternals >= 16) {
            grade = 10;
        } 
        else if (total >= 80 && studentInternals >= 25 && studentExternals >= 16) {
            grade = 9;
        } 
        else if (total >= 70 && studentInternals >= 25 && studentExternals >= 16) {
            grade = 8;
        } 
        else if (total >= 60 && studentInternals >= 25 && studentExternals >= 16) {
            grade = 7;
        } 
        else if (total >= 50 ) {
            grade = 6;
        } 
        else if (total >= 40) {
            grade = 5;
        } 
        else if(studentInternals <= 25 || studentExternals <= 16)
        {
        	grade = 0;
        }
        else {
            grade = -1; 
        }
    }
}

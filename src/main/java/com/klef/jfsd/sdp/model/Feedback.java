package com.klef.jfsd.sdp.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "feedback_table")
public class Feedback {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(nullable = false)
    private int courseId;
    @Column(nullable = false)
    private String studentId;
    @Column(nullable = false)
    private int facultyId;
    @Column(nullable = false)
    private String question1Feedback;
    @Column(nullable = false)
    private String question2Feedback;
    @Column(nullable = false)
    private String question3Feedback;
    @Column(nullable = false)
    private String question4Feedback;
    @Column(nullable = false)
    private String question5Feedback;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getQuestion1Feedback() {
        return question1Feedback;
    }

    public void setQuestion1Feedback(String question1Feedback) {
        this.question1Feedback = question1Feedback;
    }

    public String getQuestion2Feedback() {
        return question2Feedback;
    }

    public void setQuestion2Feedback(String question2Feedback) {
        this.question2Feedback = question2Feedback;
    }

    public String getQuestion3Feedback() {
        return question3Feedback;
    }

    public void setQuestion3Feedback(String question3Feedback) {
        this.question3Feedback = question3Feedback;
    }

    public String getQuestion4Feedback() {
        return question4Feedback;
    }

    public void setQuestion4Feedback(String question4Feedback) {
        this.question4Feedback = question4Feedback;
    }

    public String getQuestion5Feedback() {
        return question5Feedback;
    }

    public void setQuestion5Feedback(String question5Feedback) {
        this.question5Feedback = question5Feedback;
    }

	public int getFacultyId() {
		return facultyId;
	}

	public void setFacultyId(int facultyId) {
		this.facultyId = facultyId;
	}
}

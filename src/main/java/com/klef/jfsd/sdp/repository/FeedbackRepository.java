package com.klef.jfsd.sdp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.klef.jfsd.sdp.model.Feedback;
import java.util.List;


public interface FeedbackRepository extends JpaRepository<Feedback, Integer> {
	public long countByCourseIdAndStudentId(int courseId, String studentId);
	public List<Feedback> findByFacultyIdAndCourseId(int facultyId, int courseId);
	
}
package com.klef.jfsd.sdp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.sdp.model.Course;
import java.util.List;


@Repository
public interface CourseRepository extends JpaRepository<Course, Integer>
{
	public List<Course> findByAcademicYearAndOfferedsem(String academicYear, String offeredsem);
}

package com.klef.jfsd.sdp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.sdp.model.FacultyCourseMapping;
import com.klef.jfsd.sdp.model.StudentCourseMapping;

@Repository
public interface StudentCourseMappingRepository extends JpaRepository<StudentCourseMapping, Integer>
{
	@Query("SELECT COUNT(scm) FROM StudentCourseMapping scm where scm.student.id = ?1 and scm.course.id = ?2 and scm.section = ?3")
	  public long checkStudentCourseMapping(String studentid,int courseid,int section);
	
	@Query("SELECT scm FROM StudentCourseMapping scm WHERE scm.faculty.id =?1 and scm.course.courseid=?2 and scm.section=?3")
	  public List<StudentCourseMapping> findCourseAndSectionByFacultyId(int facultyId,int cid,int section);
	
	@Query("SELECT scm FROM StudentCourseMapping scm WHERE scm.course.academicYear = ?1 AND scm.course.offeredsem = ?2")
	public List<StudentCourseMapping> findStudentCourses(String academicYear, String offeredsem);	
}

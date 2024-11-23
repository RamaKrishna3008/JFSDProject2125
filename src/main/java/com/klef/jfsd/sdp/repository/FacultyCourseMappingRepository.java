package com.klef.jfsd.sdp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.sdp.model.Course;
import com.klef.jfsd.sdp.model.Faculty;
import com.klef.jfsd.sdp.model.FacultyCourseMapping;

@Repository
public interface FacultyCourseMappingRepository  extends JpaRepository<FacultyCourseMapping, Integer>{
	@Query("SELECT COUNT(fcm) FROM FacultyCourseMapping fcm where fcm.faculty = ?1 and fcm.course = ?2 AND fcm.section = ?3")
	  public long checkfcoursemapping(Faculty faculty,Course course,int section);
	
	@Query("SELECT fcm FROM FacultyCourseMapping fcm WHERE fcm.faculty.id =?1")
	  public List<FacultyCourseMapping> findCourseAndSectionByFacultyId(int facultyId);
	
	@Query("SELECT DISTINCT fcm.course FROM FacultyCourseMapping fcm WHERE fcm.course.ForBatch = ?1")
	public List<Course> findByCourseBatch(String ForBatch);

	@Query("select fcm FROM FacultyCourseMapping fcm WHERE fcm.course.courseid=?1")
	  public List<FacultyCourseMapping> findSectionByCourseId(int courseid);
}

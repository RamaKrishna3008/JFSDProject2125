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
	
	@Query("SELECT fcm FROM FacultyCourseMapping fcm WHERE fcm.faculty.id = ?1 AND fcm.course.academicYear = ?2 AND fcm.course.offeredsem = ?3")
	public List<FacultyCourseMapping> findCourseAndSectionByFacultyIdAndAYAndSem(int facultyId, String academicYear, String offeredsem);

	
	@Query("SELECT DISTINCT fcm.course FROM FacultyCourseMapping fcm WHERE fcm.course.forbatch = ?1 and fcm.course.academicYear=?2 and fcm.course.offeredsem=?3")
	public List<Course> getSectionsForReg(String ForBatch,String academicYear,String sem);

	@Query("select fcm FROM FacultyCourseMapping fcm WHERE fcm.course.courseid=?1")
	  public List<FacultyCourseMapping> findSectionByCourseId(int courseid);
}

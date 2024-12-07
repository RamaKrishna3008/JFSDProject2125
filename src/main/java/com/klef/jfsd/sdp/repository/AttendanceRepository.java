package com.klef.jfsd.sdp.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.sdp.model.Attendance;
import com.klef.jfsd.sdp.model.Course;
import com.klef.jfsd.sdp.model.Student;


@Repository
public interface AttendanceRepository extends JpaRepository<Attendance, Integer> {

    @Query("SELECT DISTINCT a.section FROM Attendance a WHERE a.course = ?1 AND a.student = ?2")
    public Integer findSectionsByCourseAndStudent(Course course, Student student);

    public long countByCourseAndSection(Course course, int section);

    public long countByStudentAndCourseAndPresentTrue(Student student, Course course);
}


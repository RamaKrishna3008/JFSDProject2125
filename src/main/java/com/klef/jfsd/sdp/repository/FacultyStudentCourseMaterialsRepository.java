package com.klef.jfsd.sdp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.sdp.model.FacultyStudentCourseMaterials;
import java.util.List;


@Repository
public interface FacultyStudentCourseMaterialsRepository extends JpaRepository<FacultyStudentCourseMaterials, Integer>
{
	public List<FacultyStudentCourseMaterials> findByCidAndSection(int cid, int section);
}

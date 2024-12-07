package com.klef.jfsd.sdp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.sdp.model.Student;

import jakarta.transaction.Transactional;


@Repository
public interface StudentRepository extends JpaRepository<Student, String>
{
	@Query("update Student s set s.status=?1 where s.id=?2")
	@Transactional
	@Modifying 
	public int updatestudentstatus(String status,String sid);
	
	@Query("update Student s set s.registarationStatus=?1 where s.id=?2")
	@Transactional
	@Modifying 
	public int updateregistationstudentstatus(String registarationStatus,String sid);
	
	@Query("update Student s set s.mycgpa=?1 where s.id=?2")
	@Transactional
	@Modifying 
	public int updatestudentgrade(float grade,String sid);
	
	
	
	
	
}

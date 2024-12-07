package com.klef.jfsd.sdp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.sdp.model.Faculty;

import jakarta.transaction.Transactional;
import java.util.Optional;


@Repository
public interface FacultyRepository extends JpaRepository<Faculty, Integer>
{
	@Query("select f from Faculty f where f.username=?1 and f.password=?2")
	public Faculty CheckFacultyLogin(String username,String pwd);
	
	@Query("update Faculty f set f.active=?1 where f.id=?2")
	@Transactional
	@Modifying 
	public int updatefacultystatus(String status,int fid);
	
	public Optional<Faculty> findByUsername(String username);
}

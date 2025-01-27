package com.skilldistillery.cigars.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.cigars.entities.Origin;

public interface OriginRepository extends JpaRepository<Origin, Integer> {
	
	Origin queryById(int originId);

}

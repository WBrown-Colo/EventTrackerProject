package com.skilldistillery.cigars.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.cigars.entities.Shape;

public interface ShapeRepository extends JpaRepository<Shape, Integer> {

	Shape queryById(int shapeId);
	
}

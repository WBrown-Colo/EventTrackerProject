package com.skilldistillery.cigars.services;

import java.util.List;

import com.skilldistillery.cigars.entities.Shape;

public interface ShapeService {
	List<Shape> findAll();
	Shape findByShapeId(int shapeId);

}

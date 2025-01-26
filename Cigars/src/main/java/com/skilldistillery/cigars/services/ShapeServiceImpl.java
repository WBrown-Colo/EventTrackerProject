package com.skilldistillery.cigars.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.cigars.entities.Shape;
import com.skilldistillery.cigars.repositories.ShapeRepository;

@Service
public class ShapeServiceImpl implements ShapeService {

	@Autowired
	private ShapeRepository shapeRepo;
	
	@Override
	public List<Shape> findAll() {
		return shapeRepo.findAll();
	}

	@Override
	public Shape findByShapeId(int shapeId) {
		Shape shape = null;
		if (shapeRepo.existsById(shapeId)) {
			shape = shapeRepo.queryById(shapeId);
		}
		return shape;
	}

}

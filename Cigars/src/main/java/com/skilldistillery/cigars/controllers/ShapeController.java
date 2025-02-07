package com.skilldistillery.cigars.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.cigars.entities.Shape;
import com.skilldistillery.cigars.services.ShapeService;

@CrossOrigin({"*", "http://localhost/"})
@RestController
@RequestMapping("api")
public class ShapeController {

	@Autowired
	private ShapeService shapeService;
	
	@GetMapping("shapes")
	public List<Shape> listShapes() {
		return shapeService.findAll();
	}
	
	@GetMapping("shapes/{shapeId}")
	public Shape listShape(@PathVariable("shapeId") int shapeId) {
		Shape shape = shapeService.findByShapeId(shapeId);
		
		return shape;
	}
	
}

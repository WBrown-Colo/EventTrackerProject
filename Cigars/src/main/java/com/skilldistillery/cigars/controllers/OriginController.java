package com.skilldistillery.cigars.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.cigars.entities.Origin;
import com.skilldistillery.cigars.services.OriginService;

@RestController
@RequestMapping("api")
public class OriginController {
	
	@Autowired
	private OriginService originService;
	
	@GetMapping("origins")
	public List<Origin> listOrigins() {
		return originService.findAll();
	}
	
	@GetMapping("origins/{originsId}")
	public Origin listOrigin(@PathVariable("originId") int originId) {
		Origin origin = originService.findByOriginId(originId);
		
		return origin;
	}

}

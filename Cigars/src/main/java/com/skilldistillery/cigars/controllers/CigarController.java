package com.skilldistillery.cigars.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.cigars.entities.Cigar;
import com.skilldistillery.cigars.services.CigarService;

@RestController
@RequestMapping("api")
public class CigarController {
	
	@Autowired
	private CigarService cigarService;
	
	@GetMapping("cigars")
	public List<Cigar> listCigars() {
		return cigarService.findAll();
		
	}

}

package com.skilldistillery.cigars.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.cigars.entities.Cigar;
import com.skilldistillery.cigars.services.CigarService;

import jakarta.servlet.http.HttpServletResponse;

@RestController
@RequestMapping("api")
public class CigarController {
	
	@Autowired
	private CigarService cigarService;
	
	@GetMapping("cigars")
	public List<Cigar> listCigars() {
		return cigarService.findAll();
	}
	
	@GetMapping("cigars/{cigarId}")
	public Cigar listCigar(@PathVariable("cigarId") int cigarId) {
		Cigar cigar = cigarService.findByCigarId(cigarId);
		
		return cigar;
	}

	@PostMapping({"cigars", "cigars/"})
	public Cigar createCigar(@RequestBody Cigar cigar, HttpServletResponse resp) {
		try {
			cigarService.create(cigar);
			resp.setStatus(201);
		} catch (Exception e) {
			e.printStackTrace();
			cigar = null;
			resp.setStatus(400);
		}
		return cigar;
	}
	
	@PutMapping("cigars/{cigarId}")
	public Cigar updateCigar(@PathVariable("cigarId") int cigarId, @RequestBody Cigar cigar, HttpServletResponse resp) {
		try {
			cigar = cigarService.update(cigarId, cigar);
			resp.setStatus(200);
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.setStatus(400);
		}
		return cigar;
	}
	
	@DeleteMapping("cigars/{cigarId}")
	public void deleteCigar(@PathVariable("cigarId") int cigarId, HttpServletResponse resp) {
		try {
			if(cigarService.deleteById(cigarId)) {
				resp.setStatus(200);
			}
			else {
				resp.setStatus(404);
			}
		} catch (Exception e) {
			resp.setStatus(400);
		}
	}
	
	
	
}

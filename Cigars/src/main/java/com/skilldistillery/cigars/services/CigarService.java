package com.skilldistillery.cigars.services;

import java.util.List;

import com.skilldistillery.cigars.entities.Cigar;

public interface CigarService {
	List<Cigar> findAll();
	Cigar findById(int cigarId);
	Cigar create(Cigar newCigar);
	Cigar update(int cigarId, Cigar cigar);
	boolean deleteById(int cigarId);

}

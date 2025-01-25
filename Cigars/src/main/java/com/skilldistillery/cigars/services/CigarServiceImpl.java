package com.skilldistillery.cigars.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.cigars.entities.Cigar;
import com.skilldistillery.cigars.repositories.CigarRepository;

@Service
public class CigarServiceImpl implements CigarService {
	
	@Autowired
	private CigarRepository cigarRepo;

	@Override
	public List<Cigar> findAll() {
		return cigarRepo.findAll();
	}

	@Override
	public Cigar findById(int cigarId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Cigar create(Cigar newCigar) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Cigar update(int cigarId, Cigar cigar) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteById(int cigarId) {
		// TODO Auto-generated method stub
		return false;
	}

}

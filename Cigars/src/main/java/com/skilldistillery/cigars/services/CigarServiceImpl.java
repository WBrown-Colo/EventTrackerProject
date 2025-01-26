package com.skilldistillery.cigars.services;

import java.util.List;
import java.util.Optional;

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
	public Cigar findByCigarId(int cigarId) {
		Cigar cigar = null;
		if (cigarRepo.existsById(cigarId)) {
			cigar = cigarRepo.queryById(cigarId);
		}
		return cigar;
	}

	@Override
	public Cigar create(Cigar newCigar) {
		return cigarRepo.saveAndFlush(newCigar);
	}

	@Override
	public Cigar update(int cigarId, Cigar cigar) {
		Optional<Cigar> cigarOpt = cigarRepo.findById(cigarId);
		Cigar updatedCigar = null;
		if(cigarOpt.isPresent()) {
			updatedCigar.setBrand(cigar.getBrand());
			updatedCigar.setName(cigar.getName());
			updatedCigar.setDescription(cigar.getDescription());
			updatedCigar.setLengthRing(cigar.getLengthRing());
			updatedCigar.setShade(cigar.getShade());
			updatedCigar.setStrength(cigar.getStrength());
			updatedCigar.setSinglePrice(cigar.getSinglePrice());
			updatedCigar.setYearIntro(cigar.getYearIntro());
			updatedCigar.setCreateDate(cigar.getCreateDate());
			updatedCigar.setLastUpdate(cigar.getLastUpdate());
			updatedCigar.setImageUrl(cigar.getImageUrl());
			cigarRepo.saveAndFlush(updatedCigar);
		}
		
		return updatedCigar;
	}

	@Override
	public boolean deleteById(int cigarId) {
		boolean deleted = false;
		Optional<Cigar> cigarOpt = cigarRepo.findById(cigarId);
		if(cigarOpt.isPresent()) {
			Cigar cigar = cigarOpt.get();
			cigarRepo.delete(cigar);
			deleted = true;
		}
		return deleted;
	}


}

package com.skilldistillery.cigars.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.cigars.entities.Origin;
import com.skilldistillery.cigars.repositories.OriginRepository;

@Service
public class OriginServiceImpl implements OriginService {

	@Autowired
	private OriginRepository originRepo;
	
	@Override
	public List<Origin> findAll() {
		return originRepo.findAll();
	}

	@Override
	public Origin findByOriginId(int originId) {
		Origin origin = null;
		if (originRepo.existsById(originId)) {
			origin = originRepo.queryById(originId);
		}
		
		return origin;
	}
	

}

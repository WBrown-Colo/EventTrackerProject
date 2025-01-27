package com.skilldistillery.cigars.services;

import java.util.List;

import com.skilldistillery.cigars.entities.Origin;

public interface OriginService {

	List<Origin> findAll();
	Origin findByOriginId(int originId);
	
}

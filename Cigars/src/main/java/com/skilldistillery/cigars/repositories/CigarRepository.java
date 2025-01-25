package com.skilldistillery.cigars.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.cigars.entities.Cigar;

public interface CigarRepository extends JpaRepository<Cigar, Integer> {

}

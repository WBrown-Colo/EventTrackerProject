package com.skilldistillery.cigars.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class CigarTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Cigar cigar;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPACigars");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		cigar = em.find(Cigar.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		cigar = null;
	}

	@Test
	void test_Cigar_entity_mapping() {
		assertNotNull(cigar);
		assertEquals("Padron", cigar.getBrand());
	}

}

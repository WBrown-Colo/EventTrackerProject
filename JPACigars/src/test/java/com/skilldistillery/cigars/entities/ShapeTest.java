package com.skilldistillery.cigars.entities;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class ShapeTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Shape shape;

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
		shape = em.find(Shape.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		shape = null;
	}

	@Test
	void test_Shape_entity_mapping() {
		assertNotNull(shape);
		assertEquals("Corona", shape.getName());
	}

}

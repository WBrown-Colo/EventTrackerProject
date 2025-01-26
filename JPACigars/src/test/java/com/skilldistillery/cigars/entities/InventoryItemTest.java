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

class InventoryItemTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private InventoryItem inventoryItem;

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
		inventoryItem = em.find(InventoryItem.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		inventoryItem = null;
	}

	@Test
	void test_InventoryItem_entity_mapping() {
		assertNotNull(inventoryItem);
		assertEquals(14, inventoryItem.getQuantity());
	}
}

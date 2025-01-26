package com.skilldistillery.cigars.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.cigars.entities.InventoryItem;

public interface InventoryItemRepository extends JpaRepository<InventoryItem, Integer> {
	
	InventoryItem queryById(int inventoryItemId);

}

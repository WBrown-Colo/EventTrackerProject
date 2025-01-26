package com.skilldistillery.cigars.services;

import java.util.List;

import com.skilldistillery.cigars.entities.InventoryItem;

public interface InventoryItemService {
	List<InventoryItem> findAll();
	InventoryItem findByInventoryItemId(int inventoryItemId);
	InventoryItem create(InventoryItem newInventoryItem);
	InventoryItem update(int inventoryItemId, InventoryItem inventoryItem);
	boolean deleteById(int inventoryItemId);
	
	
}

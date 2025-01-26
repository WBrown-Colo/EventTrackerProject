package com.skilldistillery.cigars.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.cigars.entities.Cigar;
import com.skilldistillery.cigars.entities.InventoryItem;
import com.skilldistillery.cigars.repositories.InventoryItemRepository;

@Service
public class InventoryItemServiceImpl implements InventoryItemService {

	@Autowired
	private InventoryItemRepository inventoryItemRepo;
	
	@Override
	public List<InventoryItem> findAll() {
		return inventoryItemRepo.findAll();
	}

	@Override
	public InventoryItem findByInventoryItemId(int inventoryItemId) {
		InventoryItem inventoryItem = null;
		if (inventoryItemRepo.existsById(inventoryItemId)) {
			inventoryItem = inventoryItemRepo.queryById(inventoryItemId);
		}
		return inventoryItem;
	}

	@Override
	public InventoryItem create(InventoryItem newInventoryItem) {
		return inventoryItemRepo.saveAndFlush(newInventoryItem);
	}

	@Override
	public InventoryItem update(int inventoryItemId, InventoryItem inventoryItem) {
		Optional<InventoryItem> inventoryItemOpt = inventoryItemRepo.findById(inventoryItemId);
		InventoryItem updatedInventoryItem = null;
		if(inventoryItemOpt.isPresent()) {
			updatedInventoryItem.setCigar(inventoryItem.getCigar());
			updatedInventoryItem.setQuantity(inventoryItem.getQuantity());
			updatedInventoryItem.setDateAcquired(inventoryItem.getDateAcquired());
			
		}
		return updatedInventoryItem;
	}

	@Override
	public boolean deleteById(int inventoryItemId) {
		boolean deleted = false;
		Optional<InventoryItem> inventoryItemOpt = inventoryItemRepo.findById(inventoryItemId);
		if(inventoryItemOpt.isPresent()) {
			InventoryItem inventoryItem = inventoryItemOpt.get();
			inventoryItemRepo.delete(inventoryItem);
			deleted = true;
		}
		return deleted;
	}

}

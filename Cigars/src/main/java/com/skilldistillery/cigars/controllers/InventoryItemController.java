package com.skilldistillery.cigars.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.cigars.entities.InventoryItem;
import com.skilldistillery.cigars.services.InventoryItemService;

import jakarta.servlet.http.HttpServletResponse;

@CrossOrigin({"*", "http://localhost/"})
@RestController
@RequestMapping("api")
public class InventoryItemController {

	@Autowired
	private InventoryItemService inventoryItemService;
	
	@GetMapping("inventoryItems")
	public List<InventoryItem> listInventoryItems() {
		return inventoryItemService.findAll();
	}
	
	@GetMapping("inventoryItems/{inventoryItemId}")
	public InventoryItem listInventoryItem(@PathVariable("inventoryItemId") int inventoryItemId) {
		InventoryItem inventoryItem = inventoryItemService.findByInventoryItemId(inventoryItemId);
		
		return inventoryItem;
	}

	@PostMapping({"inventoryItems", "inventoryItems/"})
	public InventoryItem createinventoryItem(@RequestBody InventoryItem inventoryItem, HttpServletResponse resp) {
		try {
			inventoryItemService.create(inventoryItem);
			resp.setStatus(201);
		} catch (Exception e) {
			e.printStackTrace();
			inventoryItem = null;
			resp.setStatus(400);
		}
		return inventoryItem;
	}
	
	@PutMapping("inventoryItems/{inventoryItemId}")
	public InventoryItem updateInventoryItem(@PathVariable("inventoryItemId") int inventoryItemId, @RequestBody InventoryItem inventoryItem, HttpServletResponse resp) {
		try {
			inventoryItem = inventoryItemService.update(inventoryItemId, inventoryItem);
			resp.setStatus(200);
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.setStatus(400);
		}
		return inventoryItem;
	}
	
	@DeleteMapping("inventoryItems/{inventoryItemId}")
	public void deleteInventoryItem(@PathVariable("inventoryItemId") int inventoryItemId, HttpServletResponse resp) {
		try {
			if(inventoryItemService.deleteById(inventoryItemId)) {
				resp.setStatus(200);
			}
			else {
				resp.setStatus(404);
			}
		} catch (Exception e) {
			resp.setStatus(400);
		}
	}
	
}

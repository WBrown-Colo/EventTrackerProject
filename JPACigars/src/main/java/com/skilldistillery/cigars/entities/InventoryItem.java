package com.skilldistillery.cigars.entities;

import java.sql.Date;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="inventory_item")
public class InventoryItem {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private int quantity;
	
	@Column(name="date_acquired")
	private Date dateAcquired;
	
	@ManyToOne
	@JoinColumn(name="cigar_id")
	private Cigar cigarId;

	
	
	public InventoryItem() {
		super();
	}



	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Date getDateAcquired() {
		return dateAcquired;
	}
	public void setDateAcquired(Date dateAcquired) {
		this.dateAcquired = dateAcquired;
	}
	public Cigar getCigar() {
		return cigarId;
	}
	public void setCigar(Cigar cigar) {
		this.cigarId = cigar;
	}



	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		InventoryItem other = (InventoryItem) obj;
		return id == other.id;
	}



	@Override
	public String toString() {
		return "InventoryItem [id=" + id + ", quantity=" + quantity + ", dateAcquired=" + dateAcquired + ", cigar="
				+ cigarId + "]";
	}
	
}

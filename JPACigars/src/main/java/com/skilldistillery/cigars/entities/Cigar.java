package com.skilldistillery.cigars.entities;

import java.sql.Wrapper;
import java.util.Date;
import java.util.Objects;

import javax.swing.Box.Filler;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.xml.bind.Binder;

@Entity
public class Cigar {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String brand;
	private String name;
	private String description;
	
	@Column(name="length_ring")
	private String lengthRing;
	private String shade;
	private String strength;
	
	@Column(name="single_price")
	private Double singlePrice;
	
	@Column(name="year_introduced")
	private Integer yearIntro;
	
	@Column(name="create_date")
	private Date createDate;
	
	@Column(name="last_update")
	private Date lastUpdate;
	
	@Column(name="image_url")
	private String imageUrl;
	
	@ManyToOne
	@JoinColumn(name = "shape_id")
	private Shape shape;
	
	@ManyToOne
	@JoinColumn(name = "origin_id")
	private Origin origin;
	
	@ManyToOne
	@JoinColumn(name = "wrapper_origin_id")
	private Wrapper wrapperOrigin;
	
	@ManyToOne
	@JoinColumn(name = "binder_origin_id")
	private Binder binderOrigin;
	
	@ManyToOne
	@JoinColumn(name = "filler_origin_id")
	private Filler fillerOrigin;
	
	
	public Cigar() {
		super();
	}
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getLengthRing() {
		return lengthRing;
	}
	public void setLengthRing(String lengthRing) {
		this.lengthRing = lengthRing;
	}
	public String getShade() {
		return shade;
	}
	public void setShade(String shade) {
		this.shade = shade;
	}
	public String getStrength() {
		return strength;
	}
	public void setStrength(String strength) {
		this.strength = strength;
	}
	public Double getSinglePrice() {
		return singlePrice;
	}
	public void setSinglePrice(Double singlePrice) {
		this.singlePrice = singlePrice;
	}
	public Integer getYearIntro() {
		return yearIntro;
	}
	public void setYearIntro(Integer yearIntro) {
		this.yearIntro = yearIntro;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getLastUpdate() {
		return lastUpdate;
	}
	public void setLastUpdate(Date lastUpdate) {
		this.lastUpdate = lastUpdate;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public Shape getShape() {
		return shape;
	}
	public void setShape(Shape shape) {
		this.shape = shape;
	}



	@Override
	public int hashCode() {
		return Objects.hash(id);
	}
	
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Cigar other = (Cigar) obj;
		return id == other.id;
	}


	
	@Override
	public String toString() {
		return "Cigar [id=" + id + ", brand=" + brand + ", name=" + name + ", description=" + description
				+ ", lengthRing=" + lengthRing + ", shade=" + shade + ", strength=" + strength + ", singlePrice="
				+ singlePrice + ", yearIntro=" + yearIntro + ", createDate=" + createDate + ", lastUpdate=" + lastUpdate
				+ ", imageUrl=" + imageUrl + "]";
	}
	
}

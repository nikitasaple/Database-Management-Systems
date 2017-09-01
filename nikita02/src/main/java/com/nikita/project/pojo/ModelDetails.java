package com.nikita.project.pojo;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="modeltable")
public class ModelDetails {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="itemid",unique=true,nullable=false)
	private int itemid;
	
	@ManyToOne(fetch=FetchType.EAGER,cascade=CascadeType.ALL)
	@JoinColumn(name="userid")
	private Person person;
	
	@Column(name="description")
	private String description;
	
	@Column(name="price")
	private long price;
	
	@Column(name="quantity")
	private int quantity;
	
	@OneToMany(mappedBy="model")
	private Set<ItemsPurchased> ja=new HashSet<ItemsPurchased>();

	
	public int getItemid() {
		return itemid;
	}

	public void setIditemid(int itemid) {
		this.itemid = itemid;
	}

	public Person getPerson() {
		return person;
	}

	public void setPerson(Person person) {
		this.person = person;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public long getPrice() {
		return price;
	}

	public void setPrice(long price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Set<ItemsPurchased> getJa() {
		return ja;
	}

	public void setJa(Set<ItemsPurchased> ja) {
		this.ja = ja;
	}
		
	
}

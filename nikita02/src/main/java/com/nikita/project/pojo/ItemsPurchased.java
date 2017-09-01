package com.nikita.project.pojo;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="itemspurchasedtable")
public class ItemsPurchased {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="orderid",unique=true,nullable=false)
	private int orderid;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="userid")
	private Manager manager;
	
//	private Person person;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="modelid")
	private ModelDetails model;
	
	@Column(name="quantyty")
	private int quantity;
	
	@Column(name="status")
	private String status;

	public int getOrderid() {
		return orderid;
	}

	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}

	public Manager getManager() {
		return manager;
	}

	public void setManager(Manager manager) {
		this.manager = manager;
	}

	public ModelDetails getModel() {
		return model;
	}

	public void setModel(ModelDetails model) {
		this.model = model;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	
}

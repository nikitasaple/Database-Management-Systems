package com.nikita.project.pojo;

import java.sql.Blob;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="instructiontable")
public class Issues {


	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="insid",unique=true,nullable=false)
	private int insid;
	
	@Column(name="description")
	private String description;

	
	@Column(name = "title")
	private String title;
	
	@Column(name="image")
    @Lob
    private Blob image;
	

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getInsid() {
		return insid;
	}

	public void setInsid(int insid) {
		this.insid = insid;
	}

	public Blob getImage() {
		return image;
	}

	public void setImage(Blob image) {
		this.image = image;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
}

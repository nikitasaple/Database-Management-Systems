package com.nikita.project.pojo;

import java.sql.Blob;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;


@Entity
@Table(name="persontable")
@PrimaryKeyJoinColumn(name="userid")
public class Person extends User{

	@Column(name="firstName")
	private String firstName;
	
	@Column(name="lastName")
	private String lastName;
	
	@Column(name="gender")
	private String gender;
	
	@Column(name="email")
	private String email;
	
	@Column(name="phone")
	private String phone;
	
	@OneToMany(fetch=FetchType.EAGER,mappedBy="person")
	private Set<ModelDetails> modelDetails = new HashSet<ModelDetails>();

	
	@Column(name="fileName")
	private String fileName;
	
	@Column(name="content")
	    @Lob
	    private Blob content;
	public void addModel(ModelDetails model){
		getModelDetails().add(model);
	}
 
	
	
//	@OneToOne
//	@JoinColumn(name="id")
//	private User user;
//	
//	public User getUser() {
//		return user;
//	}
//
//	public void setUser(User user) {
//		this.user = user;
//	}


	public Set<ModelDetails> getModelDetails() {
		return modelDetails;
	}



	public void setModelDetails(Set<ModelDetails> modelDetails) {
		this.modelDetails = modelDetails;
	}



	public String getFileName() {
		return fileName;
	}



	public void setFileName(String fileName) {
		this.fileName = fileName;
	}



	public Blob getContent() {
		return content;
	}



	public void setContent(Blob content) {
		this.content = content;
	}



	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

//	public MultipartFile getIssues() {
//		return issues;
//	}
//
//	public void setIssues(MultipartFile issues) {
//		this.issues = issues;
//	} 
}

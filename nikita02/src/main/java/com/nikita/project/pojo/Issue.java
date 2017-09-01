package com.nikita.project.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ISSUE")
public class Issue {

	@Id
	@Column(name="issueID")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int issueID;
	
	private String firstName;
	private String lastName;
	private String subject;
	private String description;
	private String status;
	
	
	public int getIssueID() {
		return issueID;
	}



	public void setIssueID(int issueID) {
		this.issueID = issueID;
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



	public String getSubject() {
		return subject;
	}



	public void setSubject(String subject) {
		this.subject = subject;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	@Override
	public String toString(){
		return "issueID="+issueID+", firstName="+firstName+", lastName="+lastName+",subject="+subject+", description="+description;
	}
}

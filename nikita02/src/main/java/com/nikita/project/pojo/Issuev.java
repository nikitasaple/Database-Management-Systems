package com.nikita.project.pojo;

	import java.util.ArrayList;
	import java.util.List;
	import java.util.Set;import javax.persistence.CascadeType;
	import javax.persistence.Column;
	import javax.persistence.Entity;
	import javax.persistence.FetchType;
	import javax.persistence.GeneratedValue;
	import javax.persistence.Id;
	import javax.persistence.JoinColumn;
	import javax.persistence.ManyToOne;
	import javax.persistence.OneToMany;
	import javax.persistence.Table;@Entity
	@Table(name="issue")
	public class Issuev {

	    
	    public Issuev() {
	    }
	    @Id
	    @GeneratedValue
	    @Column(name="id", unique=true, nullable=false)
	    private int id;
	    
	    @Column(name="name")
	    private String name;
	    
	    @Column(name = "subj")
	    private String subj;
	    
	    @Column(name = "desc")
	    private String desc;
	    
	   
	    public int getId() {
	        return id;
	    }
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getSubj() {
			return subj;
		}
		public void setSubj(String subj) {
			this.subj = subj;
		}
		public String getDesc() {
			return desc;
		}
		public void setDesc(String desc) {
			this.desc = desc;
		}
		
	       
	    } 



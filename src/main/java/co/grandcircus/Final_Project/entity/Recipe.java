package co.grandcircus.Final_Project.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class Recipe {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String title;
	private  Integer readyInMinutes;
	private String sourceUrl;
	private Long extRecipeId;
	
	
	
	
	public Long getExtRecipeId() {
		return extRecipeId;
	}
	public void setExtRecipeId(Long extRecipeId) {
		this.extRecipeId = extRecipeId;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public Integer getReadyInMinutes() {
		return readyInMinutes;
	}
	public void setReadyInMinutes(Integer readyInMinutes) {
		this.readyInMinutes = readyInMinutes;
	}
	public String getSourceUrl() {
		return sourceUrl;
	}
	public void setSourceUrl(String sourceUrl) {
		this.sourceUrl = sourceUrl;
	}
	@Override
	public String toString() {
		return "Recipe [id=" + id + ", title=" + title + ", readyInMinutes=" + readyInMinutes + ", sourceUrl="
				+ sourceUrl + ", extRecipeId=" + extRecipeId + "]";
	}
	
	
	
	
}

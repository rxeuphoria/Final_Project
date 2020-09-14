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
	private Integer servings;
	private  Double readyInMinutes;
	private String sourceUrl;
	
	
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
	public Integer getServings() {
		return servings;
	}
	public void setServings(Integer servings) {
		this.servings = servings;
	}
	public Double getReadyInMinutes() {
		return readyInMinutes;
	}
	public void setReadyInMinutes(Double readyInMinutes) {
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
		return "Recipe [id=" + id + ", title=" + title + ", servings=" + servings + ", readyInMinutes=" + readyInMinutes
				+ ", sourceUrl=" + sourceUrl + "]";
	}
	
	
}

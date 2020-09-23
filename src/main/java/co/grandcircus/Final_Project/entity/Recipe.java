package co.grandcircus.Final_Project.entity;

import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Recipe {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String title;
	private  Integer readyInMinutes;
	private String sourceUrl;
	private Long extRecipeId;
	private boolean glutenFree;
	private boolean ketogenic;
	private boolean dairyFree;
	private boolean vegan;
	private boolean vegetarian;
	
	@OneToMany(mappedBy="recipe")
	private List<Ingredients> extendedIngredients;
	
	
	public List<Ingredients> getExtendedIngredients() {
		return extendedIngredients;
	}
	public void setExtendedIngredients(List<Ingredients> extendedIngredients) {
		this.extendedIngredients = extendedIngredients;
	}
	public boolean isGlutenFree() {
		return glutenFree;
	}
	public void setGlutenFree(boolean glutenFree) {
		this.glutenFree = glutenFree;
	}
	public boolean isKetogenic() {
		return ketogenic;
	}
	public void setKetogenic(boolean ketogenic) {
		this.ketogenic = ketogenic;
	}
	public boolean isDairyFree() {
		return dairyFree;
	}
	public void setDairyFree(boolean dairyFree) {
		this.dairyFree = dairyFree;
	}
	public boolean isVegan() {
		return vegan;
	}
	public void setVegan(boolean vegan) {
		this.vegan = vegan;
	}
	public boolean isVegetarian() {
		return vegetarian;
	}
	public void setVegetarian(boolean vegetarian) {
		this.vegetarian = vegetarian;
	}
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
				+ sourceUrl + ", extRecipeId=" + extRecipeId + ", glutenFree=" + glutenFree + ", ketogenic=" + ketogenic
				+ ", dairyFree=" + dairyFree + ", vegan=" + vegan + ", vegetarian=" + vegetarian + "]";
	}
	
	
	
}

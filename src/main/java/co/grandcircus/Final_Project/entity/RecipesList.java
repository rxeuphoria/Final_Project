package co.grandcircus.Final_Project.entity;

public class RecipesList {

	private Double calories;
	private String carbs;
	private String fat;
	private Long id;
	private String image;
	private String protein;
	private String title;
	

	public Double getCalories() {
		return calories;
	}
	public void setCalories(Double calories) {
		this.calories = calories;
	}
	public String getCarbs() {
		return carbs;
	}
	public void setCarbs(String carbs) {
		this.carbs = carbs;
	}
	public String getFat() {
		return fat;
	}
	public void setFat(String fat) {
		this.fat = fat;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getProtein() {
		return protein;
	}
	public void setProtein(String protein) {
		this.protein = protein;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Override
	public String toString() {
		return "RecipesList [calories=" + calories + ", carbs=" + carbs + ", fat=" + fat + ", id=" + id + ", image="
				+ image + ", protein=" + protein + ", title=" + title + "]";
	}
	
	
	
	
	
	
}

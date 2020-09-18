package co.grandcircus.Final_Project.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Ingredients {
@Id	
@GeneratedValue(strategy = GenerationType.IDENTITY)
private Long id;
 private String image;
 private String name;
 private String original;
 
 @ManyToOne
 Recipe recipe;
 
 
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public Recipe getRecipe() {
	return recipe;
}
public void setRecipe(Recipe recipe) {
	this.recipe = recipe;
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
public String getOriginal() {
	return original;
}
public void setOriginal(String original) {
	this.original = original;
}
@Override
public String toString() {
	return "Ingredients [id=" + id + ", image=" + image + ", name=" + name + ", original=" + original + ", recipe="
			+ recipe + "]";
}

 
}

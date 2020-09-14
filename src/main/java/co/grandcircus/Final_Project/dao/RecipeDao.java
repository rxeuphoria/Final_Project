package co.grandcircus.Final_Project.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import co.grandcircus.Final_Project.entity.Recipe;

public interface RecipeDao  extends JpaRepository<Recipe,Long>{

}

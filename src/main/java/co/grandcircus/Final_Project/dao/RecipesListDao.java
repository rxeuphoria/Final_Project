package co.grandcircus.Final_Project.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import co.grandcircus.Final_Project.entity.RecipesList;

public interface RecipesListDao extends JpaRepository<RecipesList,Long>{

}

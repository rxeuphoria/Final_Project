package co.grandcircus.Final_Project.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import co.grandcircus.Final_Project.entity.Recipe;

public interface RecipeDao  extends JpaRepository<Recipe,Long>{
 @Query("from Recipe where id=:id")
 Recipe findAllById(@Param("id") Long id);
}
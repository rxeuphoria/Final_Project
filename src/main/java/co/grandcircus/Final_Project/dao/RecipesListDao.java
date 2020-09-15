package co.grandcircus.Final_Project.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import co.grandcircus.Final_Project.entity.RecipesList;

public interface RecipesListDao extends JpaRepository<RecipesList,Long>{

	@Query("select sum(carbs) from RecipesList where user_id=:userId")
	Double findByTotalCarbs(@Param("userId") Long userId);
	@Query("select sum(protein) from RecipesList where user_id=:userId")
	Double findByTotalProtein(@Param("userId") Long userId);
	@Query("select sum(fat) from RecipesList where user_id=:userId")
	Double findByTotalFats(@Param("userId") Long userId);
	@Query("from RecipesList where user_id=:userId")
	List<RecipesList> findAllResults(@Param("userId") Long userId);
}

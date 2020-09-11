package co.grandcircus.Final_Project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.grandcircus.Final_Project.api.FinalApi;
import co.grandcircus.Final_Project.entity.Recipe;
import co.grandcircus.Final_Project.entity.RecipesList;

@Controller
public class FinalController {

	@Autowired
	FinalApi api;
	
	@RequestMapping("/")
	public String addNutrients() {
		return "home";
	}
	
	@RequestMapping("/showRecipes")
	public String showRecipes(Model model,@RequestParam("minCarbs") Double minCarbs,
								@RequestParam("maxCarbs") Double maxCarbs,
								@RequestParam("number") Integer number) {
		RecipesList[] recipes= api.showRecipesList(minCarbs, maxCarbs, number);
		model.addAttribute("recipes",recipes);
		return "show-recipes";
	}
	
	@RequestMapping("/showdetails")
	public String detailsRecipes(Model model,@RequestParam("id") Long id) {
		Recipe recipe=api.showDetails(id);
		model.addAttribute("recipe",recipe);
		return "details";
	}

}

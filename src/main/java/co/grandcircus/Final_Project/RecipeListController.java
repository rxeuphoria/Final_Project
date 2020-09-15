package co.grandcircus.Final_Project;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.grandcircus.Final_Project.api.FinalApi;
//import co.grandcircus.Final_Project.dao.RecipeDao;
import co.grandcircus.Final_Project.dao.RecipesListDao;
import co.grandcircus.Final_Project.dao.UserDao;
import co.grandcircus.Final_Project.entity.Recipe;

@Controller
public class RecipeListController {
	
	@Autowired
	FinalApi api;
	
	@Autowired
	RecipesListDao listDao;
	
	
	@Autowired
	UserDao userDao;
	

	@Autowired
	HttpSession session;

	//@Autowired
//	RecipeDao recipeDao;

	@RequestMapping("/external-recipe")
	public String showExternalRecipe(Model model, @RequestParam("id") Long id) {
		Recipe targetRecipe = api.showDetails(id);
		model.addAttribute("targetRecipe", targetRecipe);
		String url = targetRecipe.getSourceUrl();
		return "redirect:" + url;
	}
}

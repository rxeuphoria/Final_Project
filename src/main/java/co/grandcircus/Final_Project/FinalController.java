package co.grandcircus.Final_Project;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import co.grandcircus.Final_Project.api.FinalApi;
import co.grandcircus.Final_Project.dao.RecipeDao;
import co.grandcircus.Final_Project.dao.RecipesListDao;
import co.grandcircus.Final_Project.dao.UserDao;
import co.grandcircus.Final_Project.entity.Recipe;
import co.grandcircus.Final_Project.entity.RecipesList;
import co.grandcircus.Final_Project.entity.User;

@Controller
public class FinalController {

	@Autowired
	FinalApi api;
	
	@Autowired
	RecipesListDao listDao;
	
	
	@Autowired
	UserDao userDao;
	

	@Autowired
	HttpSession session;

	@Autowired
	RecipeDao recipeDao;
	
	double BMR=0,TEE=0,carbs=0,protein=0,fats=0;
	double wallet=0,totalCarbs=0,totalProtein=0,totalFats=0;

	
	@RequestMapping("/")
	public String welcomeOrLogin() {
		if(session.getAttribute("user")!=null){
		return "welcome";
		}else {
			return "login";
		}
	}

	@RequestMapping("/login-submit")
	public String submitLoginForm(Model model,@RequestParam("email") String email,
									@RequestParam("password") String password) {
		Optional<User> foundUser =userDao.findByEmailAndPassword(email, password);
		if(foundUser.isPresent()) {
			session.setAttribute("user", foundUser.get());
			return "redirect:/show-data";
		}else {
			model.addAttribute("message","Incorrect email and password");
			return "login";
		}
	}


	@RequestMapping("/home")
	public String addNutrients() {
		return "home";
	}
	
	
	
	@RequestMapping("/signup")
	public String showSignupForm() {
		return "signup";
	}

	@PostMapping("/signup")
	public String submitSignupForm(
			User user,
			@RequestParam("confirm-password") String confirmPassword, 
			Model model, RedirectAttributes redir) {
		// Find the matching user.
		User existingUser = userDao.findByEmail(user.getEmail());
		if (existingUser != null) {
			// If user already exists, display an error message.
			model.addAttribute("message", "A user with that email already exists.");
			return "signup";
		}
		
		if (!confirmPassword.equals(user.getPassword())) {
			// If the user or passwords don't match, display an error message.
			model.addAttribute("message", "Passwords do not match.");
			return "signup";
		}
		
		userDao.save(user);
		
		// On successful sign-up, add the user to the session.
		session.setAttribute("user", user);
		
		// A flash message will only show on the very next page. Then it will go away.
		// It is useful with redirects since you can't add attributes to the mav.
		redir.addFlashAttribute("message", "Thanks for signing up!");
		return "redirect:/";
	}

	
	@RequestMapping("/calculations")
	public String performCalc(Model model,@RequestParam("gender") String gender,
								@RequestParam("height") Double height,
								@RequestParam("height_unit")String height_unit,
								@RequestParam("weight") Double weight,
								@RequestParam("weight_unit") String weight_unit,
								@RequestParam("age") Integer age,
								@RequestParam("activity") Double level,
								@RequestParam("interval") Integer interval) {
			if(gender.equals("F")) {
		if(height_unit.contentEquals("centimeter") && weight_unit.equals("kilogram")) {

			BMR=655.1 +(9.563*weight) + (1.850 * height) - (4.676 * age);
		}
		if(height_unit.contentEquals("centimeter") && weight_unit.contentEquals("pound")) {
			BMR=655.1 +(9.563*(weight/2.205)) + (1.850 * height) - (4.676 * age);
		}
		if(height_unit.contentEquals("inches") && weight_unit.contentEquals("kilogram")) {
			BMR=655.1 +(9.563 * weight) + (1.850 * (height/0.394)) - (4.676 * age);
		}
		if(height_unit.equals("inches") && weight_unit.equals("pound")) {
			BMR=655.1 +(9.563*(weight/2.205)) + (1.850  * (height/0.394)) - (4.676 * age);
		}
		
		TEE=BMR*level;
		
		TEE=BMR*level;
		carbs=(TEE*0.4)/4;
		protein=(TEE*0.3)/4;
		fats=(TEE*0.3)/9;
		
		wallet=TEE*interval;
		totalCarbs=carbs*interval;
		totalProtein=protein*interval;
		totalFats=fats*interval;
	 
		System.out.println("hello");
		
      model.addAttribute("TEE",TEE);
      model.addAttribute("carbs",carbs);
      model.addAttribute("protein",protein);
      model.addAttribute("fats",fats);
      
      model.addAttribute("wallet",wallet);
      model.addAttribute("totalCarbs",totalCarbs);
      model.addAttribute("totalProtein",totalProtein);
      model.addAttribute("totalFats",totalFats);
      
      User user=(User)session.getAttribute("user");
      user=userDao.findById(user.getId()).get();

      user.setGender(gender);
      user.setHeight(height);
      user.setWeight(weight);
      user.setAge(age);
      user.setActivityLevel(level);
      user.setShoppingInterval(interval);
      user.setTotalCalories(wallet);
      user.setTotalCarbs(totalCarbs);
      user.setTotalProtein(totalProtein);
      user.setTotalFats(totalFats);
  
    
      userDao.save(user);

	}

	if(gender.equals("M")) {
		if(height_unit.contentEquals("centimeter") && weight_unit.equals("kilogram")) {
			BMR=66.47 +(13.75*weight) + (5.003* height) - (6.755 * age);
		}
		if(height_unit.contentEquals("centimeter") && weight_unit.contentEquals("pound")) {
			BMR=66.47 +(13.75* (weight/2.205)) + (5.003* height) - (6.755* age);
		}
		if(height_unit.contentEquals("inches") && weight_unit.contentEquals("kilogram")) {
			BMR=66.47 +(13.75* weight) + (5.003* (height/0.394)) - (6.755 * age);
		}
		if(height_unit.equals("inches") && weight_unit.equals("pound")) {
			BMR= (66.47 + (13.75 * (weight/2.205)) + (5.003 * (height/0.394)) - (6.755 * age));
		}
		
		TEE=BMR*level;
		carbs=(TEE*0.4)/4;
		protein=(TEE*0.3)/4;
		fats=(TEE*0.3)/9;
		
		wallet=TEE*interval;
		totalCarbs=carbs*interval;
		totalProtein=protein*interval;
		totalFats=fats*interval;
		
      model.addAttribute("TEE",TEE);
      model.addAttribute("carbs",carbs);
      model.addAttribute("protein",protein);
      model.addAttribute("fats",fats);
      model.addAttribute("wallet",wallet);
      model.addAttribute("totalCarbs",totalCarbs);
      model.addAttribute("totalProtein",totalProtein);
      model.addAttribute("totalFats",totalFats);
      
      User user=(User)session.getAttribute("user");
      user=userDao.findById(user.getId()).get();

      user.setGender(gender);
      user.setHeight(height);
      user.setWeight(weight);
      user.setAge(age);
      user.setActivityLevel(level);
      user.setShoppingInterval(interval);
      user.setTotalCalories(wallet);
      user.setTotalCarbs(totalCarbs);
      user.setTotalProtein(totalProtein);
      user.setTotalFats(totalFats);
    
      userDao.save(user);

	}

	
	 return "redirect:/show-data";
	}
	
	@RequestMapping("/fetch-profile")
	public String showProfile(Model model) {
		User user=(User)session.getAttribute("user");
		user=userDao.findById(user.getId()).get();
		String gender=user.getGender();
		Double height=user.getHeight();
		Double weight=user.getWeight();
		Integer age=user.getAge();
		Integer shoppingInterval=user.getShoppingInterval();
		Double cal=user.getTotalCalories();
		Double carbs=user.getTotalCarbs();
		Double protein=user.getTotalProtein();
		Double fats=user.getTotalFats();
		model.addAttribute("gender",gender);
		model.addAttribute("height",height);
		model.addAttribute("weight",weight);
		model.addAttribute("age",age);
		model.addAttribute("interval",shoppingInterval);
		model.addAttribute("cal",cal);
		model.addAttribute("carbs",carbs);
		model.addAttribute("protein",protein);
		model.addAttribute("fats",fats);
		return "";
	}
	@RequestMapping("/showRecipes")
	public String showRecipes(Model model,@RequestParam("minCarbs") Double minCarbs,
								@RequestParam("maxCarbs") Double maxCarbs,
								@RequestParam("minProtein") Double minProtein,
								@RequestParam("maxProtein") Double maxProtein,
								@RequestParam("minFats") Double minFats,
								@RequestParam("maxFats") Double maxFats,
								@RequestParam("number") Integer number) {
		RecipesList[] recipes= api.showRecipesList(minCarbs, maxCarbs, minProtein,maxProtein,minFats,maxFats,number);
		
	
	    for(int i=0;i<recipes.length;i++)
	    	recipes[i].setRecipe(api.showDetails(recipes[i].getId()));
		
	    for(int i=0;i<recipes.length;i++)
	    	recipes[i].setRecipeUrl(recipes[i].getRecipe().getSourceUrl());
	  
		
		model.addAttribute("recipes",recipes);
		return "show-recipes";
	}
	 
	@RequestMapping("/show-data")
	public String showData(Model model) {
		showProfile(model);
		User user=(User)session.getAttribute("user");
		user=userDao.findById(user.getId()).get();
	
		Double carbsValue=listDao.findByTotalCarbs(user.getId());
		Double proteinValue=listDao.findByTotalProtein(user.getId());
		Double fatsValue=listDao.findByTotalFats(user.getId());
		
		Double carbsTotal=userDao.findByCarbs(user.getId());
		Double proteinTotal=userDao.findByProtein(user.getId());
		Double fatsTotal=userDao.findByFats(user.getId());
		
		if(carbsValue==null) {
			carbsValue=0.0;
		}
		if(proteinValue==null) {
			proteinValue=0.0;
		}
		if(fatsValue==null) {
			fatsValue=0.0;
		}
		Double leftCarbs=0.0;
		Double leftProtein=0.0;
		Double leftFats=0.0;
		if(carbsValue!=null && proteinValue!=null && fatsValue!=null) {
		 leftCarbs=carbsTotal-carbsValue;
		 leftProtein=proteinTotal-proteinValue;
		leftFats=fatsTotal-fatsValue;
		}
	
		model.addAttribute("leftCarbs",leftCarbs);
		model.addAttribute("leftProtein",leftProtein);
		model.addAttribute("leftFats",leftFats);
		

		List<RecipesList> list=listDao.findAllResults(user.getId());

		model.addAttribute("list",list);
		return "dashboard";
		
	}
		
	
	@RequestMapping("/save-recipe")
		public String saveRecipeInList(RecipesList recipeList, Recipe recipe,Model model) {
		User user=(User)session.getAttribute("user");
		user=userDao.findById(user.getId()).get();
		recipeList.setUser(user);
		
		listDao.save(recipeList);
		recipe.setId(recipeList.getId());
		recipe.setTitle(recipeList.getTitle());
		recipe.setSourceUrl(recipeList.getRecipeUrl());
		recipeList.setRecipe(recipe);
	//	recipeDao.save(recipe);
		return "redirect:/show-data";
	}
	@RequestMapping("/delete-recipe")
	public String deleteRecipe(RecipesList recipeList,@RequestParam("id") Long id) {
		User user=(User)session.getAttribute("user");
		user=userDao.findById(user.getId()).get();
		recipeList.setUser(user);
		listDao.deleteById(id);
		return "redirect:/show-data";
		
	}

	@RequestMapping("/remove-recipe")
	public String removeRecipe(RecipesList recipeList) {
		User user=(User)session.getAttribute("user");
		user=userDao.findById(user.getId()).get();
		recipeList.setUser(user);
		listDao.delete(recipeList);
		return "";
	}

	
	@RequestMapping("/logout")
	public String logout(RedirectAttributes redir) {
		// invalidate clears the current user session and starts a new one.
		session.invalidate();
		
		// A flash message will only show on the very next page. Then it will go away.
		// It is useful with redirects since you can't add attributes to the mav.
		redir.addFlashAttribute("message", "Logged out.");
		return "redirect:/";
	}
	
}

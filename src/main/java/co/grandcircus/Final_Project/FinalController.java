package co.grandcircus.Final_Project;

import java.time.LocalDate;
import java.time.temporal.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
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
import co.grandcircus.Final_Project.dao.IngredientsDao;
import co.grandcircus.Final_Project.dao.RecipeDao;
import co.grandcircus.Final_Project.dao.RecipesListDao;
import co.grandcircus.Final_Project.dao.UserDao;
import co.grandcircus.Final_Project.entity.Ingredients;
import co.grandcircus.Final_Project.entity.Recipe;
import co.grandcircus.Final_Project.entity.RecipesList;
import co.grandcircus.Final_Project.entity.User;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;

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
	
	@Autowired
	IngredientsDao iDao;
	
	double BMR=0,TEE=0,carbs=0,protein=0,fats=0;
	double wallet=0,totalCarbs=0,totalProtein=0,totalFats=0;
	double remainingCarbs=0,remainingProtein=0,remainingFats=0;
	String plan=null;
  
	int edit=0;
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	Date start = new Date();
	String s=formatter.format(start);
	Date newDate = addDays(start, 1);
	String s1=formatter.format(newDate);
	
	public  Date addDays(Date date, int days) {
		GregorianCalendar cal = new GregorianCalendar();
		cal.setTime(date);
		cal.add(Calendar.DATE, days);
				
		return cal.getTime();
	}
  
	@RequestMapping("/")
	public String welcomeOrLogin(Model model) {
		if(session.getAttribute("user")!=null){
			model.addAttribute("start",s);
			model.addAttribute("end",s1);
		return "welcome";
		}else {
			return "login";
		}
	}

	@RequestMapping("/login-submit")
	public String submitLoginForm(Model model, @RequestParam("email") String email,
			@RequestParam("password") String password) {
		Optional<User> foundUser = userDao.findByEmailAndPassword(email, password);
		if (foundUser.isPresent()) {
			session.setAttribute("user", foundUser.get());
			return "redirect:/show-data";
		} else {
			model.addAttribute("message", "Incorrect email and password");
			return "login";
		}
	}

	@RequestMapping("/home")
	public String addNutrients(Model model) {
		DecimalFormat df = new DecimalFormat("0.0");
	    String remainCarbs=df.format(remainingCarbs);
	    String remainProtein=df.format(remainingProtein);
	    String remainFats=df.format(remainingFats);
		model.addAttribute("carbslimit", remainingCarbs);
		model.addAttribute("proteinlimit", remainingProtein);
		model.addAttribute("fatslimit", remainingFats); 
		model.addAttribute("carbsInWallet",remainCarbs);
		model.addAttribute("proteinInWallet",remainProtein);
		model.addAttribute("fatsInWallet",remainFats);
		return "home";
	}

	@RequestMapping("/signup")
	public String showSignupForm() {
		return "signup";
	}

	@PostMapping("/signup")
	public String submitSignupForm(User user, @RequestParam("confirm-password") String confirmPassword, Model model,
			RedirectAttributes redir) {
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
	public String performCalc(Model model, @RequestParam("gender") String gender, @RequestParam("height") Double height,
			@RequestParam("height_unit") String height_unit, @RequestParam("weight") Double weight,
			@RequestParam("weight_unit") String weight_unit, @RequestParam("age") Integer age,
			@RequestParam("change") Double change, @RequestParam("activity") Double level,
			@RequestParam("datepickerStart") String startDate, @RequestParam("datepickerEnd") String endDate) {

		LocalDate start = LocalDate.parse(startDate);
		LocalDate end = LocalDate.parse(endDate);
		long interval = ChronoUnit.DAYS.between(start, end);

		if (gender.equals("F")) {
			if (height_unit.contentEquals("cms") && weight_unit.equals("kg")) {

				BMR = 655.1 + (9.563 * weight) + (1.850 * height) - (4.676 * age);
			}
			if (height_unit.contentEquals("cms") && weight_unit.contentEquals("pound")) {
				BMR = 655.1 + (9.563 * (weight / 2.205)) + (1.850 * height) - (4.676 * age);
			}
			if (height_unit.contentEquals("inches") && weight_unit.contentEquals("kg")) {
				BMR = 655.1 + (9.563 * weight) + (1.850 * (height / 0.394)) - (4.676 * age);
			}
			if (height_unit.equals("inches") && weight_unit.equals("pound")) {
				BMR = 655.1 + (9.563 * (weight / 2.205)) + (1.850 * (height / 0.394)) - (4.676 * age);
			}

			TEE = BMR * level;
			System.out.println("TEE" + TEE);

			if (change == 500) {
				TEE = TEE + 500;
				plan = "Gain 1 pound";
			}
			if (change == 250) {
				TEE = TEE + 250;
				plan = "Gain 0.5 pound";
			}
			if (change == 0) {
				TEE = TEE + 0;
				plan = "Maintain";
			}
			if (change == -250) {
				TEE = TEE - 250;
				plan = "Loose 0.5 pound";
			}
			if (change == -500) {
				TEE = TEE - 500;
				plan = "Loose 1 pound";
			}
			carbs = (TEE * 0.4) / 4;
			protein = (TEE * 0.3) / 4;
			fats = (TEE * 0.3) / 9;

			wallet = TEE * interval;
			totalCarbs = carbs * interval;
			totalProtein = protein * interval;
			totalFats = fats * interval;

			model.addAttribute("TEE", TEE);
			model.addAttribute("carbs", carbs);
			model.addAttribute("protein", protein);
			model.addAttribute("fats", fats);

			model.addAttribute("wallet", wallet);
			model.addAttribute("totalCarbs", totalCarbs);
			model.addAttribute("totalProtein", totalProtein);
			model.addAttribute("totalFats", totalFats);

			User user = (User) session.getAttribute("user");
			user = userDao.findById(user.getId()).get();

			user.setGender(gender);
			user.setHeight(height);
			user.setHeight_unit(height_unit);
			user.setWeight_unit(weight_unit);
			user.setWeight(weight);
			user.setAge(age);
			user.setPlan(plan);
			user.setActivityLevel(level);
			user.setShoppingInterval(interval);
			user.setTotalCalories(wallet);
			user.setTotalCarbs(totalCarbs);
			user.setTotalProtein(totalProtein);
			user.setTotalFats(totalFats);

			userDao.save(user);

		}

		if (gender.equals("M")) {
			if (height_unit.contentEquals("cms") && weight_unit.equals("kg")) {
				BMR = 66.47 + (13.75 * weight) + (5.003 * height) - (6.755 * age);
			}
			if (height_unit.contentEquals("cms") && weight_unit.contentEquals("pound")) {
				BMR = 66.47 + (13.75 * (weight / 2.205)) + (5.003 * height) - (6.755 * age);
			}
			if (height_unit.contentEquals("inches") && weight_unit.contentEquals("kg")) {
				BMR = 66.47 + (13.75 * weight) + (5.003 * (height / 0.394)) - (6.755 * age);
			}
			if (height_unit.equals("inches") && weight_unit.equals("pound")) {
				BMR = (66.47 + (13.75 * (weight / 2.205)) + (5.003 * (height / 0.394)) - (6.755 * age));
			}

			TEE = BMR * level;
			if (change == 500) {
				TEE = TEE + 500;
				plan = "Gain 1 pound";
			}
			if (change == 250) {
				TEE = TEE + 250;
				plan = "Gain 0.5 pound";
			}
			if (change == 0) {
				TEE = TEE + 0;
				plan = "Maintain";
			}
			if (change == -250) {
				TEE = TEE - 250;
				plan = "Loose 0.5 pound";
			}
			if (change == -500) {
				TEE = TEE - 500;
				plan = "Loose 1 pound";
			}
			carbs = (TEE * 0.4) / 4;
			protein = (TEE * 0.3) / 4;
			fats = (TEE * 0.3) / 9;

			wallet = TEE * interval;
			totalCarbs = carbs * interval;
			totalProtein = protein * interval;
			totalFats = fats * interval;

			model.addAttribute("TEE", TEE);
			model.addAttribute("carbs", carbs);
			model.addAttribute("protein", protein);
			model.addAttribute("fats", fats);
			model.addAttribute("wallet", wallet);
			model.addAttribute("totalCarbs", totalCarbs);
			model.addAttribute("totalProtein", totalProtein);
			model.addAttribute("totalFats", totalFats);

			User user = (User) session.getAttribute("user");
			user = userDao.findById(user.getId()).get();

			user.setGender(gender);
			user.setHeight(height);
			user.setWeight(weight);
			user.setHeight_unit(height_unit);
			user.setWeight_unit(weight_unit);
			user.setAge(age);
			user.setActivityLevel(level);
			user.setShoppingInterval(interval);
			user.setPlan(plan);
			user.setTotalCalories(wallet);
			user.setTotalCarbs(totalCarbs);
			user.setTotalProtein(totalProtein);
			user.setTotalFats(totalFats);

			userDao.save(user);

		}
		
	
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
      user.setHeight_unit(height_unit);
      user.setWeight_unit(weight_unit);
      user.setAge(age);
      user.setActivityLevel(level);
      user.setShoppingInterval(interval);
      user.setPlan(plan);
      user.setTotalCalories(wallet);
      user.setTotalCarbs(totalCarbs);
      user.setTotalProtein(totalProtein);
      user.setTotalFats(totalFats);
    
      userDao.save(user);
	
	
	 return "redirect:/show-data";
}
	


	
	@RequestMapping("/fetch-profile")
	public String showProfile(Model model) {
		User user = (User) session.getAttribute("user");
		user = userDao.findById(user.getId()).get();
		String gender = user.getGender();
		Double height = user.getHeight();
		String height_unit = user.getHeight_unit();
		Double weight = user.getWeight();
		String weight_unit = user.getWeight_unit();
		Integer age = user.getAge();
		Long shoppingInterval = user.getShoppingInterval();
		Double cal = user.getTotalCalories();
		Double carbs = user.getTotalCarbs();
		Double protein = user.getTotalProtein();
		Double fats = user.getTotalFats();
		String plan = user.getPlan();
		model.addAttribute("gender", gender);
		model.addAttribute("height", height);
		model.addAttribute("height_unit", height_unit);
		model.addAttribute("weight", weight);
		model.addAttribute("weight_unit", weight_unit);
		model.addAttribute("age", age);
		model.addAttribute("interval", shoppingInterval);
		model.addAttribute("cal", cal);
		model.addAttribute("carbs", carbs);
		model.addAttribute("protein", protein);
		model.addAttribute("fats", fats);
		model.addAttribute("plan", plan);
		return "";
	}

	@RequestMapping("/showRecipes")
	public String showRecipes(Model model, @RequestParam("minCarbs") Double minCarbs,
			@RequestParam("maxCarbs") Double maxCarbs, @RequestParam("minProtein") Double minProtein,
			@RequestParam("maxProtein") Double maxProtein, @RequestParam("minFats") Double minFats,
			@RequestParam("maxFats") Double maxFats, @RequestParam("number") Integer number) {
		RecipesList[] recipes = api.showRecipesList(minCarbs, maxCarbs, minProtein, maxProtein, minFats, maxFats,
				number);
	    model.addAttribute("recipes", recipes);
		model.addAttribute("carbslimit", remainingCarbs);
		model.addAttribute("proteinlimit", remainingProtein);
		model.addAttribute("fatslimit", remainingFats);

		return "show-recipes";
	}

	
	@RequestMapping("/ingredients-list")
	public String showShoppingList(Model model)
	{
		User user = (User) session.getAttribute("user");
		user = userDao.findById(user.getId()).get();
		List<RecipesList> recipesList=listDao.findAllResults(user.getId());
		List<Ingredients> ingredients=new ArrayList<>();
		List<Recipe> recipeName=new ArrayList<>();
		for(int i=0;i<recipesList.size();i++) {
		  Recipe recipe=recipesList.get(i).getRecipe();
		  recipeName.add(recipe);
		  for(Ingredients ing:recipe.getExtendedIngredients()) {
			   ingredients.add(ing);
		  }
		}
		model.addAttribute("recipe",recipeName);
		model.addAttribute("ingredients",ingredients);
		return "shopping-list";
	}
	
	@RequestMapping("/show-data")
	public String showData(Model model) {
		showProfile(model);
		User user = (User) session.getAttribute("user");
		user = userDao.findById(user.getId()).get();

		Double carbsValue = listDao.findByTotalCarbs(user.getId());
		Double proteinValue = listDao.findByTotalProtein(user.getId());
		Double fatsValue = listDao.findByTotalFats(user.getId());

		Double carbsTotal = userDao.findByCarbs(user.getId());
		Double proteinTotal = userDao.findByProtein(user.getId());
		Double fatsTotal = userDao.findByFats(user.getId());

		if (carbsValue == null) {
			carbsValue = 0.0;
		}
		if (proteinValue == null) {
			proteinValue = 0.0;
		}
		if (fatsValue == null) {
			fatsValue = 0.0;
		}
		Double leftCarbs = 0.0;
		Double leftProtein = 0.0;
		Double leftFats = 0.0;
		if (carbsValue != null && proteinValue != null && fatsValue != null) {
			leftCarbs = carbsTotal - carbsValue;
			leftProtein = proteinTotal - proteinValue;
			leftFats = fatsTotal - fatsValue;
		}
		remainingCarbs = leftCarbs;
		remainingProtein = leftProtein;
		remainingFats = leftFats;

		model.addAttribute("leftCarbs", leftCarbs);
		model.addAttribute("leftProtein", leftProtein);
		model.addAttribute("leftFats", leftFats);

		List<RecipesList> list = listDao.findAllResults(user.getId());
		model.addAttribute("list", list);
		return "dashboard";

	}

	@RequestMapping("/save-recipe")
	public String saveRecipeInList(RecipesList recipeList, Recipe recipe, Model model, @RequestParam("extRecipeId") Long extRecipeId) {
		User user = (User) session.getAttribute("user");
		user = userDao.findById(user.getId()).get();
		recipeList.setUser(user);
		Recipe targetRecipe = api.showDetails(extRecipeId);
		model.addAttribute("targetRecipe", targetRecipe);
	
		recipe.setId(recipeList.getId());
		recipe.setExtRecipeId(extRecipeId);
		recipe.setTitle(recipeList.getTitle());
		
	  List<Ingredients> ingredients=targetRecipe.getExtendedIngredients();
	  recipe.setDairyFree(targetRecipe.isDairyFree());
	  recipe.setGlutenFree(targetRecipe.isGlutenFree());
	  recipe.setKetogenic(targetRecipe.isKetogenic());
	  recipe.setVegan(targetRecipe.isVegan());
	  recipe.setVegetarian(targetRecipe.isVegetarian());
      for(int i=0;i<ingredients.size();i++) {
    	    ingredients.get(i).setRecipe(recipe);
      }
		String url = targetRecipe.getSourceUrl();
    
		recipeList.setRecipeUrl(url);
		recipe.setSourceUrl(url);
		recipeList.setRecipe(recipe);
		recipeDao.save(recipe);
		listDao.save(recipeList);
		for(int i=0;i<ingredients.size();i++)
		iDao.save(ingredients.get(i));
		return "redirect:/show-data";
	}

	@RequestMapping("/delete-recipe")
	public String deleteRecipe(RecipesList recipeList, @RequestParam("id") Long id) {
		User user = (User) session.getAttribute("user");
		user = userDao.findById(user.getId()).get();
		recipeList.setUser(user);
		listDao.deleteById(id);
		return "redirect:/show-data";

	}

	@RequestMapping("/edit")
	public String editProfile(Model model) {

		User user=(User)session.getAttribute("user");
		user=userDao.findById(user.getId()).get();
		model.addAttribute("user",user);
		model.addAttribute("start",s);
		model.addAttribute("end",s1);
	   return "edit-profile";
		
	}
		
@RequestMapping("/edit-submit")
public String editSubmit(Model model,@RequestParam("gender") String gender,
		@RequestParam("height") Double height,
		@RequestParam("height_unit")String height_unit,
		@RequestParam("weight") Double weight,
		@RequestParam("weight_unit") String weight_unit,
		@RequestParam("age") Integer age,
		@RequestParam("change") Double change, 
		@RequestParam("activity") Double level, 
		@RequestParam("datepickerStart") String startDate,
		@RequestParam("datepickerEnd") String endDate) {
	LocalDate start = LocalDate.parse(startDate);
	LocalDate end = LocalDate.parse(endDate);
	long interval = ChronoUnit.DAYS.between(start, end);

	
	if(gender.equals("F")) {
	if(height_unit.contentEquals("cms") && weight_unit.equals("kg")) {

		BMR=655.1 +(9.563*weight) + (1.850 * height) - (4.676 * age);
	}
	if(height_unit.contentEquals("cms") && weight_unit.contentEquals("pound")) {
		BMR=655.1 +(9.563*(weight/2.205)) + (1.850 * height) - (4.676 * age);
	}
	if(height_unit.contentEquals("inches") && weight_unit.contentEquals("kg")) {
		BMR=655.1 +(9.563 * weight) + (1.850 * (height/0.394)) - (4.676 * age);
	}
	if(height_unit.equals("inches") && weight_unit.equals("pound")) {
		BMR=655.1 +(9.563*(weight/2.205)) + (1.850  * (height/0.394)) - (4.676 * age);
	}
	
	TEE=BMR*level;
	System.out.println("TEE"+TEE);
	
	if(change==500) {
		TEE=TEE+500;
		plan="Gain 1 pound";
	}
	if(change==250) {
		TEE=TEE+250;
		plan="Gain 0.5 pound";
	}
	if(change==0) {
		TEE=TEE+0;
		plan="Maintain";
	}
	if(change==-250) {
		TEE=TEE-250;
		plan="Loose 0.5 pound";
	}
	if(change==-500) {
		TEE=TEE-500;
		plan="Loose 1 pound";
	}
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
  user.setHeight_unit(height_unit);
  user.setWeight_unit(weight_unit);
  user.setWeight(weight);
  user.setAge(age);
  user.setPlan(plan);
  user.setActivityLevel(level);
  user.setShoppingInterval(interval);
  user.setTotalCalories(wallet);
  user.setTotalCarbs(totalCarbs);
  user.setTotalProtein(totalProtein);
  user.setTotalFats(totalFats);


  userDao.save(user);

}

if(gender.equals("M")) {
	if(height_unit.contentEquals("cms") && weight_unit.equals("kg")) {
		BMR=66.47 +(13.75*weight) + (5.003* height) - (6.755 * age);
	}
	if(height_unit.contentEquals("cms") && weight_unit.contentEquals("pound")) {
		BMR=66.47 +(13.75* (weight/2.205)) + (5.003* height) - (6.755* age);
	}
	if(height_unit.contentEquals("inches") && weight_unit.contentEquals("kg")) {
		BMR=66.47 +(13.75* weight) + (5.003* (height/0.394)) - (6.755 * age);
	}
	if(height_unit.equals("inches") && weight_unit.equals("pound")) {
		BMR= (66.47 + (13.75 * (weight/2.205)) + (5.003 * (height/0.394)) - (6.755 * age));
	}
	
	TEE=BMR*level;
	if(change==500) {
		TEE=TEE+500;
		plan="Gain 1 pound";
	}
	if(change==250) {
		TEE=TEE+250;
		plan="Gain 0.5 pound";
	}
	if(change==0) {
		TEE=TEE+0;
		plan="Maintain";
	}
	if(change==-250) {
		TEE=TEE-250;
		plan="Loose 0.5 pound";
	}
	if(change==-500) {
		TEE=TEE-500;
		plan="Loose 1 pound";
	}
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
  user.setHeight_unit(height_unit);
  user.setWeight_unit(weight_unit);
  user.setAge(age);
  user.setActivityLevel(level);
  user.setShoppingInterval(interval);
  user.setPlan(plan);
  user.setTotalCalories(wallet);
  user.setTotalCarbs(totalCarbs);
  user.setTotalProtein(totalProtein);
  user.setTotalFats(totalFats);

  userDao.save(user);
}
		return "redirect:/show-data";
	
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

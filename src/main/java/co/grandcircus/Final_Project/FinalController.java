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
import co.grandcircus.Final_Project.dao.UserDao;
import co.grandcircus.Final_Project.entity.Recipe;
import co.grandcircus.Final_Project.entity.RecipesList;
import co.grandcircus.Final_Project.entity.User;

@Controller
public class FinalController {

	@Autowired
	FinalApi api;
	
	
	@Autowired
	UserDao userDao;
	@Autowired
	HttpSession session;

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
			return "redirect:/";
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
		double BMR=0,TEE=0;
	if(gender.equals("F")) {
		if(height_unit.contentEquals("centimeter") && weight_unit.equals("kilogram")) {
			BMR=655 +(9.6*weight) + (1.8 * height) - (4.7 * age);
		}
		if(height_unit.contentEquals("centimeter") && weight_unit.contentEquals("pound")) {
			BMR=655 +(9.6*2.205*weight) + (1.8 * height) - (4.7 * age);
		}
		if(height_unit.contentEquals("inches") && weight_unit.contentEquals("kilogram")) {
			BMR=655 +(9.6 * weight) + (1.8 *.394 * height) - (4.7 * age);
		}
		if(height_unit.equals("inches") && weight_unit.equals("pound")) {
			BMR=655 +(9.6*2.205*weight) + (1.8 *.394 * height) - (4.7 * age);
		}
		
		TEE=BMR*level;
		
      model.addAttribute("TEE",TEE);
	}

	if(gender.equals("M")) {
		if(height_unit.contentEquals("centimeter") && weight_unit.equals("kilogram")) {
			BMR=66 +(13.7*weight) + (5 * height) - (6.8 * age);
		}
		if(height_unit.contentEquals("centimeter") && weight_unit.contentEquals("pound")) {
			BMR=66 +(13.7*2.205*weight) + (5* height) - (6.8 * age);
		}
		if(height_unit.contentEquals("inches") && weight_unit.contentEquals("kilogram")) {
			BMR=66 +(13.7* weight) + (5 *.394 * height) - (6.8 * age);
		}
		if(height_unit.equals("inches") && weight_unit.equals("pound")) {
			BMR=66 +(13.7*2.205*weight) + (5 *.394 * height) - (6.8 * age);
		}
		
		TEE=BMR*level;
		
      model.addAttribute("TEE",TEE);
	}

	
	 return "welcome";
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

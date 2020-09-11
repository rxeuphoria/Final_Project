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


	@RequestMapping("/add-values")
	public String addNutrients() {
		return "home";
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

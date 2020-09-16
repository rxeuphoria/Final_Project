package co.grandcircus.Final_Project.entity;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class User {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private String name;
	private String email;
	private String password;
	private String gender;
	private Double height;
	private String height_unit;
	private Double weight;
	private String weight_unit;
	private Integer age;
	private Double activityLevel;
	private Integer shoppingInterval;
	private Double totalCalories;
	private Double totalCarbs;
	private Double totalProtein;
	private Double totalFats;
	private String plan;
	
	

	public String getPlan() {
		return plan;
	}

	public void setPlan(String plan) {
		this.plan = plan;
	}

	public User() {
		super();
	}

	public User(Long id, String name, String email, String password) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	

	public String getHeight_unit() {
		return height_unit;
	}

	public void setHeight_unit(String height_unit) {
		this.height_unit = height_unit;
	}

	public String getWeight_unit() {
		return weight_unit;
	}

	public void setWeight_unit(String weight_unit) {
		this.weight_unit = weight_unit;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Double getHeight() {
		return height;
	}

	public void setHeight(Double height) {
		this.height = height;
	}
	

	public Double getWeight() {
		return weight;
	}

	public void setWeight(Double weight) {
		this.weight = weight;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public Double getActivityLevel() {
		return activityLevel;
	}

	public void setActivityLevel(Double activityLevel) {
		this.activityLevel = activityLevel;
	}

	public Integer getShoppingInterval() {
		return shoppingInterval;
	}

	public void setShoppingInterval(Integer shoppingInterval) {
		this.shoppingInterval = shoppingInterval;
	}
	
	

	public Double getTotalCalories() {
		return totalCalories;
	}

	public void setTotalCalories(Double totalCalories) {
		this.totalCalories = totalCalories;
	}

	public Double getTotalCarbs() {
		return totalCarbs;
	}

	public void setTotalCarbs(Double totalCarbs) {
		this.totalCarbs = totalCarbs;
	}

	public Double getTotalProtein() {
		return totalProtein;
	}

	public void setTotalProtein(Double totalProtein) {
		this.totalProtein = totalProtein;
	}

	public Double getTotalFats() {
		return totalFats;
	}

	public void setTotalFats(Double totalFats) {
		this.totalFats = totalFats;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", email=" + email + ", password=" + password + ", gender="
				+ gender + ", height=" + height + ", height_unit=" + height_unit + ", weight=" + weight
				+ ", weight_unit=" + weight_unit + ", age=" + age + ", activityLevel=" + activityLevel
				+ ", shoppingInterval=" + shoppingInterval + ", totalCalories=" + totalCalories + ", totalCarbs="
				+ totalCarbs + ", totalProtein=" + totalProtein + ", totalFats=" + totalFats + ", plan=" + plan + "]";
	}

	

	


	
	
}

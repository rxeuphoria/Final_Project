package co.grandcircus.Final_Project.dao;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import co.grandcircus.Final_Project.entity.User;




public interface UserDao extends JpaRepository<User, Long> {

	Optional<User> findByEmailAndPassword(String email,String password);
	User findByEmail(String email);
	
	@Query("select totalCarbs from User where id=:id")
	Double findByCarbs(@Param("id") Long userId);
	@Query("select totalProtein from User where id=:id")
	Double findByProtein(@Param("id") Long userId);
	@Query("select totalFats from User where id=:id")
	Double findByFats(@Param("id") Long userId);

	

}




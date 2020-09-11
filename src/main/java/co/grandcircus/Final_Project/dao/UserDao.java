package co.grandcircus.Final_Project.dao;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import co.grandcircus.Final_Project.entity.User;




public interface UserDao extends JpaRepository<User, Long> {

	Optional<User> findByEmailAndPassword(String email,String password);
	User findByEmail(String email);

}




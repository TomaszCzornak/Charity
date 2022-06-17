package pl.coderslab.charity.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.charity.model.User;

import java.util.List;

public interface UserRepository extends JpaRepository<User, Long> {

    User save(User user);
    User findByUserName(String userName);
    List<User> getAllBy();
    User findUserByEmail(String email);
    User findUserById(Long id);


}

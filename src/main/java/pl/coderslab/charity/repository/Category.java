package pl.coderslab.charity.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface Category extends JpaRepository<Category, Long> {

    List<Category>findAllBy();


}

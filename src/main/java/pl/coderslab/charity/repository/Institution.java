package pl.coderslab.charity.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface Institution extends JpaRepository<Long, Institution> {

    List<Institution>findAllBy();

}

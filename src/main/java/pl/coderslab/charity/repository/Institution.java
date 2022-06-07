package pl.coderslab.charity.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface Institution extends JpaRepository<Institution, Long> {

    List<Institution>findAllBy();

}

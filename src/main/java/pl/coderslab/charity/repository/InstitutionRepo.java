package pl.coderslab.charity.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.coderslab.charity.model.Institution;

import java.util.List;
@Repository
public interface InstitutionRepo extends JpaRepository<Institution, Long> {


}

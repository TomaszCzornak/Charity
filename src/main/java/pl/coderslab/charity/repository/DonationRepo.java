package pl.coderslab.charity.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pl.coderslab.charity.model.Donation;

import java.util.List;
@Repository
public interface DonationRepo extends JpaRepository<Donation, Long> {

    @Query(value = "SELECT SUM(quantity) FROM donation", nativeQuery = true)
    Long findNumberOfBags();
}

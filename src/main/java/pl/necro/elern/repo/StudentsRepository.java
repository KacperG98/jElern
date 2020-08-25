package pl.necro.elern.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import pl.necro.elern.models.Students;

public interface StudentsRepository extends JpaRepository<Students, Integer> {

}

package pl.necro.elern.controllers;

import java.util.Optional;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import pl.necro.elern.models.Students;
import pl.necro.elern.repo.StudentsRepository;

@RestController
@RequestMapping("/api/v1/students")
public class StudentController {
	private StudentsRepository studentsRepository;
	
	public StudentController(@Autowired StudentsRepository studentsRepository) {
		this.studentsRepository = studentsRepository;
	}
	
	@GetMapping
	public List<Students> findAllStudents() {
		return studentsRepository.findAll();
	}
	
	@GetMapping("${id}")
	public Optional<Students> findOneStudent(@PathVariable int id){
		return studentsRepository.findById(id);
	}
	
	@PostMapping
	public Students saveNewStudent(Students students) {
		return studentsRepository.save(students);
	}
	
	@DeleteMapping("${id}")
	public void deleteStudentById(@PathVariable int id) {
		studentsRepository.deleteById(id);
	}
	
}

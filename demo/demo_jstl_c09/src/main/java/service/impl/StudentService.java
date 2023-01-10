package service.impl;

import model.Student;
import model.Student1;
import repository.IStudentRepository;
import repository.impl.StudentRepository;
import service.IStudentService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class StudentService  implements IStudentService {
    private IStudentRepository studentRepository = new StudentRepository();
    @Override
    public List<Student1> findAll() {

        return studentRepository.findAll();
    }

    @Override
    public List<Student1> search(String searchName, String searchClassId) {
        return studentRepository.search(searchName,searchClassId);
    }

    @Override
    public Student findById(int id) {
        return null;
    }

    @Override
    public Map<String,String> save(Student1 student) {
        Map<String,String> errorMap = new HashMap<>();
        // cần kiểm tra dữ liệu (validate dữ liêu)
        if (student.getPoint()<0){
            errorMap.put("point", "Điểm phải lớn hơn 0");
        }else if (student.getPoint()>10){
            errorMap.put("point", "Điểm phải nhỏ hơn 10");
        }
        if ("".equals(student.getName())){
            errorMap.put("name", "Tên không được để trống");
        }
        if (errorMap.isEmpty()){
            studentRepository.save(student);
        }
        return errorMap;
    }

    @Override
    public boolean delete(int id) {
        return studentRepository.delete(id);
    }
}

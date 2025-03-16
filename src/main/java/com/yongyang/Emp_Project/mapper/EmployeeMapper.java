package com.yongyang.Emp_Project.mapper;

import com.yongyang.Emp_Project.dto.EmployeeDto;
import com.yongyang.Emp_Project.entity.Employee;

public class EmployeeMapper {
    public static EmployeeDto toDTO(Employee employee){
        return new EmployeeDto(
                employee.getId(),
                employee.getFirstName(),
                employee.getFirstName(),
                employee.getDateOfBirth(),
                employee.getDateOfEntry(),
                employee.getGender(),
                employee.getAddress(),
                employee.getDepartment(),
                employee.getEmail(),
                employee.getPhoneNo()
        );
    }
    public static Employee toEntity(EmployeeDto dto){
        return new Employee(
                dto.getId(),
                dto.getFirstName(),
                dto.getFirstName(),
                dto.getDateOfBirth(),
                dto.getDateOfEntry(),
                dto.getGender(),
                dto.getAddress(),
                dto.getDepartment(),
                dto.getEmail(),
                dto.getPhoneNo()
        );
    }
}

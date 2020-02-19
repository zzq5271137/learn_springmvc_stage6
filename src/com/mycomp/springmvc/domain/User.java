package com.mycomp.springmvc.domain;

import lombok.Getter;
import lombok.Setter;

import java.util.Arrays;

@Getter
@Setter
public class User {

    private String name;
    private Integer age;
    private Integer gender;
    private String[] hobbies;

    @Override
    public String toString() {
        return "User{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", gender=" + gender +
                ", hobbies=" + Arrays.toString(hobbies) +
                '}';
    }
}

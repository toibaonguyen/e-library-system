package com.toibaonguyen.eLibrarySystem.common.entity;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Setter
@Getter
@Builder
public class User extends BaseEntity<Integer>{
    private String name;
    private String email;
    private String password;
    private String role;
    private String phone_number;
    private String status;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}

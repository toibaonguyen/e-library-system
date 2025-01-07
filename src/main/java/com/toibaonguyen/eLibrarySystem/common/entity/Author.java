package com.toibaonguyen.eLibrarySystem.common.entity;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.Date;

@Setter
@Getter
@Builder
public class Author extends BaseEntity<Integer>{
    private String name;
    private Date dateOfBirth;
    private String nationality;
    private String biography;
    private String photoUrl;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}

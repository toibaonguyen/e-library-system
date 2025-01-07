package com.toibaonguyen.eLibrarySystem.common.entity;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import java.util.Date;


@Setter
@Getter
@Builder
public class Publisher extends BaseEntity<Integer>{
    private String name;
    private String photoUrl;
    private String biography;
    private Date dateOfEstablishment;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}

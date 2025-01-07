package com.toibaonguyen.eLibrarySystem.common.entity;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;

@Setter
@Getter
@Builder
public class Book extends BaseEntity<Integer>{
    private String isbn;
    private String title;
    private String description;
    private int categoryId;
    private int authorId;
    private int publisherId;
    private int publishedYear;
    private int quantity;
    private int availableCopies;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}

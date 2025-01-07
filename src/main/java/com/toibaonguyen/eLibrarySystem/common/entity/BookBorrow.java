package com.toibaonguyen.eLibrarySystem.common.entity;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;
@Setter
@Getter
@Builder
public class BookBorrow extends BaseEntity<Integer>{
    private int bookId;
    private int userId;
    private LocalDateTime borrowDate;
    private LocalDateTime dueDate;
    private LocalDateTime returnDate;
    private String status; // Enum: Borrowed, Returned, Late
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}

package com.toibaonguyen.eLibrarySystem.common.entity;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;

@Getter
@Setter
@Builder
public class BookImage extends BaseEntity<Integer>{
    private int bookId;
    private String photoUrl;
    private LocalDateTime createdAt;
}

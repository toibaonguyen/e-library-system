package com.toibaonguyen.eLibrarySystem.common.entity;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import java.util.Date;

@Setter
@Getter
@Builder
public class Reservation extends BaseEntity<Integer>{
    private int userId;
    private int bookId;
    private LocalDateTime reservationDate;
    private String status; // Enum: pending, ready, cancelled, completed
    private Date dueDate;
}

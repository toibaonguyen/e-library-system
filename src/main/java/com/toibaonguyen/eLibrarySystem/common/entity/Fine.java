package com.toibaonguyen.eLibrarySystem.common.entity;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@Builder
public class Fine extends BaseEntity<Integer>{
    private int borrowId;
    private double amount;
    private boolean isPaid;
    private LocalDateTime createdAt;
}

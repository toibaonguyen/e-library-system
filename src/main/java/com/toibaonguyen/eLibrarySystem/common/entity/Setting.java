package com.toibaonguyen.eLibrarySystem.common.entity;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class Setting extends  BaseEntity{
    private String name;
    private String value;
    private String description;
}

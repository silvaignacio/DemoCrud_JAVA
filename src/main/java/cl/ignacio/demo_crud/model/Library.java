package cl.ignacio.demo_crud.model;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@JsonInclude(JsonInclude.Include.NON_NULL)
@AllArgsConstructor
public class Library {
    private long id;
    private String name;
    private String email;
    private String county;
    private String latitude;
    private String longitude;
}

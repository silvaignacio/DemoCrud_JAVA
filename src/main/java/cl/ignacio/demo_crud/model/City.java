package cl.ignacio.demo_crud.model;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@JsonInclude(JsonInclude.Include.NON_NULL)
@AllArgsConstructor
public class City {
    private long id;
    private String name;
    private String latitude;
    private String longitude;
}

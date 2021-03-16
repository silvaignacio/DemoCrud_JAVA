package cl.ignacio.demo_crud.repository.city.impl;

import cl.ignacio.demo_crud.model.City;
import cl.ignacio.demo_crud.repository.city.CityRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
@RequiredArgsConstructor
public class CityRepositoryImpl implements CityRepository {
    private final static String GET_CITIES = "SELECT ID, NAME, LATITUDE, LONGITUDE FROM DC_CITY;";
    private final JdbcTemplate jdbcTemplate;

    @Override
    public List<City> getCities() {
        return jdbcTemplate.query(
                GET_CITIES, (rs, rowNum) ->
                        City.builder()
                                .id(rs.getLong("ID"))
                                .longitude(rs.getString("LONGITUDE")).
                                name(rs.getString("NAME"))
                                .latitude(rs.getString("LATITUDE")).
                                build());
    }
}

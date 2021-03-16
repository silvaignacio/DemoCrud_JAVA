package cl.ignacio.demo_crud.repository.impl;

import cl.ignacio.demo_crud.model.Library;
import cl.ignacio.demo_crud.repository.LibraryRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class LibraryRepositoryImpl implements LibraryRepository {

    private final static String GET_LIBRARIES = "SELECT ID, NAME, EMAIL, COUNTY, LATITUDE, LONGITUDE FROM DC_LIBRARY;";
    private final JdbcTemplate jdbcTemplate;

    @Override
    public List<Library> getLibraries() {
        return jdbcTemplate.query(
                GET_LIBRARIES, (rs, rowNum) ->
                        Library.builder().
                                id(rs.getLong("ID"))
                                .county(rs.getString("COUNTY"))
                                .email(rs.getString("EMAIL"))
                                .latitude(rs.getString("LATITUDE"))
                                .longitude(rs.getString("LONGITUDE"))
                                .name(rs.getString("NAME")).build());
    }

}

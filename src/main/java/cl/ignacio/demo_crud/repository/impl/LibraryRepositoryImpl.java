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

    private final JdbcTemplate jdbcTemplate;

    private final static String GET_LIBRARIES = "SELECT ID, NAME, ";

    @Override
    public List<Library> getLibraries() {
        return null;
    }

}

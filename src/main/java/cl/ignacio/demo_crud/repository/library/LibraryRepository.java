package cl.ignacio.demo_crud.repository.library;

import cl.ignacio.demo_crud.model.Library;

import java.util.List;

/**
 * @author Ignacio Silva
 * @since 1.0
 */
public interface LibraryRepository {
    List<Library> getLibraries();
}

package com.kristel.TVseries.Repositorios;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.kristel.TVseries.Usuario;

@Repository
public interface UsuarioRepositorio extends CrudRepository<Usuario, Long> {
    
    // Método encargado de buscar al usuario en la base de datos por su email
    Usuario findByEmail(String email);
}
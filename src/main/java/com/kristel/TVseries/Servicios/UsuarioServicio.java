package com.kristel.TVseries.Servicios;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import com.kristel.TVseries.Usuario;
import com.kristel.TVseries.LoginUsuario;
import com.kristel.TVseries.Repositorios.UsuarioRepositorio;

@Service
public class UsuarioServicio {

    @Autowired
    private UsuarioRepositorio repoUsuarios;

    public Usuario registrar(Usuario nuevoUsuario, BindingResult result) {
        if(!nuevoUsuario.getPassword().equals(nuevoUsuario.getConfirmarPassword())) {
            result.rejectValue("confirmarPassword", "Matches", "Las contraseñas no coinciden");
        }
        
        // Cambiado: findByCorreo -> findByEmail y nuevoUsuario.getCorreo() -> nuevoUsuario.getEmail()
        Usuario existeUsuario = repoUsuarios.findByEmail(nuevoUsuario.getEmail());
        if(existeUsuario != null) {
            result.rejectValue("email", "Unique", "El correo ya está registrado en el sistema");
        }
        
        if(result.hasErrors()) {
            return null;
        } else {
            String passwordHasheado = BCrypt.hashpw(nuevoUsuario.getPassword(), BCrypt.gensalt());
            nuevoUsuario.setPassword(passwordHasheado);
            return repoUsuarios.save(nuevoUsuario);
        }
    }

    public Usuario login(LoginUsuario usuarioIniciandoSesion, BindingResult result) {
        // Cambiado: findByCorreo -> findByEmail
        Usuario existeUsuario = repoUsuarios.findByEmail(usuarioIniciandoSesion.getEmailLogin());
        if(existeUsuario == null) {
            result.rejectValue("emailLogin", "Unique", "E-mail no registrado");
        } else if(!BCrypt.checkpw(usuarioIniciandoSesion.getPasswordLogin(), existeUsuario.getPassword())) {
            result.rejectValue("passwordLogin", "Matches", "Contraseña incorrecta");
        }
        
        if(result.hasErrors()) {
            return null;
        } else {
            return existeUsuario;
        }
    }
}
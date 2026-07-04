package com.kristel.TVseries.Controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import com.kristel.TVseries.Usuario;
import com.kristel.TVseries.LoginUsuario;
import com.kristel.TVseries.Servicios.UsuarioServicio;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ControladorUsuarios {

    @Autowired
    private UsuarioServicio su;

    @GetMapping("/")
    public String index(@ModelAttribute("nuevoUsuario") Usuario nuevoUsuario,
                        @ModelAttribute("loginUsuario") LoginUsuario loginUsuario) {
        return "index";
    }

    @GetMapping("/login")
    public String loginPagina(@ModelAttribute("loginUsuario") LoginUsuario loginUsuario) {
        return "login";
    }

    @PostMapping("/registro")
    public String registro(@Valid @ModelAttribute("nuevoUsuario") Usuario nuevoUsuario,
                           BindingResult result, Model model, HttpSession session) {
        su.registrar(nuevoUsuario, result);
        if(result.hasErrors()) {
            model.addAttribute("loginUsuario", new LoginUsuario());
            return "index";
        } else {
            session.setAttribute("usuarioEnSesion", nuevoUsuario);
            return "redirect:/dashboard";
        }
    }

    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("loginUsuario") LoginUsuario loginUsuario,
                        BindingResult result, Model model, HttpSession session) {
        Usuario usuarioIntentandoLogin = su.login(loginUsuario, result);
        if(result.hasErrors()) {
            model.addAttribute("nuevoUsuario", new Usuario());
            return "login";
        } else {
            session.setAttribute("usuarioEnSesion", usuarioIntentandoLogin);
            return "redirect:/dashboard";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}
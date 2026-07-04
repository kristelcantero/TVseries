package com.kristel.TVseries.Controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import com.kristel.TVseries.Serie;
import com.kristel.TVseries.Usuario;
import com.kristel.TVseries.Servicios.SerieServicio;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class SerieControlador {

    @Autowired
    private SerieServicio servicioSeries;

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
        if(session.getAttribute("usuarioEnSesion") == null) return "redirect:/";
        model.addAttribute("listaSeries", servicioSeries.obtenerTodasOrdenadasPorAnioDesc());
        return "dashboard";
    }

    @GetMapping("/nuevo")
    public String nuevo(@ModelAttribute("serie") Serie serie, HttpSession session) {
        if(session.getAttribute("usuarioEnSesion") == null) return "redirect:/";
        return "nuevo";
    }

    @PostMapping("/crear")
    public String crear(@Valid @ModelAttribute("serie") Serie nuevaSerie, BindingResult result, HttpSession session) {
        if(session.getAttribute("usuarioEnSesion") == null) return "redirect:/";
        if(result.hasErrors()) return "nuevo";
        Usuario creador = (Usuario) session.getAttribute("usuarioEnSesion");
        nuevaSerie.setUsuario(creador);
        servicioSeries.guardarSerie(nuevaSerie);
        return "redirect:/dashboard";
    }

    @GetMapping("/mostrar/{id}")
    public String mostrar(@PathVariable Long id, Model model, HttpSession session) {
        Usuario usuarioLogueado = (Usuario) session.getAttribute("usuarioEnSesion");
        if(usuarioLogueado == null) return "redirect:/";
        Serie serie = servicioSeries.buscarSerie(id);
        model.addAttribute("serie", serie);
        return "mostrar";
    }

    @GetMapping("/editar/{id}")
    public String editar(@PathVariable Long id, Model model, HttpSession session) {
        Usuario usuarioLogueado = (Usuario) session.getAttribute("usuarioEnSesion");
        if(usuarioLogueado == null) return "redirect:/";
        Serie serie = servicioSeries.buscarSerie(id);
        if(!serie.getUsuario().getId().equals(usuarioLogueado.getId())) return "redirect:/dashboard";
        model.addAttribute("serie", serie);
        return "editar";
    }

    @PutMapping("/actualizar/{id}")
    public String actualizar(@Valid @ModelAttribute("serie") Serie serie, BindingResult result, @PathVariable Long id, HttpSession session) {
        if(session.getAttribute("usuarioEnSesion") == null) return "redirect:/";
        if(result.hasErrors()) return "editar";
        Serie original = servicioSeries.buscarSerie(id);
        serie.setUsuario(original.getUsuario());
        serie.setId(id);
        servicioSeries.guardarSerie(serie);
        return "redirect:/dashboard";
    }

    @DeleteMapping("/borrar/{id}")
    public String borrar(@PathVariable Long id, HttpSession session) {
        if(session.getAttribute("usuarioEnSesion") == null) return "redirect:/";
        servicioSeries.borrarSerie(id);
        return "redirect:/dashboard";
    }

    @PostMapping("/comprar/{id}")
    public String comprar(@PathVariable Long id, HttpSession session) {
        Usuario usuarioLogueado = (Usuario) session.getAttribute("usuarioEnSesion");
        if(usuarioLogueado == null) return "redirect:/";
        servicioSeries.comprarSerie(usuarioLogueado, id);
        return "redirect:/misCompras";
    }

    @GetMapping("/misCompras")
    public String misCompras(HttpSession session, Model model) {
        Usuario usuarioLogueado = (Usuario) session.getAttribute("usuarioEnSesion");
        if(usuarioLogueado == null) return "redirect:/";
        model.addAttribute("compras", servicioSeries.obtenerComprasDelUsuario(usuarioLogueado));
        return "misCompras";
    }
}
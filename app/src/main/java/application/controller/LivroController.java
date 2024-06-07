package application.controller;

import java.util.HashSet;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import application.model.Autor;
import application.model.Genero;
import application.model.Livro;
import application.repository.AutorRepository;
import application.repository.GeneroRepository;
import application.repository.LivroRepository;

@Controller
@RequestMapping("/livros")
public class LivroController {
    @Autowired
    private LivroRepository livroRepo;

    @Autowired
    private GeneroRepository generoRepo;

    @Autowired
    private AutorRepository autorRepo;

    @RequestMapping("/list")
    public String list(Model ui) {
        // Livro[] livros = new Livro[2];
        // livros[0] = new Livro();
        // livros[0].setId(1);
        // livros[0].setTitulo("Livro Teste 1");
        // livros[0].setGenero("G1");
        // livros[1] = new Livro();
        // livros[1].setId(2);
        // livros[1].setTitulo("Livro Teste 2");
        // livros[1].setGenero("G2");

        ui.addAttribute("livros", livroRepo.findAll());

        return "/livros/list";
    }

    @RequestMapping("/insert")
    public String insert(Model ui) {
        ui.addAttribute("generos", generoRepo.findAll());
        ui.addAttribute("autores", autorRepo.findAll());
        return "/livros/insert";
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public String insert(
        @RequestParam("titulo") String titulo,
        @RequestParam("genero") long genero,
        @RequestParam("autores") long[] autores) {
        
        Optional<Genero> resultado = generoRepo.findById(genero);

        if(resultado.isPresent()) {
            Livro livro = new Livro();
            livro.setTitulo(titulo);
            livro.setGenero(resultado.get());
            for(long a : autores) {
                Optional<Autor> result = autorRepo.findById(a);
                if(result.isPresent()) {
                    livro.getAutores().add(result.get());
                }
            }

            livroRepo.save(livro);
        }
        
        return "redirect:/livros/list";
    }

    @RequestMapping("/update/{id}")
    public String update(Model ui, @PathVariable long id) {
        Optional<Livro> resultado = livroRepo.findById(id);

        if(resultado.isPresent()) {
            ui.addAttribute("livro", resultado.get());

            ui.addAttribute("generos", generoRepo.findAll());
            ui.addAttribute("autores", autorRepo.findAll());
            return "/livros/update";    
        }

        return "redirect:/livros/list";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@RequestParam("id") long id,
        @RequestParam("titulo") String titulo,
        @RequestParam("genero") long genero,
        @RequestParam("autores") long[] autores) {

        Optional<Livro> resultado = livroRepo.findById(id);

        if(resultado.isPresent()) {
            Optional<Genero> resultGenero = generoRepo.findById(genero);
            if(resultGenero.isPresent()){
                resultado.get().setTitulo(titulo);
                resultado.get().setGenero(resultGenero.get());
                resultado.get().setAutores(new HashSet<Autor>());
                for(long a : autores) {
                    Optional<Autor> result = autorRepo.findById(a);
                    if(result.isPresent()) {
                        resultado.get().getAutores().add(result.get());
                    }
                }

                livroRepo.save(resultado.get());
            }
        }

        return "redirect:/livros/list";
    }

    @RequestMapping("/delete/{id}")
    public String delete(Model ui, @PathVariable long id) {
        Optional<Livro> resultado = livroRepo.findById(id);

        if(resultado.isPresent()) {
            ui.addAttribute("livro", resultado.get());
            return "/livros/delete";    
        }

        return "redirect:/livros/list";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String delete(@RequestParam("id") long id) {
        livroRepo.deleteById(id);

        return "redirect:/livros/list";
    }
}

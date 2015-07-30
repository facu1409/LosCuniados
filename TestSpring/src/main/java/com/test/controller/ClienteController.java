package com.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.test.domain.Cliente;
import com.test.services.ClienteService;



@Controller
public class ClienteController {

	@Autowired
	ClienteService clienteService;

//	@RequestMapping("cliente")
//	public ModelAndView getForm(@ModelAttribute Cliente cliente) {
//		return new ModelAndView("cliente");
//	}
	
	@RequestMapping(value = "/clientes", method = RequestMethod.GET)
	public String listClientes(Model model) {
		model.addAttribute("cliente", new Cliente());
		model.addAttribute("listClientes", this.clienteService.getList());
		return "cliente";
	}
	
	//Agregar y actualizar clientes
	@RequestMapping(value= "/cliente/add", method = RequestMethod.POST)
	public String addCliente(@ModelAttribute("cliente") Cliente c){
		
		if(c.getId() == 0){
			//Si es nuevo Cliente, agregarlo
			this.clienteService.insertCliente(c);
		}else{
			//Si existe, actualizarlo
			this.clienteService.updateCliente(c);
		}		
		return "redirect:/clientes";		
	}
	
	@RequestMapping("/remove/{id}")
    public String removeCliente(@PathVariable("id") int id){
		
        this.clienteService.deleteCliente(id);
        return "redirect:/clientes";
    }
 
    @RequestMapping("/edit/{id}")
    public String editCliente(@PathVariable("id") int id, Model model){
        model.addAttribute("cliente", this.clienteService.getClienteById(id));
        model.addAttribute("listClientes", this.clienteService.getList());
        return "cliente";
    }


}
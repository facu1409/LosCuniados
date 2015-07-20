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
    public String removePerson(@PathVariable("id") int id){
		
        this.clienteService.deleteCliente(id);
        return "redirect:/clientes";
    }
 
    @RequestMapping("/edit/{id}")
    public String editPerson(@PathVariable("id") int id, Model model){
        model.addAttribute("cliente", this.clienteService.getClienteById(id));
        model.addAttribute("listClientes", this.clienteService.getList());
        return "cliente";
    }
	
//	@RequestMapping("clienteRegister")
//	public ModelAndView registerCliente(@ModelAttribute Cliente cliente) {
//		clienteService.insertCliente(cliente);
//		return new ModelAndView("redirect:clienteList");
//	}
//	
//	@RequestMapping("clienteList")
//	public ModelAndView getList() {
//		List<Cliente> clienteList = clienteService.getList();
//		return new ModelAndView("clienteList","clienteList",clienteList);
//	}
//	
//	@RequestMapping("clienteDelete")
//	public ModelAndView deleteCliente(@RequestParam int id) {
//		clienteService.deleteCliente(id);
//		return new ModelAndView("redirect:clienteList");
//	}
//	
//	@RequestMapping("clienteEdit")
//	public ModelAndView editCliente(@RequestParam int id,@ModelAttribute Cliente cliente) {
//		Cliente clienteObject = clienteService.getClienteById(id);
//		return new ModelAndView("clienteEdit","clienteObject",clienteObject);
//	}
//	
//	@RequestMapping("clienteUpdate")
//	public ModelAndView updateCliente(@RequestParam int id,@ModelAttribute Cliente cliente) {
//		cliente.setClienteID(id);
//		clienteService.updateCliente(cliente);
//		return new ModelAndView("redirect:clienteList");
//	}

}
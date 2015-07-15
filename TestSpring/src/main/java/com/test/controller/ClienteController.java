package com.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.test.domain.Cliente;
import com.test.services.ClienteService;



@Controller
public class ClienteController {

	@Autowired
	ClienteService clienteService;

	@RequestMapping("clienteForm")
	public ModelAndView getForm(@ModelAttribute Cliente cliente) {
		return new ModelAndView("clienteForm");
	}
	
	@RequestMapping("clienteRegister")
	public ModelAndView registercliente(@ModelAttribute Cliente cliente) {
		clienteService.insertCliente(cliente);
		return new ModelAndView("redirect:clienteList");
	}
	
	@RequestMapping("clienteList")
	public ModelAndView getList() {
		List<Cliente> clienteList = clienteService.getList();
		return new ModelAndView("clienteList","clienteList",clienteList);
	}
	
	@RequestMapping("clienteDelete")
	public ModelAndView deletecliente(@RequestParam int id) {
		clienteService.deleteCliente(id);
		return new ModelAndView("redirect:clienteList");
	}
	
	@RequestMapping("clienteEdit")
	public ModelAndView editcliente(@RequestParam int id,@ModelAttribute Cliente cliente) {
		Cliente clienteObject = clienteService.getClienteById(id);
		return new ModelAndView("clienteEdit","clienteObject",clienteObject);
	}
	
	@RequestMapping("clienteUpdate")
	public ModelAndView updatecliente(@RequestParam int id,@ModelAttribute Cliente cliente) {
		cliente.setClienteID(id);
		clienteService.updateCliente(cliente);
		return new ModelAndView("redirect:clienteList");
	}

}
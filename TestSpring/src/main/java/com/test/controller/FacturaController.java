package com.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.test.domain.Factura;
import com.test.services.ClienteService;
import com.test.services.FacturaService;
import com.test.services.ProductoService;

@Controller
public class FacturaController extends MultiActionController {

	@Autowired
	FacturaService facturaService;
	@Autowired
	ClienteService clienteService;
	@Autowired
	ProductoService productoService;

	@RequestMapping(value = "/facturas", method = RequestMethod.GET)
	public String listFacturas(Model model) {
		model.addAttribute("factura", new Factura());
		model.addAttribute("listFacturas", this.facturaService.getList());
		model.addAttribute("listClientes", this.clienteService.getList());
		model.addAttribute("listProductos", this.productoService.getList());
		return "factura";
	}		
	
	@RequestMapping(value = "/cliente/{id}", method = RequestMethod.GET)
	public String getClienteById(@PathVariable("id") int id, Model model) {
		model.addAttribute("cliente", this.clienteService.getClienteById(id));
		
		return "cliente";
	}
	
	//Agregar y actualizar facturas
	@RequestMapping(value= "/factura/add", method = RequestMethod.POST)
	public String addFactura(/*@ModelAttribute("factura")*/ Factura p){		
		if(p.getId() == 0){
			//Si es nuevo Factura, agregarlo
			this.facturaService.insertFactura(p);
		}else{
			//Si existe, actualizarlo
			this.facturaService.updateFactura(p);
		}
		return "redirect:/facturas";
	}
	
	@RequestMapping("/removeFactura/{id}")
    public String removeFactura(@PathVariable("id") int id){		
        this.facturaService.deleteFactura(id);
        return "redirect:/facturas";
    }
 
    @RequestMapping("/editFactura/{id}")
    public String editFactura(@PathVariable("id") int id, Model model){
        model.addAttribute("factura", this.facturaService.getFacturaById(id));
        model.addAttribute("listFacturas", this.facturaService.getList());
        return "factura";
    }
}
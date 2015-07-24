package com.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.domain.Proveedor;
import com.test.services.ProveedorService;



@Controller
public class ProveedorController {

	@Autowired
	ProveedorService proveedorService;

	@RequestMapping(value = "/proveedores", method = RequestMethod.GET)
	public String listProveedores(Model model) {
		model.addAttribute("proveedor", new Proveedor());
		model.addAttribute("listProveedores", this.proveedorService.getList());
		return "proveedor";
	}
	
	//Agregar y actualizar proveedores
	@RequestMapping(value= "/proveedor/add", method = RequestMethod.POST)
	public String addProveedor(@ModelAttribute("proveedor") Proveedor p){
		
		if(p.getId() == 0){
			//Si es nuevo Proveedor, agregarlo
			this.proveedorService.insertProveedor(p);
		}else{
			//Si existe, actualizarlo
			this.proveedorService.updateProveedor(p);
		}		
		return "redirect:/proveedores";		
	}
	
	@RequestMapping("/removeProveedor/{id}")
    public String removeProveedor(@PathVariable("id") int id){
		
        this.proveedorService.deleteProveedor(id);
        return "redirect:/proveedores";
    }
 
    @RequestMapping("/editProveedor/{id}")
    public String editProveedor(@PathVariable("id") int id, Model model){
        model.addAttribute("proveedor", this.proveedorService.getProveedorById(id));
        model.addAttribute("listProveedores", this.proveedorService.getList());
        return "proveedor";
    }
	

}
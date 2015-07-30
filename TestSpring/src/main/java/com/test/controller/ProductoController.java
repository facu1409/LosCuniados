package com.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.domain.Producto;
import com.test.services.ProductoService;

@Controller
public class ProductoController {

	@Autowired
	ProductoService productoService;

	@RequestMapping(value = "/productos", method = RequestMethod.GET)
	public String listProductoes(Model model) {
		model.addAttribute("producto", new Producto());
		model.addAttribute("listProductos", this.productoService.getList());
		return "producto";
	}
	
	//Agregar y actualizar productos
	@RequestMapping(value= "/producto/add", method = RequestMethod.POST)
	public String addProducto(@ModelAttribute("producto") Producto p){
		
		if(p.getId() == 0){
			//Si es nuevo Producto, agregarlo
			this.productoService.insertProducto(p);
		}else{
			//Si existe, actualizarlo
			this.productoService.updateProducto(p);
		}		
		return "redirect:/productos";		
	}
	
	@RequestMapping("/removeProducto/{id}")
    public String removeProducto(@PathVariable("id") int id){
		
        this.productoService.deleteProducto(id);
        return "redirect:/productos";
    }
 
    @RequestMapping("/editProducto/{id}")
    public String editProducto(@PathVariable("id") int id, Model model){
        model.addAttribute("producto", this.productoService.getProductoById(id));
        model.addAttribute("listProductos", this.productoService.getList());
        return "producto";
    }
	

}
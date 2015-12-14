package com.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.test.domain.Compra;
import com.test.services.ProveedorService;
import com.test.services.CompraService;
import com.test.services.ProductoService;

@Controller
public class CompraController extends MultiActionController {

	@Autowired
	CompraService compraService;
	@Autowired
	ProveedorService proveedorService;
	@Autowired
	ProductoService productoService;

	@RequestMapping(value = "/compras", method = RequestMethod.GET)
	public String listCompras(Model model) {
		model.addAttribute("compra", new Compra());
		model.addAttribute("listCompras", this.compraService.getList());
		model.addAttribute("listProveedors", this.proveedorService.getList());
		model.addAttribute("listProductos", this.productoService.getList());
		return "compra";
	}		
	
	@RequestMapping(value = "/proveedor/{id}", method = RequestMethod.GET)
	public String getProveedorById(@PathVariable("id") int id, Model model) {
		model.addAttribute("proveedor", this.proveedorService.getProveedorById(id));
		
		return "proveedor";
	}
	
	//Agregar y actualizar compras
	@RequestMapping(value= "/compra/add", method = RequestMethod.POST)
	public String addCompra(@ModelAttribute("compra") Compra p){		
		if(p.getId() == 0){
			//Si es nuevo Compra, agregarlo
			this.compraService.insertCompra(p);
		}else{
			//Si existe, actualizarlo
			this.compraService.updateCompra(p);
		}
		return "redirect:/compras";
	}
	
	@RequestMapping("/removeCompra/{id}")
    public String removeCompra(@PathVariable("id") int id){		
        this.compraService.deleteCompra(id);
        return "redirect:/compras";
    }
 
    @RequestMapping("/editCompra/{id}")
    public String editCompra(@PathVariable("id") int id, Model model){
        model.addAttribute("compra", this.compraService.getCompraById(id));
        model.addAttribute("listCompras", this.compraService.getList());
        return "compra";
    }
}
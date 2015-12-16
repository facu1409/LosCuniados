package com.test.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.test.dao.ProductoDao;
import com.test.domain.Producto;

@Service
@Transactional
public class ProductoServiceImpl implements ProductoService {
	
	@Autowired
	private ProductoDao productoDao;

	
	public void insertProducto(Producto producto) {
		productoDao.insertProducto(producto);
	}
	
	public List<Producto> getList() {
		return productoDao.getList();
	}
	
	public Producto getProductoById(int id) {
		return productoDao.getProductoById(id);
	}
	
	public void updateProducto(Producto producto) {
		productoDao.updateProducto(producto);
	}
	
	public void deleteProducto(int id) {
		productoDao.deleteProducto(id);
	}
	
	public List<Producto> getListStock() {
		return productoDao.getListStock();		
	}

}


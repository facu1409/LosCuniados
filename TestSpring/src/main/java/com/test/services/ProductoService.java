package com.test.services;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.test.domain.Producto;

@Transactional
public interface ProductoService {
	
	public void insertProducto(Producto producto);

	public List<Producto> getList();

	public Producto getProductoById(int id);

	public void updateProducto(Producto producto);

	public void deleteProducto(int id);

}
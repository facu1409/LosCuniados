package com.test.dao;

import java.util.List;

import com.test.domain.Producto;

public interface ProductoDao {
	
	public void insertProducto(Producto producto);
	
	public List<Producto> getList();

	public Producto getProductoById(int id);

	public void updateProducto(Producto producto);

	public void deleteProducto(int id);

	public void updateStockProducto(int idProducto, float cantidad);



}

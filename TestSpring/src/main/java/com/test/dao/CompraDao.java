package com.test.dao;

import java.util.List;

import com.test.domain.Compra;

public interface CompraDao {
	
	public void insertCompra(Compra compra);
	
	public List<Compra> getList();

	public Compra getCompraById(int id);

	public void updateCompra(Compra compra);

	public void deleteCompra(int id);

}

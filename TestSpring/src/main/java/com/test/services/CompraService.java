package com.test.services;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.test.domain.Compra;

@Transactional
public interface CompraService {
	
	public void insertCompra(Compra compra);

	public List<Compra> getList();

	public Compra getCompraById(int id);

	public void updateCompra(Compra compra);

	public void deleteCompra(int id);

}
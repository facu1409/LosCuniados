package com.test.services;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.test.domain.LineaCompra;

@Transactional
public interface LineaCompraService {
	
	public void insertLineaCompra(LineaCompra lineaCompra);

	public List<LineaCompra> getList();

	public LineaCompra getLineaCompraById(int id);

	public void updateLineaCompra(LineaCompra lineaCompra);

	public void deleteLineaCompra(int id);

}
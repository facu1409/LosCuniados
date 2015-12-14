package com.test.dao;

import java.util.List;

import com.test.domain.LineaCompra;

public interface LineaCompraDao {
	
	public void insertLineaCompra(LineaCompra lineaCompra);
	
	public List<LineaCompra> getList();

	public LineaCompra getLineaCompraById(int id);

	public void updateLineaCompra(LineaCompra lineaCompra);

	public void deleteLineaCompra(int id);


}

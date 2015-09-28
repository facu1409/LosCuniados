package com.test.dao;

import java.util.List;

import com.test.domain.LineaFactura;

public interface LineaFacturaDao {
	
	public void insertLineaFactura(LineaFactura lineaFactura);
	
	public List<LineaFactura> getList();

	public LineaFactura getLineaFacturaById(int id);

	public void updateLineaFactura(LineaFactura lineaFactura);

	public void deleteLineaFactura(int id);


}

package com.test.dao;

import java.util.List;

import com.test.domain.Factura;

public interface FacturaDao {
	
	public void insertFactura(Factura factura);
	
	public List<Factura> getList();

	public Factura getFacturaById(int id);

	public void updateFactura(Factura factura);

	public void deleteFactura(int id);

}

package com.test.services;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.test.domain.Factura;

@Transactional
public interface FacturaService {
	
	public void insertFactura(Factura factura);

	public List<Factura> getList();

	public Factura getFacturaById(int id);

	public void updateFactura(Factura factura);

	public void deleteFactura(int id);

}
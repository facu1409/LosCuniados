package com.test.services;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.test.domain.LineaFactura;

@Transactional
public interface LineaFacturaService {
	
	public void insertLineaFactura(LineaFactura lineaFactura);

	public List<LineaFactura> getList();

	public LineaFactura getLineaFacturaById(int id);

	public void updateLineaFactura(LineaFactura lineaFactura);

	public void deleteLineaFactura(int id);

}
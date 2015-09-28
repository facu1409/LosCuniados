package com.test.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.test.dao.FacturaDao;
import com.test.domain.Factura;

@Service
@Transactional
public class FacturaServiceImpl implements FacturaService {
	
	@Autowired
	private FacturaDao facturaDao;

	
	public void insertFactura(Factura factura) {
		facturaDao.insertFactura(factura);
	}
	
	public List<Factura> getList() {
		return facturaDao.getList();
	}
	
	public Factura getFacturaById(int id) {
		return facturaDao.getFacturaById(id);
	}
	
	public void updateFactura(Factura factura) {
		facturaDao.updateFactura(factura);
	}
	
	public void deleteFactura(int id) {
		facturaDao.deleteFactura(id);
	}

}


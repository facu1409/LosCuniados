package com.test.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.test.dao.LineaFacturaDao;
import com.test.domain.LineaFactura;

@Service
@Transactional
public class LineaFacturaServiceImpl implements LineaFacturaService {
	
	@Autowired
	private LineaFacturaDao lineaFacturaDao;

	
	public void insertLineaFactura(LineaFactura lineaFactura) {
		lineaFacturaDao.insertLineaFactura(lineaFactura);
	}
	
	public List<LineaFactura> getList() {
		return lineaFacturaDao.getList();
	}
	
	public LineaFactura getLineaFacturaById(int id) {
		return lineaFacturaDao.getLineaFacturaById(id);
	}
	
	public void updateLineaFactura(LineaFactura lineaFactura) {
		lineaFacturaDao.updateLineaFactura(lineaFactura);
	}
	
	public void deleteLineaFactura(int id) {
		lineaFacturaDao.deleteLineaFactura(id);
	}

}


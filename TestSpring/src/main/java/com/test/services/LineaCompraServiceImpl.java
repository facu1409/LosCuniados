package com.test.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.test.dao.LineaCompraDao;
import com.test.domain.LineaCompra;

@Service
@Transactional
public class LineaCompraServiceImpl implements LineaCompraService {
	
	@Autowired
	private LineaCompraDao lineaCompraDao;

	
	public void insertLineaCompra(LineaCompra lineaCompra) {
		lineaCompraDao.insertLineaCompra(lineaCompra);
	}
	
	public List<LineaCompra> getList() {
		return lineaCompraDao.getList();
	}
	
	public LineaCompra getLineaCompraById(int id) {
		return lineaCompraDao.getLineaCompraById(id);
	}
	
	public void updateLineaCompra(LineaCompra lineaCompra) {
		lineaCompraDao.updateLineaCompra(lineaCompra);
	}
	
	public void deleteLineaCompra(int id) {
		lineaCompraDao.deleteLineaCompra(id);
	}

}


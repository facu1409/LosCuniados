package com.test.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.test.dao.CompraDao;
import com.test.domain.Compra;

@Service
@Transactional
public class CompraServiceImpl implements CompraService {
	
	@Autowired
	private CompraDao compraDao;

	
	public void insertCompra(Compra compra) {
		compraDao.insertCompra(compra);
	}
	
	public List<Compra> getList() {
		return compraDao.getList();
	}
	
	public Compra getCompraById(int id) {
		return compraDao.getCompraById(id);
	}
	
	public void updateCompra(Compra compra) {
		compraDao.updateCompra(compra);
	}
	
	public void deleteCompra(int id) {
		compraDao.deleteCompra(id);
	}

}


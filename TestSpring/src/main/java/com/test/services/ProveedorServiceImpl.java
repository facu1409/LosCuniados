package com.test.services;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.test.dao.ProveedorDao;
import com.test.domain.Proveedor;

@Service
@Transactional
public class ProveedorServiceImpl implements ProveedorService {
	
	@Autowired
	private ProveedorDao proveedorDao;

	
	public void insertProveedor(Proveedor proveedor) {
		proveedorDao.insertProveedor(proveedor);
	}
	
	public List<Proveedor> getList() {
		return proveedorDao.getList();
	}
	
	public Proveedor getProveedorById(int id) {
		return proveedorDao.getProveedorById(id);
	}
	
	public void updateProveedor(Proveedor proveedor) {
		proveedorDao.updateProveedor(proveedor);
	}
	
	public void deleteProveedor(int id) {
		proveedorDao.deleteProveedor(id);
	}

}


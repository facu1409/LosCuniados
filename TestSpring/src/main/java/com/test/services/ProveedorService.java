package com.test.services;


import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.test.domain.Proveedor;

@Transactional
public interface ProveedorService {
	
	public void insertProveedor(Proveedor proveedor);

	public List<Proveedor> getList();

	public Proveedor getProveedorById(int id);

	public void updateProveedor(Proveedor proveedor);

	public void deleteProveedor(int id);

}
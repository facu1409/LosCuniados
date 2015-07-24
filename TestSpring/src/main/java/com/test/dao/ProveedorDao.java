package com.test.dao;

import java.util.List;

import com.test.domain.Proveedor;

public interface ProveedorDao {
	
	public void insertProveedor(Proveedor proveedor);
	
	public List<Proveedor> getList();

	public Proveedor getProveedorById(int id);

	public void updateProveedor(Proveedor proveedor);

	public void deleteProveedor(int id);


}

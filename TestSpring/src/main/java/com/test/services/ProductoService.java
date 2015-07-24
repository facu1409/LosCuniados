package com.test.services;


import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.test.domain.Cliente;

@Transactional
public interface ProductoService {
	
	public void insertCliente(Cliente profesional);

	public List<Cliente> getList();

	public Cliente getClienteById(int id);

	public void updateCliente(Cliente cliente);

	public void deleteCliente(int id);

}
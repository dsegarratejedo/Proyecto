package com.proyecto.ControlCostesGanaderia;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Parent;


@Entity

public class Lote {
	
	@Id String id;
	String descripcion;

	public Lote(String id, String descripcion) {
		super();
		this.id = id;
		this.descripcion = descripcion;
	}

}

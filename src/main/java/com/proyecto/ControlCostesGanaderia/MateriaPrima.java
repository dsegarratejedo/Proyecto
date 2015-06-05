package com.proyecto.ControlCostesGanaderia;

import java.util.Date;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;


@Entity

public class MateriaPrima {
	
	@Id String id;
	String descripcion;
	float existencias;
	
	@Index public Date date;
	
	public MateriaPrima(){
		date = new Date();
	}
	
	public MateriaPrima(String id, String descripcion, float existencias) {
		super();
		this.id = id;
		this.descripcion = descripcion;
		this.existencias = existencias;
	}

}

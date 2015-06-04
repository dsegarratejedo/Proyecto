package com.proyecto.ControlCostesGanaderia;

import java.util.Date;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;


@Entity

public class Lote {
	
	@Id String id;
	String descripcion;
	
	@Index public Date date;
	
	public Lote(){
		date = new Date();
	}

	public Lote(String id, String descripcion) {
		super();
		this.id = id;
		this.descripcion = descripcion;
	}

}

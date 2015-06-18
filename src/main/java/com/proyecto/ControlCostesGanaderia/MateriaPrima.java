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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public float getExistencias() {
		return existencias;
	}

	public void setExistencias(float existencias) {
		this.existencias = existencias;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	@Override
	public boolean equals(Object obj) {
		
		MateriaPrima other = (MateriaPrima) obj;
		if (this.id.equals(other.getId())) {
			return true;			
		}else{
			return false;
		}
	}

}

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
		date = new Date();
		
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

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return id + "\t\t" + descripcion + "\t\t"+ date;
	}


	@Override
	public boolean equals(Object obj) {
		
		Lote other = (Lote) obj;
		if (this.id.equals(other.getId())) {
			return true;			
		}else{
			return false;
		}
	}
	
	

}
package com.proyecto.ControlCostesGanaderia;

import java.util.Date;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

@Entity
public class Compra {
	
	@Id
	String id;
	String concepto;
	String fecha;
	int kgs;
	int importe;
	int consumido;
	int preciokg;
	
	@Index public Date date;
	
	public Compra(){
		date = new Date();
	}
	
	public Compra(String id, String concepto, String fecha, int kgs,
			int importe, int consumido, int preciokg) {
		super();
		this.id = id;
		this.concepto = concepto;
		this.fecha = fecha;
		this.kgs = kgs;
		this.importe = importe;
		this.consumido = consumido;
		this.preciokg = preciokg;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getConcepto() {
		return concepto;
	}
	public void setConcepto(String concepto) {
		this.concepto = concepto;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public int getKgs() {
		return kgs;
	}
	public void setKgs(int kgs) {
		this.kgs = kgs;
	}
	public int getImporte() {
		return importe;
	}
	public void setImporte(int importe) {
		this.importe = importe;
	}
	public int getConsumido() {
		return consumido;
	}
	public void setConsumido(int consumido) {
		this.consumido = consumido;
	}
	public int getPreciokg() {
		return preciokg;
	}
	public void setPreciokg(int preciokg) {
		this.preciokg = preciokg;
	}
	
	@Override
	public String toString() {
		return id + "\t\t" + concepto + "\t\t"+ fecha  + "\t\t"+
				kgs  + "\t\t"+ importe  + "\t\t" + consumido  + "\t\t"+ preciokg;
	}


	@Override
	public boolean equals(Object obj) {
		
		Compra other = (Compra) obj;
		if (this.id.equals(other.getId())) {
			return true;			
		}else{
			return false;
		}
	}

}

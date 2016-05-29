package com.mkyong.common.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="loc_localidad")
public class Localidad {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	
	@Column(name="LOC_ID")
	Integer idLocalidad;
	
	@Column(name="LOC_LOCALIDAD")
	String localidad;
	
	@Column(name="LOC_DESCRIPCION")
	String descripcion;
	
	@Column(name="LOC_CODIGO_POSTAL")
	String codigoPostal;

	public Localidad(Integer idLocalidad, String localidad, String descripcion, String codigoPostal) {
		super();
		this.idLocalidad = idLocalidad;
		this.localidad = localidad;
		this.descripcion = descripcion;
		this.codigoPostal = codigoPostal;
	}

	public Integer getIdLocalidad() {
		return idLocalidad;
	}

	public void setIdLocalidad(Integer idLocalidad) {
		this.idLocalidad = idLocalidad;
	}

	public String getLocalidad() {
		return localidad;
	}

	public void setLocalidad(String localidad) {
		this.localidad = localidad;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getCodigoPostal() {
		return codigoPostal;
	}

	public void setCodigoPostal(String codigoPostal) {
		this.codigoPostal = codigoPostal;
	}

	
	

}

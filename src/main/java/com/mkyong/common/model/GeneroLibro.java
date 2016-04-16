package com.mkyong.common.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="gen_genero_libro")
public class GeneroLibro {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	
	@Column(name="idgen")
	Integer idgen;
	
	@Column(name="descripcion")
	String descripcion;
	
	@Column(name="descripcion_larga")
	String descripcion_larga;
	
	@Column(name="codigo")
	String codigo;

	public Integer getIdgen() {
		return idgen;
	}

	public void setIdgen(Integer idgen) {
		this.idgen = idgen;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getDescripcion_larga() {
		return descripcion_larga;
	}

	public void setDescripcion_larga(String descripcion_larga) {
		this.descripcion_larga = descripcion_larga;
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	
	
	
	
	


}

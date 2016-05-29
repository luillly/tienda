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
@Table(name="pro_provincia")
public class Provincia {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	
	@Column(name="PROV_ID")
	Integer idProvincia;
	
	@Column(name="PRO_PROVINCIA")
	String provincia;
	
	@Column(name="PRO_DESCRIPCION")
	String descripcion;
	
	@Column(name="PRO_CODIGO")
	String codigo;

	public Provincia(Integer idProvincia, String provincia, String descripcion, String codigo) {
		super();
		this.idProvincia = idProvincia;
		this.provincia = provincia;
		this.descripcion = descripcion;
		this.codigo = codigo;
	}

	public Integer getIdProvincia() {
		return idProvincia;
	}

	public void setIdProvincia(Integer idProvincia) {
		this.idProvincia = idProvincia;
	}

	public String getProvincia() {
		return provincia;
	}

	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	
	

}

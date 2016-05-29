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
@Table(name="cli_cliente")
public class Cliente {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	
	@Column(name="CLI_ID")
	Integer idCliente;
	
	@Column(name="CLI_NOMBRE")
	String nombre;
	
	@Column(name="CLI_APELLIDO_1")
	String apellido1;
	
	@Column(name="CLI_APELLIDO_2")
	String apellido2;
	
	@Column(name="CLI_NIF")
	String nif;
	
	@Column(name="CLI_SEXO")
	String sexo;
	
	@Column(name="CLI_DIRECCION")
	String direccion;
	
	@Column(name="CLI_FECHA_NACIMIENTO")
	String fechaNacimiento;
	
	@ManyToOne
	@JoinColumn(name="CLI_PROV_ID")
	Provincia idProvincia;
	
	@ManyToOne
	@JoinColumn(name="CLI_LOC_ID")
	Localidad idLocalidad;

	public Cliente(Integer idCliente, String nombre, String apellido1, String apellido2, String nif, String sexo,
			String direccion, String fecha_nacimiento, Provincia idProvincia, Localidad idLocalidad) {
		super();
		this.idCliente = idCliente;
		this.nombre = nombre;
		this.apellido1 = apellido1;
		this.apellido2 = apellido2;
		this.nif = nif;
		this.sexo = sexo;
		this.direccion = direccion;
		this.fechaNacimiento = fecha_nacimiento;
		this.idProvincia = idProvincia;
		this.idLocalidad = idLocalidad;
	}

	public Integer getIdCliente() {
		return idCliente;
	}

	public void setIdCliente(Integer idCliente) {
		this.idCliente = idCliente;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido1() {
		return apellido1;
	}

	public void setApellido1(String apellido1) {
		this.apellido1 = apellido1;
	}

	public String getApellido2() {
		return apellido2;
	}

	public void setApellido2(String apellido2) {
		this.apellido2 = apellido2;
	}

	public String getNif() {
		return nif;
	}

	public void setNif(String nif) {
		this.nif = nif;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getFecha_nacimiento() {
		return fechaNacimiento;
	}

	public void setFecha_nacimiento(String fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	public Provincia getIdProvincia() {
		return idProvincia;
	}

	public void setIdProvincia(Provincia idProvincia) {
		this.idProvincia = idProvincia;
	}

	public Localidad getIdLocalidad() {
		return idLocalidad;
	}

	public void setIdLocalidad(Localidad idLocalidad) {
		this.idLocalidad = idLocalidad;
	}
	

}

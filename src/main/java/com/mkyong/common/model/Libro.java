package com.mkyong.common.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Libro")
public class Libro {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	
	@Column(name="idLibro")
	Integer idLibro;
	
	@Column(name="titulo")
	String titulo;
	
	@Column(name="autor")
	String autor;
	
	@Column(name="isbn")
	String isbn;
	
	@Column(name="genero")
	String genero;

	public Libro(Integer idLibro, String titulo, String autor, String isbn,
			String genero) {
		super();
		this.idLibro = idLibro;
		this.titulo = titulo;
		this.autor = autor;
		this.isbn = isbn;
		this.genero = genero;
	}
	
	public Libro(){
		this.idLibro=0;
		this.titulo = "";
		this.autor = "";
		this.isbn = "";
		this.genero = "";
	}

	public Integer getIdLibro() {
		return idLibro;
	}

	public void setIdLibro(Integer idLibro) {
		this.idLibro = idLibro;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getAutor() {
		return autor;
	}

	public void setAutor(String autor) {
		this.autor = autor;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getGenero() {
		return genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}
	
	
	

}

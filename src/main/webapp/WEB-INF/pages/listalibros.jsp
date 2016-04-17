<html>
<head>
<link rel="stylesheet" type="text/css" href="resources/extjs/resources/css/ext-all.css" />
 
<script type="text/javascript" src="resources/extjs/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="resources/extjs/ext-all.js"></script>
<script type="text/javascript" src="resources/extjs/locale/ext-lang-es.js"></script>
</head>

<body>
	<h1>Spring @MVC ContentNegotiatingViewResolver</h1>
	<script type="text/javascript">
	Ext.onReady(function(){
		
	var storeLibros = new Ext.data.JsonStore({
		url: 'listalibros.json',
		root: 'listalibros',
		fields: ['idLibro','titulo','autor','isbn','genero.descripcion']
	});
		
	var storeUsuarios = new Ext.data.JsonStore({
		url: 'listausuarios.json',
		root: 'listausuarios',
		fields: ['idUsuario','usuario','password']
	});
	
	var storeGeneros = new Ext.data.JsonStore({
		url: 'listageneros.json',
		root: 'listageneros',
		fields: ['idgen','descripcion','descripcion_larga','codigo']
	});

	storeLibros.load();
	storeUsuarios.load();	
	storeGeneros.load();	
	
	var btnEditar= new Ext.Button({
		text: 'Editar',
		id: 'editar',
		handler: function(){
   		 var id= grid.getSelectionModel().getSelected().get('idLibro');
		 var titulo= grid.getSelectionModel().getSelected().get('titulo');
		 var autor= grid.getSelectionModel().getSelected().get('autor');
		 var isbn= grid.getSelectionModel().getSelected().get('isbn');
		 var genero= grid.getSelectionModel().getSelected().get('genero.descripcion');
		 var codigo= grid.getSelectionModel().getSelected().get('genero.codigo');

		 Ext.getCmp('id').setValue(id);
		 Ext.getCmp('titulo').setValue(titulo);
		 Ext.getCmp('autor').setValue(autor);
		 Ext.getCmp('isbn').setValue(isbn);
		 Ext.getCmp('genero').setValue(genero);
		 
			var winForm= new Ext.Window({
			    title: 'Editar Libro',
			    height: 250,
			    width: 400,
			   	items:[simple],
			   	closable: false,
			   	buttons: [{
		            text: 'Save',
		            	handler: function(){
		            		if(!simple.getForm().isValid()){
		            			Ext.Msg.alert('Error', 'Rellene los campos obligatorios');
		            		}
		            		else{
		            			var valores= simple.getForm().getFieldValues();
		            			Ext.Ajax.request({
		            				url: 'guardarlibro',
		            				method: 'POST',
		            				success: function(){
		            					
		            					simple.getForm().reset();
				            			winForm.hide();
				            			storeLibros.load();
				            			grid.getView().refresh();
		            				},
		            				failure: function(){
		            					Ext.Msg.alert('Error', 'Error al guardado')
		            				},
		            				params: { 	id: valores.id,
		            							titulo: valores.titulo,
		            							autor: valores.autor,
		            							isbn: valores.isbn,
		            							genero: valores.genero
		            						}
		            			});

		            		}
		            		
		            	}
		        	},
		            {
			            text: 'Cancel',
			            handler: function(){
			            	simple.getForm().reset();
			            	winForm.hide();
			        }
		        }]
			}).show();
		}
	});
	
	var btnEliminar= new Ext.Button({
		text: 'Eliminar',
		id: 'btnEliminar',
		handler: function(){
			if(grid.getSelectionModel()!= null){
				var id= grid.getSelectionModel().getSelected().get('idLibro');
				Ext.Ajax.request({
    				url: 'eliminarlibro',
    				method: 'POST',
    				success: function(){
            			storeLibros.load();
            			grid.getView().refresh();
            			btnEliminar.setDisabled(true);
            			btnEditar.setDisabled(true);
       	    		 	grid.getTopToolbar().doLayout();
            			
    				},
    				failure: function(){
    					Ext.Msg.alert('Error', 'Error al eliminar');
    				},
    				params: {id: id}
    			});
			}
			else{
				Ext.Msg.alert('Error', 'Seleccione un elemento');
			}
			
		}
	});
		
	var simple = new Ext.FormPanel({
        labelWidth: 75, // label settings here cascade unless overridden
        frame:true,
        bodyStyle:'padding:5px 5px 0',
        width: Ext.getBody().getViewSize().width,
        height:Ext.getBody().getViewSize().height,
        defaults: {width: 230},
        buttonAlign: 'center',
        labelAlign: 'right',
        defaultType: 'textfield',

        items: [new Ext.form.Hidden({
        		fieldLabel: 'ID',
        		name: 'id',
        		id: 'id',
        		allowBlank:false,
        		hide: true
       	 	})
        	,{
                fieldLabel: 'Titulo',
                name: 'titulo',
                id: 'titulo',
                allowBlank:false
            },{
                fieldLabel: 'Autor',
                name: 'autor',
                id: 'autor',
                allowBlank:false
            },{
                fieldLabel: 'ISBN',
                name: 'isbn',
                id: 'isbn',
                allowBlank:false
            }, new Ext.form.ComboBox({
            	fieldLabel: 'Genero',
            	name: 'genero',
            	id: 'genero',
            	store: storeGeneros,
            	valueField: 'codigo',
                displayField: 'descripcion',
            	triggerAction: 'all',
                mode: 'local'
            	
            })
        ]

        
    });
	
	var btnAñadirLibro = new Ext.Button({
		text: 'Nuevo',
		handler: function(){
			var winForm= new Ext.Window({
			    title: 'Nuevo Libro',
			    height: 250,
			    width: 400,
			   	items:[simple],
			   	closable: false,
			   	buttons: [{
		            text: 'Save',
		            	handler: function(){
		            		if(!simple.getForm().isValid()){
		            			Ext.Msg.alert('Error', 'Rellene los campos obligatorios');
		            		}
		            		else{
		            			var valores= simple.getForm().getFieldValues();
		            			Ext.Ajax.request({
		            				url: 'guardarlibro',
		            				method: 'POST',
		            				success: function(){
		            					
		            					simple.getForm().reset();
				            			winForm.hide();
				            			storeLibros.load();
				            			grid.getView().refresh();
		            				},
		            				failure: function(){
		            					Ext.Msg.alert('Error', 'Error al guardado')
		            				},
		            				params: { titulo: valores.titulo,
		            							autor: valores.autor,
		            							isbn: valores.isbn,
		            							genero: valores.genero
		            						}
		            			});
		            			
		            			
		            			
		            			
		            		}
		            		
		            	}
		        	},
		            {
			            text: 'Cancel',
			            handler: function(){
			            	simple.getForm().reset();
			            	winForm.hide();
			        }
		        }]
			}).show();
		}
	});
	

	

	
	var grid = new Ext.grid.GridPanel({
		store: storeLibros, // <--- le asignamos el store con la información a utilizar
		columns: [
			new Ext.grid.RowNumberer(),
			{header:'ID', dataIndex:'idLibro',sortable: true},
			{header:'Titulo', dataIndex:'titulo',sortable: true},
			{header:'Autor', dataIndex:'autor',sortable: true},
			{header:'ISBN', dataIndex:'isbn', width:150,sortable: true},
			{header:'Genero', dataIndex:'genero.descripcion',sortable: true},
		],
		border: false,
		id: 'grid',
		stripeRows: true,
		title: 'Grid Libros',
		viewConfig: {
	        forceFit: true
	     },
	     autoHeight: true,
	     tbar:[
	    	 btnAñadirLibro
	     ],
	     listeners: {
	    	 click: function(record){
	    		 btnEliminar.setDisabled(false);
	    		 btnEditar.setDisabled(false)
	    		 grid.getTopToolbar().add(btnEliminar);
	    		 grid.getTopToolbar().add(btnEditar);
	    		 grid.getTopToolbar().doLayout();
	    	 }
	     }
	});
	
	var gridUsuarios = new Ext.grid.GridPanel({
		store: storeUsuarios, // <--- le asignamos el store con la información a utilizar
		columns: [
			new Ext.grid.RowNumberer(),
			{header:'ID', dataIndex:'idUsuario',sortable: true},
			{header:'Usuario', dataIndex:'usuario',sortable: true},
			{header:'Password', dataIndex:'password',sortable: true},
		],
		border: false,
		stripeRows: true,
		title: 'Grid Usuarios',
		viewConfig: {
	        forceFit: true
	     },
	     autoHeight: true
	});
	
	
	
	 var tabPanel = new Ext.TabPanel({
		 activeTab:0,
		 defaults:{autoHeight: true, autoScroll: true},
		 items: [{
		        title: 'Tab 1',
		        items: grid,
		        layout: 'fit'
		    },{
		        title: 'Tab 2',
		        items: gridUsuarios,
		        layout: 'fit'
		    }] //le agregamos el primer tab
	});
	 
	 
	var winUp = new Ext.Window({
		title: 'PRINCIPAL',
		width: Ext.getBody().getViewSize().width,
		height:Ext.getBody().getViewSize().height*0.5,
		modal: false, //set the Window to modal
		x: 0, //specify the left value of the window
		y: 0,
		draggable: false,
		resizable: false,
		closable:false,//specify the top value of the window
		items: [tabPanel],
		layout: 'fit'
	});
	
	winUp.show();

	});
	</script>
	
	<h1>Lista de libros</h1>
	
</body>
</html>
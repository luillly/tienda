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
		
		
		
		
	var storeGeneros = new Ext.data.JsonStore({
		url: 'listageneros.json',
		root: 'listageneros',
		fields: ['idgen','descripcion','descripcion_larga','codigo']
	});
	storeGeneros.load();
		
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

        items: [{
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
	
	var toolbardown= new Ext.Toolbar({
		items: [
			btnAñadirLibro
		]
	});
	

	
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

	storeLibros.load();
	storeUsuarios.load();
	
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
		stripeRows: true,
		title: 'Grid Libros',
		viewConfig: {
	        forceFit: true
	     },
	     autoHeight: true,
	     tbar:[
	    	 btnAñadirLibro
	     ]
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
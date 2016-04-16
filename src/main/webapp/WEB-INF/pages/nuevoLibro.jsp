<html>
<head>
	<link rel="stylesheet" type="text/css" href="resources/extjs/resources/css/ext-all.css" />
	 
	<script type="text/javascript" src="resources/extjs/adapter/ext/ext-base.js"></script>
	<script type="text/javascript" src="resources/extjs/ext-all.js"></script>
	<script type="text/javascript" src="resources/extjs/locale/ext-lang-es.js"></script>
	
</head>
<body>

	<script type="text/javascript">
		/* var panel= Ext.create('Ext.form.Panel', {
		    title: 'User Form',
		    height: 150,
		    width: 300,
		    bodyPadding: 10,
		    defaultType: 'textfield',
		    items: [
		        {
		            fieldLabel: 'First Name',
		            name: 'firstName'
		        },
		        {
		            fieldLabel: 'Last Name',
		            name: 'lastName'
		        },
		        {
		            xtype: 'datefield',
		            fieldLabel: 'Date of Birth',
		            name: 'birthDate'
		        }
		    ]
		}); */
		
		var simple = new Ext.FormPanel({
	        labelWidth: 75, // label settings here cascade unless overridden
	        url:'save-form.php',
	        frame:true,
	        bodyStyle:'padding:5px 5px 0',
	        width: Ext.getBody().getViewSize().width,
	        height:Ext.getBody().getViewSize().height,
	        defaults: {width: 230},
	        buttonAlign: 'center',
	        labelAlign: 'right',

	        items: [new Ext.form.TextField({
	                fieldLabel: 'Titulo',
	                name: 'titulo',
	                allowBlank:false
	            }),{new Ext.form.TextField(
	                fieldLabel: 'Autor',
	                name: 'autor',
	                allowBlank:false
	            }),{
	            	new Ext.form.TextField(
	            	fieldLabel: 'ISBN',
	                name: 'isbn',
	                allowBlank:false
	            }), {new Ext.form.TextField(
	                fieldLabel: 'Genero',
	                name: 'genero'
	            })
	        ],

	        buttons: [{
	            text: 'Save',
	            	handler: function(){
	            		simple.destroy();
	            	}
	        	},
	            {
		            text: 'Cancel',
		            handler: function(){
		            	document.close();
		        }
	        }]
	    });
		simple.render(document.body);
		
		  
	</script>

</body>
</html>
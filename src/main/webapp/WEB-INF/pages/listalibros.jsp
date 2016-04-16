<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="resources/extjs/resources/css/ext-all.css" />
 
<script type="text/javascript" src="resources/extjs/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="resources/extjs/ext-all.js"></script>
<script type="text/javascript" src="resources/extjs/locale/ext-lang-es.js"></script>
<style type="text/css">
#element{
	position:absolute;
	width:100px;
	height:100px;
	margin:0px auto;
	background-color:#555;
}

</style>

<title>Insert title here</title>
</head>
<body>
<h1>PRINCIPAL</h1>

Lista de libros: ${listalibros[0].titulo}

<script type="text/javascript">
	
	Ext.onReady(function(){
		
		var elem= Ext.get('element');
		elem.center();
	
		Ext.get('fadeInFx').on('click', function(){
			elem.setOpacity(0);
			elem.fadeIn();
		});
		
		Ext.get('fadeOutFx').on('click', function(){
			elem.fadeOut();
		});
		
		Ext.get('frameFx').on('click', function(){
			elem.frame();
		});
		
		Ext.get('ghostFx').on('click', function(){
			elem.ghost('r');
		});
		
		Ext.get('highlightFx').on('click', function(){
			elem.highlight();
		});
		
		Ext.get('puffFx').on('click', function(){
			elem.puff();
		});
		
		Ext.get('scaleFx').on('click',function(){
			elem.scale(50,50);
		});
		
		Ext.get('scale2Fx').on('click',function(){
			elem.scale(100,100);
		});
		
		Ext.get('slideInFx').on('click',function(){
			elem.slideIn(); //aparece el elemento
		});
		Ext.get('slideOutFx').on('click',function(){
			elem.slideOut(); //desaparece
		});
		
		Ext.get('scale3Fx').on('click',function(){
			elem.scale(200,200,{
				easing:'elasticOut',duration:2
			});
		});
		
		Ext.get('alerta').on('click',function(){
			Ext.Msg.alert('Mensaje del boton','Has pulsado el boton de alerta');
		})
		
		Ext.get('confirmacion').on('click',function(){
			Ext.Msg.confirm('Mensaje de confirmacion','Estas seguro?',function(btn){
				if(btn=='yes'){
					alert("Has dicho si");
				}
				else{
					alert("Has dicho no");
				}
			});
		})
		
		Ext.get('prompt').on('click',function(){
			Ext.Msg.prompt('Prompt','¿Cual es tu nombre?');
		});
		
		Ext.get('wait').on('click',function(){
			Ext.Msg.wait('Cargando... porfavor espere!');
			window.setTimeout(function(){
				Ext.Msg.hide();
			},4000);
		});
		
		Ext.get('showPersonalizado').on('click', function(){
			Ext.Msg.show({
				title: 'Personalizado',
				msg: '¿Estas seguro?',
				buttons: Ext.Msg.YESNO,
				icon: Ext.Msg.QUESTION,
				fn: function(btn){
					if(btn=='yes'){
						
						Ext.Msg.show({
							title: 'Respuesta',
							msg: 'Has dicho si',
							icon: Ext.Msg.INFO
						})
						
					}
					else{
						Ext.Msg.show({
							title: 'Respuesta',
							msg: 'Has dicho si',
							icon: Ext.Msg.INFO
						})
					}
				}
			})
		});
		
		Ext.get('element').on('mouseenter',function(){
			var msg= Ext.get('msg');
			msg.dom.innerHTML= 'El raton ha entrado!';
		});
		
		Ext.get('element').on('mouseout', function(){
			var msg= Ext.get('msg');
			msg.dom.innerHTML= 'El raton ha salido!';
		});
		
		Ext.fly('ajax').on('click', function(){
			Ext.Ajax.request({
				url: 'requestAjaxPrincipal',
				method: 'GET',
				params: {primero: 'uno', segundo: 'dos'},
				sucess: this.log,
				failure: this.fail
			})
		});
		

		
		Ext.get('lista').on('click', function(){
			
			
			var storesimple= new Ext.data.SimpleStore({
			   
			    fields: [
			             {name: 'id',  type: 'string'},
			             {name: 'nombre',   type: 'string'},
			             {name: 'marca', type: 'string'},
			             {name: 'precio', type: 'string'},
			             {name: 'cantidad', type: 'string'},
			             {name: 'foto', type: 'string'}
			         ]
			});
			
			
			var store = new Ext.data.JsonStore({
				url: 'lista',
				root: 'jsonLista',
				fields: ['nombre','marca',{name:'precio', type: 'double'},{name:'cantidad', type: 'float'}]
			});
			alert('aaaa');
			
			store.load({
				callback: function(){
					alert(store.getCount());
				}
			});
			
		});
		
		
		
		
		
		
	});
	
	

</script>

	<div id="frame">
	<p id="msg">A friendly message to the user!</p>
	<p>
		<input type="button" value="Fade In" id="fadeInFx" />
		<input type="button" value="Fade Out" id="fadeOutFx" />
		<input type="button" value="Frame" id="frameFx" />
		<input type="button" value="Ghost" id="ghostFx" />
		<input type="button" value="Hightlight" id="highlightFx" />
		<input type="button" value="Puff" id="puffFx" />
		<input type="button" value="Scale 50x50" id="scaleFx" />
		<input type="button" value="Scale 100x100" id="scale2Fx" />
		<input type="button" value="Slide In" id="slideInFx" />
		<input type="button" value="Slide Out" id="slideOutFx" />
		<input type="button" value="Shift" id="shiftFx" />
		<input type="button" value="Scale Easing" id="scale3Fx" />
		<input type="button" value="alerta" id="alerta" />
		<input type="button" value="confirmacion" id="confirmacion" />
		<input type="button" value="prompt" id="prompt" />
		<input type="button" value="wait" id="wait" />
		<input type="button" value="Personalizado" id="showPersonalizado" />
		<input type="button" value="Ajax" id="ajax" />
		<input type="button" value="Lista" id="lista" />
	</p>
	<div id="element">
	</div>
	<div id="msg">
	</div>
</div>

</body>
</html>
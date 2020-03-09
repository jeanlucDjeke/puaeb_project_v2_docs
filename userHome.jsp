<%-- SpagoBI, the Open Source Business Intelligence suite

Copyright (C) 2012 Engineering Ingegneria Informatica S.p.A. - SpagoBI Competency Center
This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0, without the "Incompatible With Secondary Licenses" notice. 
If a copy of the MPL was not distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0/. --%>

<%@page language="java" 
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
%>
<%@ include file="/WEB-INF/jsp/wapp/homeBase.jsp"%>

<link id="spagobi-ext-4" rel="styleSheet" href ="<%=contextName %>/themes/sbi_default/css/home40/layout.css" type="text/css" />

<%
/*
	if(isFirstUrlToCallEqualsToDefaultPage == true && jsonMenuList.length() > 0 ){
		JSONObject menuItem = jsonMenuList.getJSONObject(0);
		String url = menuItem.optString("firstUrl");
		if(url != null) {
			firstUrlToCall = url;
		}
	}
*/
%>

<%-- Javascript object useful for session expired management (see also sessionExpired.jsp) --%>
<script>
sessionExpiredSpagoBIJS = 'sessionExpiredSpagoBIJS';

Ext.onReady(function () {
	
	var firstUrl =  '<%= StringEscapeUtils.escapeJavaScript(firstUrlToCall) %>';  
	firstUrlTocallvar = firstUrl;
    Ext.tip.QuickTipManager.init();
    this.mainframe = Ext.create('Ext.ux.IFrame', 
    			{ xtype: 'uxiframe'
    			, renderTpl: ['<iframe src="{src}" id="iframeDoc" name="{frameName}" width="100%" height="100%" frameborder="0"></iframe>']
	  			, src: firstUrl
  	  			, height: '100%'
  	  			});
    Sbi.execution.ExporterUtils.setIFrame( this.mainframe );
    
    this.titlePath = Ext.create("Ext.Panel",{title :'Home'});
    var itemsM = <%=jsonMenuList%>;
/**** Des menus ajoutés ********/
var menu_carte =   {
								"iconAlign": "top",
								"scale": "large",
								"tooltip": "Cartographie",
								"iconCls": "carte",
								"hrefTarget": "_self",

								"menu": [{
									"text": "ADMINISTRATION ET VIE-SCOLAIRE",
									"style": "text-align: left;",
									"hrefTarget": "_self",
									"iconCls": "bullet",
									"href": "javascript:javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=123', 'CARTOGRAPHIE > ADMINISTRATION ET VIE SCOLAIRE' )"
								}, {
									"text": "PEDAGOGIE DU SECONDAIRE",
									"style": "text-align: left;",
									"hrefTarget": "_self",
									"iconCls": "bullet",
									"href": "javascript:javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=124', 'CARTOGRAPHIE > PEDAGOGIE DU SECONDAIRE')"
								},
								{
									"text": "PEDAGOGIE DU PRIMAIRE ET DU PRESCOLAIRE",
									"style": "text-align: left;",
									"hrefTarget": "_self",
									"iconCls": "bullet",
									"href": ""
								},
								{
									"text": "PEDAGOGIE ENS. TECHNIQUE ET FORMATION PRO.", "style": "text-align: left;", "hrefTarget": "_self", "iconCls": "bullet",
									"href": ""
								}
								]
							};

							var menu_cube_olap = {
								"iconAlign": "top",
								"scale": "large",
								"tooltip": "Cubes OLAP",
								"iconCls": "rubik",
								"hrefTarget": "_self",
								"menu": [{
									"text": "IGEN",
									"style": "text-align: left;",
									"hrefTarget": "_self",
									"iconCls": "bullet",
									"menu": [{
										"text": "ADMINISTRATION ET VIE SCOLAIRE",
										"style": "text-align: left;",
										"hrefTarget": "_self",
										"iconCls": "bullet",
										"menu": [{
											"text": "SYNTHESE",
											"style": "text-align: left;",
											"hrefTarget": "_self",
											"iconCls": "bullet",
											"href": "javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=169', 'MISSIONS IGEN > CUBES OLAP > ADMINISTRATION ET VIE SCOLAIRE > SYNTHESE' )"
										}, {
											"text": "DETAILS",
											"style": "text-align: left;",
											"hrefTarget": "_self",
											"iconCls": "bullet",
											"href": "javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=185', 'MISSIONS IGEN > CUBES OLAP > ADMINISTRATION ET VIE SCOLAIRE > DETAILS' )"
										}]
									}, {
										"text": "PEDAGOGIE DU SECONDAIRE",
										"style": "text-align: left;",
										"hrefTarget": "_self",
										"iconCls": "bullet",
										"href": "javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=127', 'MISSIONS IGEN > CUBES OLAP > PEDAGOGIE DU SECONDAIRE' )",
										"menu": [{
											"text": "SYNTHESE",
											"style": "text-align: left;",
											"hrefTarget": "_self",
											"iconCls": "bullet",
											"href": "javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=171', 'MISSIONS IGEN > CUBES OLAP > PEDAGOGIE DU SECONDAIRE > SYNTHESE' )"
										}, {
											"text": "DETAILS",
											"style": "text-align: left;",
											"hrefTarget": "_self",
											"iconCls": "bullet",
											"href": "javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=186', 'MISSIONS IGEN > CUBES OLAP > PEDAGOGIE DU SECONDAIRE > DETAILS' )"
										}]
									}, 
									{
										"text": "PEDAGOGIE DU PRIMAIRE DU PRESCOLAIRE",
										"style": "text-align: left;",
										"hrefTarget": "_self",
										"iconCls": "bullet"
									},
									{
									"text": "PEDAGOGIE ENS. TECHNIQUE ET FORMATION PRO.", "style": "text-align: left;", "hrefTarget": "_self", "iconCls": "bullet",
									"href": ""
									}
									]
								},
								{
									"text": "PERFORMANCE DU SYSTEME",
									"style": "text-align: left;",
									"hrefTarget": "_self",
									"iconCls": "bullet",
									"menu": [
									{
										"text": "BAC A1",
										"style": "text-align: left;",
										"hrefTarget": "_self",
										"iconCls": "bullet",
										"href": "javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=158', 'PERFORMANCE DU SYSTEME > CUBES OLAP > BAC A1' )"
									},
									{
										"text": "BAC A2",
										"style": "text-align: left;",
										"hrefTarget": "_self",
										"iconCls": "bullet",
										"href": "javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=159', 'PERFORMANCE DU SYSTEME > CUBES OLAP > BAC A2' )"
									},
									{
										"text": "BAC B",
										"style": "text-align: left;",
										"hrefTarget": "_self",
										"iconCls": "bullet",
										"href": "javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=165', 'PERFORMANCE DU SYSTEME > CUBES OLAP > BAC B' )"
									},
									{
										"text": "BAC C",
										"style": "text-align: left;",
										"hrefTarget": "_self",
										"iconCls": "bullet",
										"href": "javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=160', 'PERFORMANCE DU SYSTEME > CUBES OLAP > BAC C' )"
									},
									{
										"text": "BAC D",
										"style": "text-align: left;",
										"hrefTarget": "_self",
										"iconCls": "bullet",
										"href": "javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=161', 'PERFORMANCE DU SYSTEME > CUBES OLAP > BAC D' )"
									},
									{
										"text": "BEPC",
										"style": "text-align: left;",
										"hrefTarget": "_self",
										"iconCls": "bullet",
										"href": "javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=162', 'PERFORMANCE DU SYSTEME > CUBES OLAP > BEPC' )"
									},
									{
										"text": "CEPE",
										"style": "text-align: left;",
										"hrefTarget": "_self",
										"iconCls": "bullet",
										"href": "javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=163', 'PERFORMANCE DU SYSTEME > CUBES OLAP > CEPE' )"
									}

									]
								}
								]

							};
							var menu_analyse_libre = {
								"iconAlign": "top",
								"scale": "large",
								"tooltip": "Analyse libre",
								"iconCls": "analyse_libre",
								"menu": [{
									"text": "IGEN",
									"style": "text-align: left;",
									"hrefTarget": "_self",
									"iconCls": "bullet",
									"menu": [{
										"text": "INSPECTION ADMIN",
										"style": "text-align: left;",
										"hrefTarget": "_self",
										"iconCls": "bullet",
										"href": "javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=198', 'ANALYSE LIBRE > INSPECTION ADMIN' )"
									},
									{
										"text": "INSPECTION PEDAGOGIQUE",
										"style": "text-align: left;",
										"hrefTarget": "_self",
										"iconCls": "bullet",
										"href": "javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=199', 'ANALYSE LIBRE > INSPECTION PEDAGOGIQUE' )"
									}
									]
								},
								{
									"text": "PERFORMANCE DU SYSTEME",
									"style": "text-align: left;",
									"hrefTarget": "_self",
									"iconCls": "bullet",
										"menu": [
										{
											"text": "STATISTIQUES DU PRIMAIRE",
											"style": "text-align: left;",
											"hrefTarget": "_self",
											"iconCls": "bullet",
											"href": "javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=136', 'PERFORMANCE DU SYSTEME > ANALYSE LIBRE > STATISTIQUES DU PRIMAIRE' )"
										},
										{
											"text": "STATISTIQUES DU SECONDAIRE",
											"style": "text-align: left;",
											"hrefTarget": "_self",
											"iconCls": "bullet",
											"href": "javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=137', 'PERFORMANCE DU SYSTEME > ANALYSE LIBRE > STATISTIQUES DU SECONDAIRE' )"
										},
										{
										"text": "BAC A1",
										"style": "text-align: left;",
										"hrefTarget": "_self",
										"iconCls": "bullet",
										"href": "javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=192', 'ANALYSE LIBRE > BAC A1' )"
										},
										{
											"text": "BAC A2",
											"style": "text-align: left;",
											"hrefTarget": "_self",
											"iconCls": "bullet",
											"href": "javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=193', 'MISSIONS IGEN > ANALYSE LIBRE > BAC A2' )"
										},
										{
											"text": "BAC C",
											"style": "text-align: left;",
											"hrefTarget": "_self",
											"iconCls": "bullet",
											"href": "javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=194', 'MISSIONS IGEN > ANALYSE LIBRE > BAC C' )"
										},
										{
											"text": "BAC D",
											"style": "text-align: left;",
											"hrefTarget": "_self",
											"iconCls": "bullet",
											"href": "javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=195', 'MISSIONS IGEN > ANALYSE LIBRE > BAC D' )"
										},
										{
											"text": "BEPC",
											"style": "text-align: left;",
											"hrefTarget": "_self",
											"iconCls": "bullet",
											"href": "javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=196', 'MISSIONS IGEN > ANALYSE LIBRE > BEPC' )"
										},
										{
											"text": "CEPE",
											"style": "text-align: left;",
											"hrefTarget": "_self",
											"iconCls": "bullet",
											"href": "javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=197', 'MISSIONS IGEN > ANALYSE LIBRE > CEPE' )"
										}
									]
								}
								]

							};

							var menu_exam = {
								"iconAlign": "top",
								"scale": "large",
								"tooltip": "Resultats examens",
								"iconCls": "exams",
								"menu": [{
									"text": "SYNTHESE NATIONALE",
									"style": "text-align: left;",
									"hrefTarget": "_self",
									"iconCls": "bullet",
									"href": "javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=166', 'PERFORMANCE DU SYSTEME > RESULTATS AUX EXAMENS > SYNTHESE' )"
								},
								{
									"text": "BAC A1",
									"style": "text-align: left;",
									"hrefTarget": "_self",
									"iconCls": "bullet",
									"href": "javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=138', 'PERFORMANCE DU SYSTEME > RESULTATS AUX EXAMENS > BAC A1' )"
									
								},
								{
									"text": "BAC A2",
									"style": "text-align: left;",
									"hrefTarget": "_self",
									"iconCls": "bullet",
									"href": "javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=139', 'PERFORMANCE DU SYSTEME > RESULTATS AUX EXAMENS > BAC A2' )"
									
								},
								{
									"text": "BAC C",
									"style": "text-align: left;",
									"hrefTarget": "_self",
									"iconCls": "bullet",
									"href": "javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=140', 'PERFORMANCE DU SYSTEME > RESULTATS AUX EXAMENS > BAC C' )"
								},
								{
									"text": "BAC D",
									"style": "text-align: left;",
									"hrefTarget": "_self",
									"iconCls": "bullet",
									"href": "javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=141', 'PERFORMANCE DU SYSTEME > RESULTATS AUX EXAMENS > BAC D' )"
		
								},
								{
									"text": "BAC B",
									"style": "text-align: left;",
									"hrefTarget": "_self",
									"iconCls": "bullet",
									"href": "javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=221', 'PERFORMANCE DU SYSTEME > RESULTATS AUX EXAMENS > BAC B' )"
		
								}
								/*,
								{
									"text": "BEPC",
									"style": "text-align: left;",
									"hrefTarget": "_self",
									"iconCls": "bullet",
									"menu": [{
										"text": "SYNTHESE",
										"style": "text-align: left;",
										"hrefTarget": "_self",
										"iconCls": "bullet",
										"href": "javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=179', 'PERFORMANCE DU SYSTEME > RESULTATS AUX EXAMENS > BEPC > SYNTHESE' )"
									}, {
										"text": "PUBLIC",
										"style": "text-align: left;",
										"hrefTarget": "_self",
										"iconCls": "bullet",
										"href": "javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=154', 'PERFORMANCE DU SYSTEME > RESULTATS AUX EXAMENS > BEPC > PUBLIC' )"
									}, {
										"text": "PRIVE",
										"style": "text-align: left;",
										"hrefTarget": "_self",
										"iconCls": "bullet",
										"href": "javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=155', 'PERFORMANCE DU SYSTEME > RESULTATS AUX EXAMENS > BEPC > PRIVE' )"
									}]
								},
								{
									"text": "CEPE",
									"style": "text-align: left;",
									"hrefTarget": "_self",
									"iconCls": "bullet",
									"menu": [{
										"text": "SYNTHESE",
										"style": "text-align: left;",
										"hrefTarget": "_self",
										"iconCls": "bullet",
										"href": "javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=180', 'PERFORMANCE DU SYSTEME > RESULTATS AUX EXAMENS > CEPE > SYNTHESE' )"
									}, {
										"text": "PUBLIC",
										"style": "text-align: left;",
										"hrefTarget": "_self",
										"iconCls": "bullet",
										"href": "javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=156', 'PERFORMANCE DU SYSTEME > RESULTATS AUX EXAMENS > CEPE > PUBLIC' )"
									}, {
										"text": "PRIVE",
										"style": "text-align: left;",
										"hrefTarget": "_self",
										"iconCls": "bullet",
										"href": "javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=157', 'PERFORMANCE DU SYSTEME > RESULTATS AUX EXAMENS > CEPE > PRIVE' )"
									}]
								}*/

								]
							};

							var menu_tableau_bord = {
								"iconAlign": "top",
								"scale": "large",
								"tooltip": "Tableau de bord",
								"iconCls": "tableaux",
								"hrefTarget": "_self",
								"menu": [{
									"text": "ADMINISTRATION ET VIE SCOLAIRE",
									"style": "text-align: left;",
									"hrefTarget": "_self",
									"iconCls": "bullet",
									"href": "javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=188', 'MISSIONS IGEN > PAR ETABLISSEMENT > ADMINISTRATION ET VIE SCOLAIRE' )"
								}, {
									"text": "PEDAGOGIE DU SECONDAIRE",
									"style": "text-align: left;",
									"hrefTarget": "_self",
									"iconCls": "bullet",
									"href": "javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=189', 'MISSIONS IGEN > PAR ETABLISSEMENT > PEDAGOGIE DU SECONDAIRE' )"
								}, {
									"text": "PEDAGOGIE DU PRIMAIRE ET DU PRESCOLAIRE",
									"style": "text-align: left;",
									"hrefTarget": "_self",
									"iconCls": "bullet"
								},
								{
									"text": "DREN",
									"style": "text-align: left;",
									"hrefTarget": "_self",
									"iconCls": "bullet",
									"href": "javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=201', 'PERFORMANCE DU SYSTEME > TABLEAUX DE BORD > DREN' )"
								},
								{
									"text": "IEP",
									"style": "text-align: left;",
									"hrefTarget": "_self",
									"iconCls": "bullet",
									"href": "javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=200', 'PERFORMANCE DU SYSTEME > TABLEAUX DE BORD > IEP' )"
								}
								/*,
								{
									"text": "PRIMAIRE",
									"style": "text-align: left;",
									"hrefTarget": "_self",
									"iconCls": "bullet",
									"href": "javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=134', 'PERFORMANCE DU SYSTEME > TABLEAUX DE BORD > PRIMAIRE' )"
								},
								{
									"text": "SECONDAIRE",
									"style": "text-align: left;",
									"hrefTarget": "_self",
									"iconCls": "bullet",
									"href": "javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=135', 'PERFORMANCE DU SYSTEME > TABLEAUX DE BORD > SECONDAIRE' )"
								}*/

								]
							};

							var menu_evolution_rappro = {
								"iconAlign": "top",
								"scale": "large",
								"tooltip": "Evolution & rapprochements",
								"iconCls": "evol",
								"hrefTarget": "_self",
								"menu": [{
									"text": "EVOLUTION",
									"style": "text-align: left;",
									"hrefTarget": "_self",
									"iconCls": "bullet",
									"menu": [{
										"text": "EVOLUTION CEPE",
										"style": "text-align: left;",
										"hrefTarget": "_self",
										"iconCls": "bullet",
										"href": "javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=205', 'EVOLUTION ET RAPPROCHEMENT > EVOLUTION > EVOLUTION CEPE' )"
									}, {
										"text": "EVOLUTION BEPC",
										"style": "text-align: left;",
										"hrefTarget": "_self",
										"iconCls": "bullet",
										"href": "javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=206', 'EVOLUTION ET RAPPROCHEMENT > EVOLUTION > EVOLUTION BEPC' )"
									}, {
										"text": "EVOLUTION BAC",
										"style": "text-align: left;",
										"hrefTarget": "_self",
										"iconCls": "bullet",
										"href": "javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=207', 'EVOLUTION ET RAPPROCHEMENT > EVOLUTION > EVOLUTION BAC' )"
									}]
								}, {
									"text": "RAPPROCHEMENTS",
									"style": "text-align: left;",
									"hrefTarget": "_self",
									"iconCls": "bullet",
									"menu": [{
										"text": "COMPARAISON EXAMENS",
										"style": "text-align: left;",
										"hrefTarget": "_self",
										"iconCls": "bullet",
										"href": "javascript:execDirectUrl('/SpagoBI/servlet/AdapterHTTP?ACTION_NAME=MENU_BEFORE_EXEC&MENU_ID=210', 'EVOLUTION ET RAPPROCHEMENT > RAPPROCHEMENTS > COMPARAISON EXAMENS' )"
									}]
								}]
							};

						
					    itemsM.splice(2,0,menu_carte);
					    itemsM.splice(3,0,menu_cube_olap);
					    itemsM.splice(4,0,menu_analyse_libre);
					    itemsM.splice(5,0,menu_exam);
					    itemsM.splice(6,0,menu_tableau_bord);
					    itemsM.splice(7,0,menu_evolution_rappro);


	for(i=0; i< itemsM.length; i++){
		var menuItem = itemsM[i];


					    		if(typeof menuItem.itemLabel === 'undefined' && menuItem.iconCls == "spagobi"){
					    			//console.log(menuItem.itemLabel);
					    			delete 	itemsM[i];
					    		}

		if(menuItem.itemLabel != null && (menuItem.itemLabel == "HELP" || menuItem.itemLabel == "INFO" || menuItem.itemLabel == "LANG")){
			//alert("Help");
			delete 	itemsM[i];
		} 
		
		if(menuItem.itemLabel != null && menuItem.itemLabel == "LANG"){
	 		var languagesMenuItems = [];
	 		for (var j = 0; j < Sbi.config.supportedLocales.length ; j++) {
	 			var aLocale = Sbi.config.supportedLocales[j];
	 			aLocale.currTheme = '<%=currTheme%>';
 				var aLanguagesMenuItem = new Ext.menu.Item({
					id: '',
					text: aLocale.language,
					iconCls:'icon-' + aLocale.country,
					href: this.getLanguageUrl(aLocale)
				})
 				languagesMenuItems.push(aLanguagesMenuItem);
	 		}
	 		menuItem.menu= languagesMenuItems;
		}else if(menuItem.itemLabel != null && menuItem.itemLabel == "ROLE"){
			if(Sbi.user.roles && Sbi.user.roles.length == 1){
				menuItem.hidden=true;
			}
		}else if(menuItem.itemLabel != null && menuItem.itemLabel == "HOME"){
			menuItem.tooltip = '<p style="color: blue; ">'+LN('sbi.home.Welcome')+'<b>'+ 
			'<p style="color: white; font-weight: bold;">'+Sbi.user.userName+'</p>'
								+'<b></p>'
		}
		
	}
	function hideItem( menu, e, eOpts){
       // console.log('bye bye ');
        menu.hide();
    }
	
	<%if (isDirectExec.equals("FALSE")){%>
		this.mainpanel =  Ext.create("Ext.panel.Panel",{
	    	autoScroll: true,
	    	height: '100%',
	    	items: [
				//this.titlePath	,		
	    	    mainframe]
	    	, dockedItems: [{
		   	    xtype: 'toolbar',
		   	    dock: 'left',
		   	    items: itemsM
	    	}]
	    });
	<%}else{%>	
		this.mainpanel =  Ext.create("Ext.panel.Panel",{
			autoScroll: true,
			height: '100%',
			items: [
				//this.titlePath	,		
			    mainframe]		
		});
	<%}%>  
	
    Ext.create('Ext.Viewport', {
    	
        layout: 'fit',
        items: [this.mainpanel]
    });
    
    
});

	
</script>
 
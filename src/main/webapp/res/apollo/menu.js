/* author:wangcj */

//导航菜单类
function Menu(config){

	//初始化设置
	this.config=config;
	//加载xml数据
	this.loadXmlData();
	
	//渲染
	this.createMenu(null, this.root);
}

Menu.prototype.loadXmlData = function(){

	if (window.ActiveXObject){

	   this.xmlobject =new ActiveXObject("Microsoft.XMLDOM");
	   this.xmlobject.async="false";
	   this.xmlobject.loadXML(this.config.xmlSrc);
	}else{
	   var parser=new DOMParser();
	   this.xmlobject =parser.parseFromString(this.config.xmlSrc,"text/xml");
	}
	alert(this.xmlobject);
	this.root = this.xmlobject.getElementsByTagName(this.config.rootName)[0];
	alert(this.root);
}

Menu.prototype.createMenu = function(menuItems,el){
	var childNodes = el.childNodes;
	
	
	
	var rootDiv = document.createElement("div");
	rootDiv.className = "nav";
	
	var firstul = document.createElement("ul");
	firstul.id="navOne";
	firstul.className = "uls nav1";
	
	for(var i=0;i<childNodes.length;i++){
		var hrefLink = childNodes[i].getAttribute('href')=='javascript:void(0)'||childNodes[i].getAttribute('href')=='#'?'javascript:void(0)':rootPath+childNodes[i].getAttribute('href');
		
		var item={
				parentText:el.getAttribute('text'),
				text:childNodes[i].getAttribute('text'),
				href:hrefLink
		};
		
		if(this.config.linkTarget){
			item.hrefTarget=this.config.linkTarget;
		}
		if(this.config.callBack){
			item.handler=this.config.callBack;
		}
		if(this.config.hideOnClick){
			item.hideOnClick=this.config.hideOnClick;
		}
		if(this.config.hideDelay){
			item.hideDelay=this.config.hideDelay;
		}
		if(childNodes[i].childNodes.length>0){		
			var subMenu = new Ext.menu.Menu({items:[]});
			this.createMenu(subMenu,childNodes[i]);
			item.menu=subMenu;		
		}
		
		
		var li_1_0=document.createElement("li");
		if(i==0){
			li_1_0.innerHTML="<a href='' title='"+item.text+"' class='here'><span><samp class='inb'></samp>"+item.text+"</span></a>"
		}else{
				//存在二级菜单
				if(childNodes[i].childNodes.length>0){		
					var secondNodes = childNodes[i].childNodes;
					var a_2_1=document.createElement("a");
					a_2_1.href="";
					a_2_1.title=item.text;
					a_2_1.innerHTML="<span>"+item.text+"</span>";
					li_1_0.appendChild(a_2_1);
					
					var ul_2_1=document.createElement("ul");
					ul_2_1.className="uls nav2";
					
					
					
					for(var j=0;j<secondNodes.length;j++){
						
						var hrefLink2 = secondNodes[j].getAttribute('href')=='javascript:void(0)'||secondNodes[j].getAttribute('href')=='#'?'javascript:void(0)':rootPath+secondNodes[j].getAttribute('href');
		
						var item2={
								text:secondNodes[j].getAttribute('text'),
								href:hrefLink
						};
						var li_2_0=document.createElement("li");
						//存在三级菜单
						if(secondNodes[i].childNodes.length>0){		
												
								var thirdNodes = secondNodes[i].childNodes;
								var a_3_1=document.createElement("a");
								a_3_1.href="";
								a_3_1.title=item.text;
								a_3_1.innerHTML="<span>"+item.text+"</span>";
								li_2_0.appendChild(a_3_1);
								
								var ul_3_1=document.createElement("ul");
								ul_3_1.className="uls nav3";
								
								
								
								for(var k=0;k<thirdNodes.length;k++){
									
									var hrefLink3 = thirdNodes[k].getAttribute('href')=='javascript:void(0)'||thirdNodes[k].getAttribute('href')=='#'?'javascript:void(0)':rootPath+thirdNodes[k].getAttribute('href');
					
									var item3={
											text:secondNodes[k].getAttribute('text'),
											href:hrefLink
									};
									var li_3_0=document.createElement("li");
									li_3_0.innerHTML="<a href='' title='"+item3.text+"'><span>"+item3.text+"</span></a>";
									ul_3_1.appendChild(li_3_0);
									
								}
								li_1_0.appendChild(ul_2_1);
							
							
						}else{
							li_2_0.innerHTML="<a href='' title='"+item2.text+"'><span>"+item2.text+"</span></a>";
						}
						ul_2_1.appendChild(li_2_0);
						
						
					}
					li_1_0.appendChild(ul_2_1);
					
				}else{
					li_1_0.innerHTML="<a href='' title='"+item.text+"'><span>"+item.text+"</span></a>";
				}
		}
		var li_1_1=document.createElement("li");
		li_1_1.className = "spl";
		
		firstul.appendChild(li_1_0);
		firstul.appendChild(li_1_1);
	}
	rootDiv.appendChild(firstul);
	
	var renderDiv = document.getElementById("menuDiv");
	renderDiv.appendChild(rootDiv);
}

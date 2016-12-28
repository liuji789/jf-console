/**
 *  TabPanel.js
 *
 */
//标签类
function TabPanel(config){
	this.id = config.id;
	this.name = config.name;
	this.width = config.width;
	this.height = config.height;
	this.scrolling = config.scrolling;
	this.tabs = config.items;
	this.cls = config.cls;
	this.contents = [];
	this.currentItem = null;
	this.deferredRender = config.deferredRender;
	
	this.ulDiv = null;
	this.firstDiv = null;
	this.contentDiv = null;
	this.renderDiv = null;
	this.isIE = true;
	
	this.init();
	if(config.renderTo!=null){
		this.renderTo = config.renderTo;
		this.render(this.renderTo,this);
	}
}
TabPanel.prototype.getCurrentItem = function(){
	return this.currentItem;
};
//初始化数据
TabPanel.prototype.init = function(){
	if(isFirefox=navigator.userAgent.indexOf("Firefox")>0){ 
		 this.isIE = false;
	}

	var ul = document.createElement("ul");
	
	var firstDiv = document.createElement("div");
	if(this.cls&&this.cls=='tab1'){
		firstDiv.className = "cTabFirst";
	}else if(this.cls&&this.cls=='tab3'){
		ul.className = "cTabThird";
	}else{
		ul.className = "cTabSecond";
	}
	ul.id = this.id+new Date().getTime();
	
	var contentDiv = document.createElement("div");
	contentDiv.id = "content"+new Date().getTime();
	
	if(this.cls&&this.cls=='tab3'){
		contentDiv.className = "cTabThirdIframe";
	}
	
	for(var i=0;i<this.tabs.length;i++){
		var li = document.createElement("li");
		
		var a = document.createElement("a");
		if(i==0){
			li.className = "firstFirstLi";
			if(this.cls&&this.cls=='tab1'){
				a.className = "firstSel";
				a.innerHTML = "<span>"+this.tabs[i].title+"</span><span class='firstR'></span>";
			}else if(this.cls&&this.cls=='tab3'){
				a.className = "thirdSel";
				a.innerHTML = "<span>"+this.tabs[i].title+"</span><span class='thirdR'></span>";
			}else{
				a.className = "secondSel";
				a.innerHTML = "<span>"+this.tabs[i].title+"</span><span class='secondR'></span>";
			}
		}else{
			if(this.cls&&this.cls=='tab1'){
				a.innerHTML = "<span>"+this.tabs[i].title+"</span><span class='firstR'></span>";
			}else if(this.cls&&this.cls=='tab3'){
				a.innerHTML = "<span>"+this.tabs[i].title+"</span><span class='thirdR'></span>";
			}else{
				a.innerHTML = "<span>"+this.tabs[i].title+"</span><span class='secondR'></span>";
			}
		}
		if(this.tabs[i].handle){
			li.handle = this.tabs[i].handle;
			if(obj.attachEvent){
				a.firstChild.attachEvent("onclick",this.tabs[i].handle);  
			}else{
				a.firstChild.addEventListener("click",this.tabs[i].handle,false);  
			}
			  
		}
		li.appendChild(a);
		li.id = this.tabs[i].id+"_li";
		li.name = this.tabs[i].name;
		li.url = this.tabs[i].url;
		
		ul.appendChild(li);
		
		if(this.tabs[i].type=='div'){
			var obj = document.getElementById(this.tabs[i].url);
			this.contents[i] = obj;
			contentDiv.appendChild(obj);
		}else{
			var fra = document.createElement("iframe");
			fra.id = this.tabs[i].id;
			fra.name = this.tabs[i].name;
			if(this.deferredRender==false){
        		fra.src = this.tabs[i].url;
        	}else{
        		if(i==0){
        			fra.src = this.tabs[i].url;
        		}
        	}
			if(i==0){
				fra.style.display = "block";
			}else{
				fra.style.display = "none";
			}
			if(this.height!=null){
				fra.style.height = this.height+"px";
			}else{
				fra.style.height = "450px";
			}
			if(this.width!=null){
				fra.style.width = this.width;
			}else{
				fra.style.width = "100%";
			}
			
			fra.setAttribute("frameBorder", "0");
			if(this.scrolling!=null){
				fra.scrolling = this.scrolling;
			}
			this.contents[i] = fra;
			
			if(this.tabs[i].onload){
				if(obj.attachEvent){
					fra.attachEvent("onload",this.tabs[i].onload);  
				}else{
					fra.addEventListener("onload",this.tabs[i].onload,false);  
				}
			}
			
			contentDiv.appendChild(fra);
		}
		
	}
	if(this.cls&&this.cls=='tab1'){
		firstDiv.appendChild(ul);
		var span = document.createElement("span");
		span.className = "cTabFirstR";
		firstDiv.appendChild(span);
	}
	this.ulDiv = ul;
	this.firstDiv = firstDiv;
	this.contentDiv = contentDiv;
	this.currentItem = this.contents[0];
}

//渲染Tabs
TabPanel.prototype.render = function(tabDivId,obj){
	var tabDiv = document.getElementById(tabDivId);
	
	tabDiv.className = "tabWrapper";
	this.renderDiv = tabDiv;
	
	this.renderDiv.parentNode.insertBefore(this.contentDiv, this.renderDiv.nextSibling);
	
	if(this.cls&&this.cls=='tab1'){
		this.renderDiv.appendChild(this.firstDiv);
		var tabTitle = document.getElementById(obj.ulDiv.id);
		var tabItem = tabTitle.getElementsByTagName("li");
		for (var k = 0; k < tabItem.length; k++) {
			if(obj.attachEvent||(navigator.userAgent.indexOf("MSIE")>0)){
				tabItem[k].attachEvent('onclick', function() {
				       var o = event.srcElement;
				        o.parentNode.className = "firstSel";
				        
				        var tabItemSpans = tabTitle.getElementsByTagName("span");
				        var tabItemAs = tabTitle.getElementsByTagName("a");
				        for (var j = 0; j < tabItemSpans.length; j++) {
				        	var contentIndex = parseInt(j/2);
					        if (tabItemSpans[j].parentNode.parentNode != o.parentNode.parentNode) {
					        	tabItemSpans[j].parentNode.className = "";
						        obj.contents[contentIndex].style.display = "none";
					        }else{
					        	if(obj.deferredRender!=false&&obj.contents[contentIndex].src==""){
					        		obj.contents[contentIndex].src = obj.tabs[contentIndex].url;
					        	}
					        	obj.currentItem = obj.contents[contentIndex];
					        	obj.contents[contentIndex].style.display = "block";
					        }
				        }
				});
			}else{
				tabItem[k].firstChild.firstChild.addEventListener('click', function(event){
			        var o = event.srcElement ? event.srcElement : event.target;
			        o.parentNode.className = "firstSel";
			        
			        var tabItemSpans = tabTitle.getElementsByTagName("span");
			        var tabItemAs = tabTitle.getElementsByTagName("a");
			        for (var j = 0; j < tabItemSpans.length; j++) {
			        	var contentIndex = parseInt(j/2);
				        if (tabItemSpans[j].parentNode.parentNode != o.parentNode.parentNode) {
				        	tabItemSpans[j].parentNode.className = "";
					        obj.contents[contentIndex].style.display = "none";
				        }else{
				        	if(obj.deferredRender!=false&&obj.contents[contentIndex].src==""){
				        		obj.contents[contentIndex].src = obj.tabs[contentIndex].url;
				        	}
				        	obj.currentItem = obj.contents[contentIndex];
				        	obj.contents[contentIndex].style.display = "block";
				        }
			        }
				},false);
			}
		}
	}else if(this.cls&&this.cls=='tab3'){
		this.renderDiv.appendChild(this.ulDiv);
		var tabTitle = document.getElementById(obj.ulDiv.id);
		var tabItem = tabTitle.getElementsByTagName("li");
		for (var k = 0; k < tabItem.length; k++) {
			if(obj.attachEvent||(navigator.userAgent.indexOf("MSIE")>0)){
				tabItem[k].attachEvent('onclick', function() {
				       var o = event.srcElement;
				        o.parentNode.className = "thirdSel";
				        
				        var tabItemSpans = tabTitle.getElementsByTagName("span");
				        var tabItemAs = tabTitle.getElementsByTagName("a");
				        for (var j = 0; j < tabItemSpans.length; j++) {
				        	var contentIndex = parseInt(j/2);
					        if (tabItemSpans[j].parentNode.parentNode != o.parentNode.parentNode) {
					        	tabItemSpans[j].parentNode.className = "";
						        obj.contents[contentIndex].style.display = "none";
					        }else{
					        	if(obj.deferredRender!=false&&obj.contents[contentIndex].src==""){
					        		obj.contents[contentIndex].src = obj.tabs[contentIndex].url;
					        	}
					        	obj.currentItem = obj.contents[contentIndex];
					        	obj.contents[contentIndex].style.display = "block";
					        }
				        }
				});
			}else{
				tabItem[k].firstChild.firstChild.addEventListener('click', function(event){
			        var o = event.srcElement ? event.srcElement : event.target;
			        o.parentNode.className = "thirdSel";
			        
			        var tabItemSpans = tabTitle.getElementsByTagName("span");
			        var tabItemAs = tabTitle.getElementsByTagName("a");
			        for (var j = 0; j < tabItemSpans.length; j++) {
			        	var contentIndex = parseInt(j/2);
				        if (tabItemSpans[j].parentNode.parentNode != o.parentNode.parentNode) {
				        	tabItemSpans[j].parentNode.className = "";
					        obj.contents[contentIndex].style.display = "none";
				        }else{
				        	if(obj.deferredRender!=false&&obj.contents[contentIndex].src==""){
				        		obj.contents[contentIndex].src = obj.tabs[contentIndex].url;
				        	}
				        	obj.currentItem = obj.contents[contentIndex];
				        	obj.contents[contentIndex].style.display = "block";
				        }
			        }
				},false);
			}
		}
	}else{
		this.renderDiv.appendChild(this.ulDiv);
		var tabTitle = document.getElementById(obj.ulDiv.id);
		var tabItem = tabTitle.getElementsByTagName("li");
		
		for (var k = 0; k < tabItem.length; k++) {

			if(obj.attachEvent||(navigator.userAgent.indexOf("MSIE")>0)){
				tabItem[k].attachEvent('onclick', function() {
			        var o = event.srcElement;
			        o.parentNode.className = "secondSel";
			        
			        var tabItemSpans = tabTitle.getElementsByTagName("span");
			        var tabItemAs = tabTitle.getElementsByTagName("a");
			        for (var j = 0; j < tabItemSpans.length; j++) {
			        	var contentIndex = parseInt(j/2);
				        if (tabItemSpans[j].parentNode.parentNode != o.parentNode.parentNode) {
				        	tabItemSpans[j].parentNode.className = "";
					        obj.contents[contentIndex].style.display = "none";
				        }else{
				        	if(obj.deferredRender!=false&&obj.contents[contentIndex].src==""){
				        		obj.contents[contentIndex].src = obj.tabs[contentIndex].url;
				        	}
				        	obj.currentItem = obj.contents[contentIndex];
				        	obj.contents[contentIndex].style.display = "block";
				        }
			        }
				});
				
			}else{
				tabItem[k].firstChild.firstChild.addEventListener('click', function(event){
			       		var o = event.srcElement ? event.srcElement : event.target;
				        o.parentNode.className = "secondSel";
				        
				        var tabItemSpans = tabTitle.getElementsByTagName("span");
				        var tabItemAs = tabTitle.getElementsByTagName("a");
				        for (var j = 0; j < tabItemSpans.length; j++) {
				        	var contentIndex = parseInt(j/2);
					        if (tabItemSpans[j].parentNode.parentNode != o.parentNode.parentNode) {
					        	tabItemSpans[j].parentNode.className = "";
						        obj.contents[contentIndex].style.display = "none";
					        }else{
					        	if(obj.deferredRender!=false&&obj.contents[contentIndex].src==""){
					        		obj.contents[contentIndex].src = obj.tabs[contentIndex].url;
					        	}
					        	obj.currentItem = obj.contents[contentIndex];
					        	obj.contents[contentIndex].style.display = "block";
					        }
				        }
				},false);
			}
		}
	}
}
//选中某一标签页
TabPanel.prototype.select = function(itemId){
	var tabTitle = document.getElementById(this.ulDiv.id);
	var tabItem = tabTitle.getElementsByTagName("li");
	if(this.cls&&this.cls=='tab1'){
        var tabItem2 = tabTitle.getElementsByTagName("li");
        for (var j = 0; j < tabItem2.length; j++) {
	        if (tabItem2[j].id!=itemId) {
	        	tabItem2[j].firstChild.className = "";
		        this.contents[j].style.display = "none";
	        }else{
	        	tabItem2[j].firstChild.firstChild.fireEvent("onclick");    
				tabItem2[j].firstChild.className = "firstSel";
	        	this.currentItem = this.contents[j];
	        	this.contents[j].style.display = "block";
	        }
        }
	}else if(this.cls&&this.cls=='tab3'){
        var tabItem2 = tabTitle.getElementsByTagName("li");
        for (var j = 0; j < tabItem2.length; j++) {
	        if (tabItem2[j].id!=itemId) {
	        	tabItem2[j].firstChild.className = "";
		        this.contents[j].style.display = "none";
	        }else{
	        	tabItem2[j].firstChild.firstChild.fireEvent("onclick");    
				tabItem2[j].firstChild.className = "thirdSel";
	        	this.currentItem = this.contents[j];
	        	this.contents[j].style.display = "block";
	        }
        }
	}else{
		var tabItem2 = tabTitle.getElementsByTagName("li");
        for (var j = 0; j < tabItem2.length; j++) {
	        if (tabItem2[j].id!=itemId) {
	        	tabItem2[j].firstChild.className = "";
		        this.contents[j].style.display = "none";
	        }else{
	        	tabItem2[j].firstChild.firstChild.fireEvent("onclick");    
				tabItem2[j].firstChild.className = "secondSel";
	        	this.currentItem = this.contents[j];
	        	this.contents[j].style.display = "block";
	        }
        }
	}
}
//清空tab标签页
TabPanel.prototype.removeAll = function(){
	this.renderDiv.clearAttributes();
	while(this.renderDiv.hasChildNodes()){
		this.renderDiv.removeChild(this.renderDiv.firstChild);
	}
	while(this.contentDiv.hasChildNodes()){
		this.contentDiv.removeChild(this.contentDiv.firstChild);
	}
}

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>tab 示例</title>
 
 	<jsp:include page="head.jsp"></jsp:include>
  
	 
  </head>
  <body>
   ${pageContext.request.contextPath} 值以/开头 <br/>
    
  
<ul id="myTab" class="nav nav-tabs">
	<li class="active">
		<a href="#home" data-toggle="tab">
			 菜鸟教程
		</a>
	</li>
	<li><a href="#ios" data-toggle="tab">iOS</a></li>
	<li class="dropdown">
		<a href="#" id="myTabDrop1" class="dropdown-toggle" 
		   data-toggle="dropdown">Java 
			<b class="caret"></b>
		</a>
		<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
			<li><a href="#jmeter" tabindex="-1" data-toggle="tab">jmeter</a></li>
			<li><a href="#ejb" tabindex="-1" data-toggle="tab">ejb</a></li>
		</ul>
	</li>
</ul>
<div id="myTabContent" class="tab-content">
	<div class="tab-pane fade in active" id="home">
		<p>菜鸟教程是一个提供最新的web技术站点，本站免费提供了建站相关的技术文档，帮助广大web技术爱好者快速入门并建立自己的网站。菜鸟先飞早入行——学的不仅是技术，更是梦想。</p>
	</div>
	<div class="tab-pane fade" id="ios">
		<p>iOS 是一个由苹果公司开发和发布的手机操作系统。最初是于 2007 年首次发布 iPhone、iPod Touch 和 Apple 
			TV。iOS 派生自 OS X，它们共享 Darwin 基础。OS X 操作系统是用在苹果电脑上，iOS 是苹果的移动版本。</p>
	</div>
	<div class="tab-pane fade" id="jmeter">
		<p>jMeter 是一款开源的测试软件。它是 100% 纯 Java 应用程序，用于负载和性能测试。</p>
	</div>
	<div class="tab-pane fade" id="ejb">
		<p>Enterprise Java Beans（EJB）是一个创建高度可扩展性和强大企业级应用程序的开发架构，部署在兼容应用程序服务器（比如 JBOSS、Web Logic 等）的 J2EE 上。
		</p>
	</div>
</div>
	
  </body>
</html>
 
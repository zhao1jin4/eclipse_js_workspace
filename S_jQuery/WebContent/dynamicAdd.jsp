<%@ page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dynamic Add</title>

<style>
 

 
</style> 

<jsp:include page="commonHead.jsp"/>
	
<script>

	function addOptions()
	{
	
		var lineSelect=document.getElementById('newLineSelect'); 
		//先清已有的车线
		lineSelect.options.length=0;
		//再加新的车线
		var opt=new Option("--请选择--","");
		lineSelect.options.add(opt);
		
		var dataArray=new Array();
		dataArray.push({name:"名字1",value:"01"});
		dataArray.push({name:"名字2",value:"02"});
		dataArray.push({name:"名字3",value:"03"});
		
		for(var i in dataArray)
		{
			var opt=new Option(dataArray[i].name ,dataArray[i].value );
			if(i==3)
				opt.selected="selected";
			lineSelect.options.add(opt);
		}
	}
		
	function addDivs()
	{
		var canSelect=new Array();
	 	canSelect.push({Site:'上海',SiteCode:'021'});
	 	canSelect.push({Site:'苏州',SiteCode:'025'});
	 	canSelect.push({Site:'南京',SiteCode:'02x'});
	 	canSelect.push({Site:'北京',SiteCode:'010'});
		
		//----------
		/*	 
			//先清已有的 下一站
			var nextStopDiv=document.getElementById('nextStopDiv');
			for(var i=0; i< nextStopDiv.childElementCount;i++) //childElementCount 不对？？？
			{
				if(nextStopDiv.children[i].style.display=='block')
				{
					nextStopDiv.removeChild(nextStopDiv.children[i]);
				}
			}
			//再加新的 下一站
			
			var hiddenNext=nextStopDiv.firstElementChild
		 	var lineNextStop=shareGetNextStop();//调用通用查询 所有后面站点
			for(var i in lineNextStop)
			{
				var item=hiddenNext.cloneNode(true);
				item.style='display:block';//BOS不支持这个，要用 jQuery show()
				item.getElementsByTagName("input")[0].value=canSelect[i].Site;//text
				item.getElementsByTagName("input")[1].value=canSelect[i].SiteCode;//hiden
				var select=item.getElementsByTagName("select")[0];
				select.options.length=0;//先清
				select.options.add(new Option("--请选择--",""));
				for(var j in canSelect)
				{
					var opt=new Option(canSelect[j].Site,canSelect[j].SiteCode);
					if(lineNextStop[i].SiteCode == canSelect[j].SiteCode)
					{
						opt.selected='selected';
					}
					select.options.add(opt);
				}
				nextStopDiv.appendChild(item);
			}
			*/
			//-------- jQuery 版本
			//先清已有的 下一站
			 $('#nextStopDiv').children().each(function (index,item)
			{
				//if(item.style.display!='none')
					//	item.remove();
				//或者 
				if($(this).is(":visible"))
					$(this).remove();
			}); 
			//再加新的 下一站
			var hiddenNext=$('#nextStopDiv :first-child');
		 	var lineNextStop=shareGetNextStop();//调用通用查询 所有后面站点
		 
			for(var i in  lineNextStop)
			{
				
				//var item=hiddenNext.clone();//有BUG
				//item.show();//有BUG
				
				var item=hiddenNext[0].cloneNode(true);
				
				//item.appendTo($('#nextStopDiv'));
				$('#nextStopDiv').append(item);
				$(item).css('display','block');

				
				$(item).find("input").eq(0).val(canSelect[i].Site);//text
				$(item).find("input").eq(1).val(canSelect[i].SiteCode);//hiden
				var select=$(item).find("select").eq(0);
				select.html('');//先清
				select.append("<option value=''>--请选择--</option>");
				for(var j in canSelect)
				{
					if(lineNextStop[i].SiteCode == canSelect[j].SiteCode)
					{
						select.append("<option value="+canSelect[j].SiteCode+" selected='selected'>"+canSelect[j].Site+"</option>");
					}else
					{
						select.append("<option value="+canSelect[j].SiteCode+">"+canSelect[j].Site+"</option>");
					}
				}
			} 
	}
	function shareGetNextStop()
 	{
 		var data=new Array();
 		data.push({Site:'上海',SiteCode:'021'});
 		data.push({Site:'苏州',SiteCode:'025'});
 		return data;
 	}
	//选择车线下拉时，级联带出所有下一站
    function showChildSelect()
    {
    	var nextStopData=shareGetNextStop( );//调用通用查询 所有后面站点
 		var nextStopDiv=document.getElementById('nextStopDiv');
		for(var i=0; i< nextStopDiv.childElementCount;i++)
		{
			if(nextStopDiv.children[i].style.display!='block')
				continue;
			var select=nextStopDiv.children[i].getElementsByTagName("select")[0];
			//先清空
			select.options.length=0;
			select.options.add(new Option("--请选择--",""));
			for (var j in nextStopData)
			{
				select.options.add(new Option(nextStopData[j].Site,nextStopData[j].SiteCode))
			}
		}
    }
	
$(function(){

  
    

}); 
</script>
</head>
<body>
<select id="newLineSelect" onclick="showChildSelect()">

</select>
 <input type="button" value="动态增加Options" onclick="addOptions()"/>
 
 
 
 
 <br>
 <input type="button" value="动态增加Divs" onclick="addDivs()"/>
 <div id="nextStopDiv">
    <div  style="display:none" title="top">
        <span  >
            <label >原下一站：</label>
            <input type="text"  readonly="readonly"/>
            <input type="hidden"  />
        </span>
        <span  >
            <label  >下一站：</label>
            <select name="newNextStop" >
                
            </select>
        </span>
    </div>
  </div> 
 
 

</body>
</html>
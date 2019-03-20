
/**
 * 初始化选人控件
 * @param id            控件ID
 * @param multiple      是否多选,true：多选
 * @param name          生成姓名隐藏域,如需要后台保存姓名，可以传此属性
   @param required      是否可为空
 */
function initTagBoxWithSelectUser(id,multiple,name,required) {
    var value = $("#" + id).val();
    var comboData = [];
    var comboValue = [];
    if(value){
        comboValue = value.split(",");
        var text = $("#" + id).attr("data-tagtext");
        if(text){
            var textArr = text.split(",");
            for(var i=0; i < textArr.length; i++) {
                var idText = {id:comboValue[i],text:textArr[i]};
                comboData.push(idText);
            }

        }else{
        	 var root="/S_jQueryEasyUI";
            var params = {"input":value};
            $.ajax({
                type: "post",
            	url:root+'/easyUI/tagBoxJson',
                data: params,
                async: false,
                success: function (data) {
                    comboData = data; 
                }
            });
        }
    }
    var selectedTagBoxUser = {};
    if(multiple == null){
        multiple = false;
    }
    if(required == null){
        required = false;
    }
    var timeout = 0;
    var isInputed = true;
    $("#"+id).tagbox({ 
        limitToList:true,
        prompt: "",
        valueField: 'id',
        textField: 'text',
        value:comboValue,
        data:comboData,
        multiple:multiple,
        required: required,
        //panelWidth:"auto",//文档没有auto的值
        buttonIcon:("icon-man"),
        buttonAlign:"left",
        events:{
        	input: function (e) {
        		newValue=e.target.value;
                //在选择人名时，也会触发onChange事件，获取到value(value为主键ID)，如果继续执行searchForm方法，会将主键ID填入文本框
                //所以需要判断输入是汉字或字母才触发searchForm方法，避免上述问题
                if(!isInputed){
                    return;
                }
                clearTimeout(timeout);
                timeout = setTimeout(function () {
                    var trueValue = newValue;
                    // alert(trueValue)
                    if (isChinese(trueValue)) {
                        searchTagBoxForm("fullname", trueValue, id, selectedTagBoxUser);
                    }
                    else if (isChar(trueValue) && trueValue.length > 1) {
                        searchTagBoxForm("email", trueValue, id, selectedTagBoxUser);
                    }
                    $("#"+id).tagbox("panel").css("width","auto")//auto
                },300);
            },compositionstart:function(e){
                isInputed = false;
            },compositionend:function(e){
            	isInputed = true;
            }
        },
               
        onSelect:function(data){
            //保存已选择的Item
            if(! selectedTagBoxUser[data.id]){
                if(!multiple){
                    selectedTagBoxUser = {};
                }
                selectedTagBoxUser[data.id] = data;
            }
            //将textField的显示文本截取
            if(data.text.indexOf("(") != -1){
                data.text = data.text.substr(0,data.text.indexOf("("));
            }
            //将textField的显示文本截取
            if(data.text.indexOf(" ") != -1){
                data.text = data.text.substr(0,data.text.indexOf(" "));
            }
            if(name){
                updateNameTextHidden(id,selectedTagBoxUser,name,this);
            }

        },
        onRemoveTag:function(itemId){
            //删除已选中的记录
            delete selectedTagBoxUser[itemId];//只这样不行的??????????
            if(name){
                updateNameTextHidden(id,selectedTagBoxUser,name,this);
            }
        }

    });
}
function updateNameTextHidden(compomentId,selectedTagBoxUser,name,compom){
    var value = "";
    var length = 0;
    $.each(selectedTagBoxUser,function(i,param){
        value += param.text;
        if(length < Object.keys(selectedTagBoxUser).length - 1){
            value += ",";
        }
        length ++;
    });
    //增加
    if($("#"+compomentId+"_name").length == 0){
        var hiddenInput = "<input type=\"hidden\" id=\""+compomentId+"_name\" name=\""+name+"\" value=\""+value+"\" />";
        $(compom).append(hiddenInput);
    }else{
        $("#"+compomentId+"_name").val(value);
    }

}
function searchTagBoxForm(field,value,compomentId,selectedTagBoxUser){ 
 	var data = {"input":value}; 
    var root="/S_jQueryEasyUI";
    $.post(root+'/easyUI/tagBoxJson',data,
        function(result){
            if(selectedTagBoxUser){
                $.each(selectedTagBoxUser,function(i,param){
                    result.push(param);
                });
            }
            $("#"+compomentId).combobox("loadData", result);
            $("#"+compomentId).combobox("setText", value);

        });
}
//检测是否为中文，true表示是中文，false表示非中文
function isChinese(str){
    if(/^[\u3220-\uFA29]+$/.test(str)){
        return true;
    }else{
        return false;
    }
}
function isChar(str){
    var i = /^(?!_)([A-Za-z ]+)$/;
    if(!i.test(str)){
        return false;
    }
    return true;
}
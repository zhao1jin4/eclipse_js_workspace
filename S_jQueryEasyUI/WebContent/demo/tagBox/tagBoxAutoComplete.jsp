    <%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>TagBox with Autocomplete - jQuery EasyUI Demo</title>
       <jsp:include page="../../commonHead.jsp"  />
    </head>
    <body>
        <h2>TagBox with Autocomplete</h2>
        <p>The autocomplete is the built-in feature that allows the user to select a value from the drop-down list.</p>
        <div style="margin:20px 0;"></div>
        <div class="easyui-panel" style="width:100%;max-width:400px;padding:30px 60px;">
            <input class="easyui-tagbox" label="Add a tag" style="width:100%" data-options="
                    url: 'tagbox_data1.json',
                    method: 'get',
                    value: '3',
                    valueField: 'id',
                    textField: 'text',
                    limitToList: true,
                    hasDownArrow: true,
                    prompt: 'Select a Language'
                    ">
        </div>
    </body>
    </html>
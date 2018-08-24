<%@page pageEncoding="UTF-8" %>
<%! String index; %>
<% 
	index=request.getParameter("index");
%>


<form method="post"> <!-- 有form是为验证 -->
	<table class="dv-table" style="width:100%;border:1px solid #ccc;padding:5px;margin-top:5px;">
		<tr>
			<td>username</td>
			<td><input name="username" class="easyui-validatebox" required="true"></input></td>
			<td>language</td>
			<td><input name="language" class="easyui-validatebox" required="true"></input></td>
		</tr>
		<tr>
			<td>salary</td>
			<td><input name="salary"></input></td>
			<td>Email</td>
			<td><input name="email" class="easyui-validatebox" validType="email"></input></td>
		</tr>
		<tr>
			<td>birthday</td>
			<td><input name="birthday"></input></td>
			<td>comment</td>
			<td><input name="comment" ></input></td>
		</tr>
	</table>
	<div style="padding:5px 0;text-align:right;padding-right:30px">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="saveItem(<%=index%>)">Save</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="cancelItem(<%=index%>)">Cancel</a>
	</div>
</form>
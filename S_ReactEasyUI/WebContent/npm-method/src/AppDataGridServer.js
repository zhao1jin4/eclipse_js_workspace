import React from 'react'; 
import './App.css';

import { DataGrid, GridColumn, ComboBox, Label } from 'rc-easyui';
import { NumberBox,SwitchButton,CheckBox,TextBox } from 'rc-easyui';
import $ from  'jquery'
class App extends React.Component 
{
	constructor(props) 
	{
		super(props);
		this.state = 
	    {
			total: 0,
			pageNumber: 1,
			pageSize: 20,
			data: [],
			loading: false,
			//以下自已使用的
			pagePosition: "bottom",
			options: [
				{ value: "bottom", text: "Bottom" },
				{ value: "top", text: "Top" },
				{ value: "both", text: "Both" }
			]
	    }
	} 
	componentDidMount() 
	{
		this.loadPage(this.state.pageNumber, this.state.pageSize)
	}
	loadPage(pageNumber, pageSize)
	{
		this.setState({ loading: true })
		var that=this;
		//这时 Content-Type默认为 text/plain;charset=UTF-8 要修改为  application/x-www-form-urlencoded 
		var data = "page="+pageNumber+"&rows=20&my_custome_param=123"; 
		//方式二 		 
		// var data = new URLSearchParams();  // Content-Type默认为 application/x-www-form-urlencoded
		// data.set("my_custome_param",123);
		// data.set("page",pageNumber);
		// data.set("rows",pageSize); 
		 
		fetch('/easyUI/queryJsonData', 
			{ method: "POST",

			headers: {
				//"Content-Type": "application/json;charset=UTF-8",  
				"Content-Type": "application/x-www-form-urlencoded;charset=UTF-8" 
			},
			  body:data
			}
		).then(response => 
			response.json()//如debug报body stream is locked
		).then(function(result) 
		{ 
			console.log(result);
			console.log(result.rows); 
			//这里不能调用 this.setState 
			that.setState(Object.assign({}, result,
				{
					data: result.rows,
					loading: false
				})
			);
		
		});
		/* 
		setTimeout(() => {
		let result = this.getData(pageNumber, pageSize);
		this.setState(Object.assign({}, result, {
			data: result.rows,
			loading: false
		}))
		}, 1000);
		*/
	}
	getData(pageNumber, pageSize) 
	{  
		var res=null;
		var data={
			my_custome_param:"123",
			page: pageNumber,
			rows:pageSize
		};

		$.ajax
		({
			url:'/easyUI/queryJsonData',
			type:"POST",
			dataType:"json",
			async:false,
			data:data, 
			success:function(response)
			{
				res=response;				
			},error:function( jqXHR,   textStatus,   errorThrown ) 
			{ 
				alert('error,'+errorThrown);
			}
		});
		return res; 
	}
  
	handlePageChange(event) {//onPageChange 参应的事件 event做函数参数，有属性pageNumber,pageSize
		this.loadPage(event.pageNumber, event.pageSize)
	}
	render() {
		return (
		<div>
		<h2>Pagination - Lazy Load</h2>
		<div style={{ marginBottom: 10 }}>
			<Label htmlFor="c1">Pager on: </Label>  {/* htmlFor ,inputId */}
			<ComboBox inputId="c1" style={{ width: 120 }}
			data={this.state.options}
			editable={false}
			panelStyle={{ height: 'auto' }}
			value={this.state.pagePosition}
			onChange={(value) => this.setState({ pagePosition: value })}
			/>
		</div>
		<DataGrid
			style={{ height: 250 }}
			pagination //出现属性即可,prop的键可无值,默认为true?
			lazy
			{...this.state}
			onPageChange={this.handlePageChange.bind(this)}

			//行内编辑
			//clickToEdit //单击
			dblclickToEdit

			//selectionMode="cell"
			//editMode="cell"
			selectionMode="row"//默认是row
			editMode="row"
		>
				<GridColumn field="id" title="id"></GridColumn>
				<GridColumn field="username" title="Name"
					editable
					//下面可不加，有时报警告
					editor={({ row }) => (
							<TextBox value={row.username} ></TextBox>
						)}
				></GridColumn>
				<GridColumn field="hobby" title="hobby" align="right"
					editable
					editor={({ row }) => (
						<ComboBox value={row.hobby} 
							data={[{ value: "F", text: "Football" },
								{ value: "B", text: "Basketball" }]} >
						</ComboBox>
					)}
				></GridColumn>
				<GridColumn field="salary" title="salary" align="right"
					editable
					editor={({ row }) => (
					<NumberBox value={row.salary} precision={1}></NumberBox>
					)}
				 ></GridColumn>
				<GridColumn field="isMan" title="isMan" align="center"
					header={() => <span>[isMan是强转String]</span>}
					render={({ row }) => (
					<div style={{ padding: '4px 0' }}>
						<div style={{ fontSize: 20,color:'red' }}>isMan={String(row.isMan)}</div> 
					</div>
					)}
					editable
					editor={({ row }) => (
					//<SwitchButton value={row.man}></SwitchButton>
					<CheckBox checked={row.man}></CheckBox>
					)} 
				 ></GridColumn>
				<GridColumn field="birthday" title="birthday"></GridColumn>
		</DataGrid>
		</div>
    	);
	}
}
 
export default App;
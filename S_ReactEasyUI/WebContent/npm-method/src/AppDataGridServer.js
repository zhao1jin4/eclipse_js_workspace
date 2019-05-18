import React from 'react';
import logo from './logo.svg';
import './App.css';

import { DataGrid, GridColumn, ComboBox, Label } from 'rc-easyui';
import $ from  'jquery'
class App extends React.Component {
  
  constructor(props) {
    super(props);
    this.state = {
      total: 0,
      pageNumber: 1,
      pageSize: 20,
      data: [],
      loading: false,
      pagePosition: "bottom",
      options: [
        { value: "bottom", text: "Bottom" },
        { value: "top", text: "Top" },
        { value: "both", text: "Both" }
      ]
    }
   } 
  componentDidMount() {
    this.loadPage(this.state.pageNumber, this.state.pageSize)
  }
  loadPage(pageNumber, pageSize) {
    this.setState({ loading: true })
     var that=this;
    //var data = "answer=42&name=lisi";  //POST,"Content-Type": "application/x-www-form-urlencoded",服务端request可以的 
    var data = new URLSearchParams();//也可以
    data.set("my_custome_param",123);
    data.set("page",pageNumber);
    data.set("rows",pageSize); 
    fetch('/easyUI/queryJsonData', 
    { method: "POST",
      body:data
    }
    ).then(response => 
      response.json()//如debug报body stream is locked
    ).then(function(result) { 
      console.log(result);
      console.log(result.rows); 
      //这里不能调用 this.setState 
      that.setState(Object.assign({}, result, {
        data: result.rows,
        loading: false
      }));
      
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
  getData(pageNumber, pageSize) {  
    
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
  handlePageChange(event) {
    this.loadPage(event.pageNumber, event.pageSize)
  }
  render() {
    return (
      <div>
        <h2>Pagination - Lazy Load</h2>
        <div style={{ marginBottom: 10 }}>
          <Label htmlFor="c1">Pager on: </Label>
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
          pagination
          lazy
          {...this.state}
          onPageChange={this.handlePageChange.bind(this)}
        >
       {/* 
              <GridColumn field="inv" title="Inv No"></GridColumn>
              <GridColumn field="name" title="Name"></GridColumn>
              <GridColumn field="amount" title="Amount" align="right"></GridColumn>
              <GridColumn field="price" title="Price" align="right"></GridColumn>
              <GridColumn field="cost" title="Cost" align="right"></GridColumn>
              <GridColumn field="note" title="Note"></GridColumn>
          */}       
              <GridColumn field="id" title="id"></GridColumn>
              <GridColumn field="username" title="Name"></GridColumn>
              <GridColumn field="hobby" title="hobby" align="right"></GridColumn>
              <GridColumn field="salary" title="salary" align="right"></GridColumn>
              <GridColumn field="isMan" title="isMan" align="right"></GridColumn>
              <GridColumn field="birthday" title="birthday"></GridColumn>
             
        </DataGrid>
      </div>
    );
  }
}
 
export default App;
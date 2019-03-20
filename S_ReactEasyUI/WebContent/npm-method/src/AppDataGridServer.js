    import React from 'react';
    import logo from './logo.svg';
    import './App.css';
    import $ from  'jquery'
    import { DataGrid, GridColumn, ComboBox, Label } from 'rc-easyui';
     
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
        setTimeout(() => {
          let result = this.getData(pageNumber, pageSize);
          this.setState(Object.assign({}, result, {
            data: result.rows,
            loading: false
          }))
        }, 1000);
      }
      getData(pageNumber, pageSize) {
    	  /*
        let total = 100000;
        let data = [];
        let start = (pageNumber - 1) * pageSize;
        for (let i = start + 1; i <= start + pageSize; i++) {
          let amount = Math.floor(Math.random() * 1000);
          let price = Math.floor(Math.random() * 1000);
          data.push({
            inv: "Inv No " + i,
            name: "Name " + i,
            amount: amount,
            price: price,
            cost: amount * price,
            note: "Note " + i
          });
        }
        return {
          total: total,
          pageNumber: pageNumber,
          pageSize: pageSize,
          rows: data
        };*/
      var res=null;
	  $.ajax
		({
			url:'/easyUI/queryJsonData',
			type:"POST",
		    dataType:"json",
		    async:false,
			data:{
		        my_custome_param:"123",
		        page: pageNumber,
		        rows:pageSize
			}, 
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
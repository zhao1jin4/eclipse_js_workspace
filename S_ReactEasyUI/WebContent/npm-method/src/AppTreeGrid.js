import './App.css';

import React from 'react';
import { TreeGrid, GridColumn } from 'rc-easyui';
 
class App extends React.Component {
  constructor() {
    super();
    this.state = {
      data: this.getData()
    }
  }
  getData() {
    return [
      {
        id: 1,
        name: "C",
        size: "",
        date: "02/19/2010",
        children: [
          {
            id: 2,
            name: "Program Files",
            size: "120 MB",
            date: "03/20/2010",
            children: [
              {
                id: 21,
                name: "Java",
                size: "",
                date: "01/13/2010",
                state: "closed",
                children: [
                  {
                    id: 211,
                    name: "java.exe",
                    size: "142 KB",
                    date: "01/13/2010"
                  },
                  {
                    id: 212,
                    name: "jawt.dll",
                    size: "5 KB",
                    date: "01/13/2010"
                  }
                ]
              },
              {
                id: 22,
                name: "MySQL",
                size: "",
                date: "01/13/2010",
                state: "closed",
                children: [
                  {
                    id: 221,
                    name: "my.ini",
                    size: "10 KB",
                    date: "02/26/2009"
                  },
                  {
                    id: 222,
                    name: "my-huge.ini",
                    size: "5 KB",
                    date: "02/26/2009"
                  },
                  {
                    id: 223,
                    name: "my-large.ini",
                    size: "5 KB",
                    date: "02/26/2009"
                  }
                ]
              }
            ]
          },
          {
            id: 3,
            name: "eclipse",
            size: "",
            date: "01/20/2010",
            children: [
              {
                id: 31,
                name: "eclipse.exe",
                size: "56 KB",
                date: "05/19/2009"
              },
              {
                id: 32,
                name: "eclipse.ini",
                size: "1 KB",
                date: "04/20/2010"
              },
              {
                id: 33,
                name: "notice.html",
                size: "7 KB",
                date: "03/17/2005"
              }
            ]
          }
        ]
      }
    ];
  }
  render() {
    return (
      <div>
        <h2>Basic TreeGrid</h2>
        <TreeGrid 
          style={{ height: 250 }}
          data={this.state.data}
          idField="id"
          treeField="name"
        >
          <GridColumn field="name" title="Name"></GridColumn>
          <GridColumn field="size" title="Size"></GridColumn>
          <GridColumn field="date" title="Date"></GridColumn>
        </TreeGrid>
      </div>
    );
  }
}
 
export default App
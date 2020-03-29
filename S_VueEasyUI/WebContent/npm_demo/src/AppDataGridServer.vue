<template>
    <div>
        <h2>Pagination - Lazy Load</h2>
        <div style="margin-bottom:10px">
            <Label for="c1">Pager on: </Label>
            <ComboBox inputId="c1" style="width:120px"
                    :data="pageOptions" 
                    v-model="pagePosition" 
                    :editable="false"
                    :panelStyle="{height:'auto'}">
            </ComboBox>
        </div>
        <DataGrid style="height:250px"
                :pagination="true"
        :lazy="true"
                :data="data"
                :total="total"
        :loading="loading"
        :pageNumber="pageNumber"
                :pageSize="pageSize"
                :pagePosition="pagePosition"
        @pageChange="onPageChange($event)"

		:dblclickToEdit="true"  editMode="row"  
		> <!-- 
			:clickToEdit="true"  selectionMode="cell" editMode="cell"
		 -->
            <GridColumn field="id" title="id"  ></GridColumn>
            <GridColumn field="username" title="Name"
				:editable="true" :editRules="['required']" > <!--,'length[3,15]'-->
			</GridColumn>
            <GridColumn field="hobby" title="hobby" align="right" 
			:editable="true"> 
				<template slot="edit" slot-scope="scope">
					<ComboBox  v-model="scope.row.hobby" 
						:data='[{ value: "F", text: "Football" },
								{ value: "B", text: "Basketball" }]'></ComboBox>
				</template> 
			</GridColumn>
            <GridColumn field="salary" title="salary" align="right"
			:editable="true" editRules="required"
			>
				<template slot="edit" slot-scope="scope">
					<NumberBox v-model="scope.row.salary" :precision="1"></NumberBox>
				</template>
			</GridColumn>
            <GridColumn field="isMan" title="isMan" align="right"  :editable="true">
				<template slot="body" slot-scope="scope">
					{{scope.row.isMan ? '男' : '女'}}
				</template>
				<template slot="edit" slot-scope="scope">
					<SwitchButton v-model="scope.row.isMan" style="max-width:80px" onText="true" offText="false"></SwitchButton>
				</template>
			</GridColumn>
            <GridColumn field="birthday" title="birthday"></GridColumn>
        </DataGrid>
    </div>
</template>
 
<script>
var ctx="/api"
export default {
  data() {
    return {
      total: 0,
      pageNumber: 1,
      pageSize: 20,
      data: [],
      loading: false,
      pagePosition: "bottom",
      pageOptions: [
        { value: "bottom", text: "Bottom" },
        { value: "top", text: "Top" },
        { value: "both", text: "Both" }
      ]
    };
  },
  created() {
    this.loadPage(this.pageNumber, this.pageSize);
  },
  methods: {
    onPageChange(event) {
      this.loadPage(event.pageNumber, event.pageSize);
    },
    loadPage(pageNumber, pageSize) {
	  this.loading = true;
	  
	  var that=this;
	  //这时 Content-Type默认为 text/plain;charset=UTF-8 要修改为  application/x-www-form-urlencoded 
		var data = "page="+pageNumber+"&rows=20&my_custome_param=123"; 
		//方式二 		 
		// var data = new URLSearchParams();  // Content-Type默认为 application/x-www-form-urlencoded
		// data.set("my_custome_param",123);
		// data.set("page",pageNumber);
		// data.set("rows",pageSize); 
		 
		fetch(ctx+'/easyUI/queryJsonData', 
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
			 that.data = result.rows;
			that.total = result.total;
			//that.pageNumber = result.pageNumber; 
			
			 that.loading = false;
		
		}).catch(error => 
			console.error(error)
		); 

    },
    
  }
};
</script>
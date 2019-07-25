/*db.collection.update(
                      <query>,
                      <update>, //可用 $set 加列(设置新值),$unset删列,$inc,
                      {
                        upsert: <Boolean>, //默认是false,当true时,如果查询条件没有document找到时建立新的document
                        multi: <Boolean>, //默认是false ,当true时, 更新多个 documents 
                      }
                    )
					
                    */
db.stu.update({name:"wang8"},{name:"wang1"})  //如原来有 age,只样改会丢失age
db.stu.update({name:"wang88"},{$set:{age:22}}) //这样不丢失原来
db.stu.update({name:"wang1"},{name:"wang0"},false)//默认只更新一行
db.stu.update({name:"wang77"},{name:"wang88"})//默认更新不到,不新增
db.stu.update({name:"wang77"},{name:"wang88"},true)
db.stu.update({name:"wang88"},{$inc:{age:3} })


db.stu.update({name:"wang88"},{$unset:{age:true}})//删字段

db.stu.update({name:"wang88"},{$push:{ post:33 }})//数组增加元素,(可以数组里即有元素又有子数组,太灵活反而不好)
db.stu.update({name:"wang88"},{$pop:{ post:1 }})//数组删除最后一个元素 ,-1第一个
db.stu.update({name:"wang88"},{$pushAll:{ post:[44,55] }})
db.stu.update({name:"wang88"},{$addToSet:{ post: 44  }})  //不加重复
db.stu.update(	{name:"wang88"},
				{ 
					$addToSet:	{ post: {$each: [11,22,33]} }
				}
			 )

db.stu.update({name:"wang88"},{$pull:{ post:55 }})//数组删除 值为44的值
db.stu.update({name:"wang88"},{$pullAll:{ post:[44,55] }})//数组删除  值为44 ,55 的多个值

db.stu.update({name:"wang88"},{$rename:{  post :"postNew" }}) //修改字段名

db.stu.update({name:"wang88"},{$pullAll:{ post:[44,55] }})//数组删除  值为44 ,55 的多个值
 



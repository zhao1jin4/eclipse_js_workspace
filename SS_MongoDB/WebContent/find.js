


for(var i=0;i<10;i++) db.stu.insert ({name :"wang"+i,age:10+i}) ;
db.stu.find().sort({name:-1});  //降序
db.stu.find().skip(3).limit(5); 
db.stu.find().sort({Page:-1}).skip(3).limit(5).count(false);   //count参数默认false ，不看前面的条件，true看前面条件
db.stu.update({name:"lisi"} ,{post:[1,2,3,4,5]} ) ;
db.stu.find({post:{$all:[3,5]}}) ;
db.stu.find({age:{$mod:[4,2]}}) ;
db.stu.find({post:{$in:[3,6]}}) ;
db.stu.find({
		$or:[	
		     	{name:"lisi"} ,
		     	{age:{$gt:18}}
		     ]
	}) ;

db.stu.find({post:{$size:4}}) ;
	
db.stu.find({name:/wang*/i})  ; // 正则表达式
db.stu.distinct("name");

db.stu.insert({name:"lisi1" ,skill:[{name:"math"},{name:"english"}]} ) ;
db.stu.find({"skill.name":"math"} ) ;
db.stu.find({ 
		skill:{$elemMatch:{name:"math"}}
	}) ;


var cur=db.stu.find().skip(3).limit(5); 
cur.forEach(function(x){print(tojson(x))});
while(cur.hasNext()){
	print(tojson(cur.next()));
}

db.stu.find({},{post:{$slice:2}}) //要find第二个参数中，对数组，前2个，-1最后一个

db.stu.find({},{post:{$slice:[2,1]}})   //SKIP 2 个,len1个 

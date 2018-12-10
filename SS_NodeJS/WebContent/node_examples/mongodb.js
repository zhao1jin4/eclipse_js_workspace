//npm install -g mongodb //安装为一个全局使用的模块,设置NODE_PATH环境变量为C:\Users\zh\AppData\Roaming\npm\node_modules
//npm install mongodb   //在线安装到当前目录,当前js文件同目录下要有node_modules\mongodb 

/*
var mongodb = require('mongodb');
 var server = new mongodb.Server('localhost',27017,{auto_reconnect:true});
 var db = new mongodb.Db('test',server,{safe:true});
 db.open(function(err,db){
    if(!err)
    { 
        console.log('connect');
    }else{
        console.log(err);
    } 
 
 });
*/
 
//-----
 
 var MongoClient = require('mongodb').MongoClient
 , format = require('util').format;    

MongoClient.connect('mongodb://127.0.0.1:27017/test', function(err, db) 
{
	if(err)
		throw err;

	 var collection = db.collection('test_insert');
	 /*
	 collection.insert({a:2}, function(err, docs)
	 {
		   collection.count(function(err, count) 
			{
			   console.log(format("count = %s", count));
			});
		
		   // Locate all the entries using find
		   collection.find().toArray(function(err, results) 
			{
			   console.dir(results);
			   //db.close();
		   });      
	 });
	 */
	 //----
	 var idString = '52281c394b20e9c400000001';
	  var ObjectID = require('mongodb').ObjectID;
	  collection.find({_id: new ObjectID(idString)}).toArray(function(err, results) 
		{
		   console.dir(results);
		  // db.close();
	   });      
	  
	  //---
	  collection.update({name: 'lisi'}, {$set: {name: 'wang'}}, {upsert:true,multi:true }, function(err)
		{
	      if (err) 
	    	  console.warn(err.message);
	      else
	    	  console.log('successfully updated');
	    });
	  //---第二个参数是排序
	  collection.findAndModify({a: 88}, [['_id','asc']], {$set: {hi: 'there'}}, {upsert:false}, function(err, object) {
	      if (err) console.warn(err.message);
	      else console.dir(object);  // undefined if no matching object exists.
	    });
	  
});



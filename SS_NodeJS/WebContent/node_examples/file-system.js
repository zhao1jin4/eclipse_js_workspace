 
 //回调
//read
var fs = require('fs');
fs.open('d:/temp/test.txt','r',function(err,fd)//异步
{
	if(err) 
		 throw err;
	var readBuff = new Buffer(1024),
	bufferOffset = 0,
	bufferLen = readBuff.length,
	position = 0;
	fs.read(fd,readBuff,bufferOffset,bufferLen,position,function(err,bytesRead,buffer)
	{
		if(err) 
			throw err;
		if(bytesRead)
		  console.log(buffer.toString('utf8',0,bytesRead));
		fs.close(fd,function(err)
		{
		  console.log('Now,close file...' + [fd]);
		});
	});  
});

//write
 
fs.open('d:/temp/test.txt','a',function(err,fd)
{
	if(err)
		throw err;
	cTime = new Date();
	cTime = cTime.getFullYear()+"-"+cTime.getMonth();
	var wBuff = new Buffer('Start log: ' + cTime + "\r\n");
	buffPos = 0;
	buffLen = wBuff.length;
	filePos = 0;

	fs.write(fd,wBuff,buffPos,buffLen,filePos,function(err,wbytes,data)
	{
		if(err)
			throw err;
		console.log('wrote ' + wbytes + ' bytes');
		fs.close(fd);
	});
});
 


//-Buffer
var str = 'node.js,您好';
var len = str.length;
buf = new Buffer(len);
buf.write(str,'utf8');
console.log("-------Buffer中文内容:"+buf.toString('utf8',0,len)); //GBK的windows中文不显示???

 
var fs = require('fs');
fs.readFile('d:/temp/test.txt',function(err,data)
{
  if(err) 
	throw err;
  console.log("-------"+data.toString());
});
 
//带事件
var fs = require('fs');
var opt = {
  flags:'r',
  encoding:'utf8',
  fd:null,
  mode:0666,
  bufferSize:64 * 1024,
  start:0,
  end:99
};
st = fs.createReadStream('d:/temp/test.txt',opt);
//st.pause();//暂停data事件的触发
//st.resume();//恢复data事件
var text = "";
st.on('data',function(data){
  text += data;
});
st.on('end',function(close){
  console.log("reading 99 bytes:\n" + text);
});
st.on('error',function(error){
  console.log('An error occurred:' + error);
});
st.on('close',function(){
  console.log('The file descriptor has been closed.');
});
st.on('open',function(fd){
  console.log('Current fd number: ' + fd);
});



var fs = require('fs');
var stream = fs.createWriteStream(__dirname + '/out.txt');
var str = 'i=[';
for (var i=0;i<10;i++){
  stream.write(str + i + ']\r\n');
}
stream.end('this is the end\n');//写最后一行
stream.on('finish', function() {
  console.error('all writes are now complete.');
});
 


 

//---pipe
var fs = require('fs');
var writeStream = fs.createWriteStream('./out.txt',{ flags:'w'});
var readStream = fs.createReadStream('d:/temp/test.txt');
 
readStream.pipe(writeStream);
writeStream.on('close',function(){
    console.log('All done!');
});

writeStream.on('error',function(error){
  console.log('An error occurred:' + error);
});
 







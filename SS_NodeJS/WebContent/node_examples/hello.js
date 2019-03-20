//分号也可没有

//console.log(console)//有warn,error
//console.log(process.env); //系统环境变量
//console.dir(process)//显示process对象,有很多信息

console.log(process.version);
console.log(process.platform);//什么系统平台
console.log(process.argv);  //命令行参数
var args = process.argv
for(var i=0;i<args.length;i++) {
  console.log("arg%d : %s",i,args[i])//0是node命令 1是js文件
}


var c = require('./circle.js');//在同一目录下OK

var myObject=new c("lisi",25);//针对 module.exports = 
console.log(myObject.about());
//---上下二先一
//console.log(c.perimeter(5));//针对 exports.perimeter =
//console.log(c.name());//针对module.exports.name =



var events = require('events');
var emitter = new events.EventEmitter();
emitter.on('buyTicket',function(from,to){
  console.log('Buy ticket: ' + 'From ' + from + ' To ' + to);
});
emitter.on('error',function(err){//error事件如不做处理默认显示错误退出
  console.log('Error:' + err);
});
 emitter.emit('buyTicket','Shenzhen','Changsha');

 
//--继承 inherits call 
var util = require("util"); //导入util模块
var events = require("events"); //导入events模块
function MyStream() {
    events.EventEmitter.call(this);//call方法使得MyStream对象继承了EventEmitter对象上的方法
}
util.inherits(MyStream, events.EventEmitter);//使用inherits方法
MyStream.prototype.write = function(data) {//MyStream对象扩展了一个write方法，它可以使用emit触发事件
    this.emit("data", data);
}
var stream = new MyStream();//构建一个stream对象
console.log(stream instanceof events.EventEmitter);//判断stream对象是不是EventEmitter对象的实例，这里为true
console.log(MyStream.super_ === events.EventEmitter);//MyStream的父类是不是EventEmitter，这里为true
stream.on("data", function(data) {//stream调用了继承过来的on方法，定义了一个'data'事件并安装了一个监听器
    console.log('Received data: "' + data + '"');
})
stream.write("It works!"); //调用stream对象的write方法，结果：Received data: "It works!"

//---继承 类调用 call 
/*
function Animal(name){     
    this.name = name;     
    this.showName = function(){     
         console.log(this.name);     
    }     
}     
function Cat(name){   
    Animal.call(this, name);//在Cat构造函数内部，使用Animal.call,这样Cat构造函数的实例就拥有了Animal类中定义的方法
}     
var cat = new Cat("Black Cat");    
cat.showName();//Cat本身没有showName方法，但通过call继承了Animal中的showName方法
 */
//-----------同名,要选一
//--继承 方法调用 call
function Animal(){
    this.name = "Animal";
    this.showName = function(){
         console.log(this.name);     
    }
}
function Cat(){
    this.name = "Cat";
}
 
var animal = new Animal();
var cat = new Cat();
 
animal.showName.call(cat,",");//在animal对象的showName方法上应用call，并用cat对象替换了animal中this对象，

//--继承inherits
util = require('util');
var EventEmitter = require('events').EventEmitter;
 
var MyClass = function(){
//创建一个空的MyClass对象
}
util.inherits(MyClass,EventEmitter);
//让MyClass继承EventEmitter
 
MyClass.prototype.someMethod = function(arg1,arg2){
//扩展一个私有的someMethod方法,这个方法必须在inherits之后，否则会被覆盖
  this.emit("event1",arg1,arg2);
};
 
var myObj = new MyClass();
myObj.on('event1', function(arg1,arg2) {
  console.log('emit event: arg1->%s and arg2->%s',arg1,arg2);
});
 
myObj.someMethod('one','two');


//-----path
var path = require('path');

var nor = path.normalize('F:\\wamp\\www\\Node\\.');
console.log(nor);//输出：F:\wamp\www\Node

var jo = path.join('F:\\','wamp','\\www','\\Node','\\.');
console.log(jo);//输出：F:\wamp\www\Node

var res = path.resolve('F:\\wamp\\www\\Node','./Test');
console.log(res);//输出：F:\wamp\www\Node\Test

var res = path.resolve('www','Node');//以当前目录所在的路径为起点
console.log(res);

var dir = path.dirname('F:\\wamp\\www\\Node\\normalize.js');
console.log(dir);//输出：F:\wamp\www\Node

var base = path.basename('F:\\wamp\\www\\Node\\normalize.js');
console.log(base);//输出：normalize.js

var base = path.basename('F:\\wamp\\www\\Node\\normalize.js','.js');
console.log(base);//输出：normalize

var ext = path.extname('F:\\wamp\\www\\Node\\normalize.js');
console.log(ext);//输出：.js

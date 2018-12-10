"use strict"; //整个脚本文件开启严格模式，需要在所有语句之前放
//早期都是 相反的  Sloppy mode  懒散的，草率的

//给不可写属性赋值
var obj1 = {};
Object.defineProperty(obj1, "x", { value: 42, writable: false });

try {
	obj1.x = 9; // 抛出TypeError错误
} catch (e) {
  console.log(e); 
}
//给只读属性赋值
var obj2 = { get x() { return 17; } };
try {
	obj2.x = 5; // 抛出TypeError错误
} catch (e) {
  console.log(e); 
}


//给不可扩展对象的新属性赋值
var fixed = {};
Object.preventExtensions(fixed);
try {
	fixed.newProp = "ohai"; // 抛出TypeError错误
} catch (e) {
  console.log(e); 
}

try {
  Object.defineProperty(fixed, 'property1', {
    value: 42
  });
} catch (e) {
  console.log(e); 
}



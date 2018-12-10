/*
import  * as circle from 'circle';
//import  circle from 'circle';

console.log("圆面积：" + circle.area(4));
console.log("圆周长：" + circle.circumference(14));

*/
/*
//https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Statements/import
import { getUsefulContents } from 'mymodules/file.js';

getUsefulContents('http://www.baidu.com',
    data => { console.log(data); });
*/


import { cube, foo, graph } from 'my-module';
graph.options = {
    color:'blue',
    thickness:'3px'
}; 
graph.draw();
console.log(cube(3)); // 27
console.log(foo);    // 4.555806215962888

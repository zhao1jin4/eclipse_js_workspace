/* OK    */ 
import  {area,circumference} from './circle.js';//测试下来  必须以./或../ 或/开头，必须以.js结尾
console.log("圆面积：" + area(4));
console.log("圆周长：" + circumference(14));

/* OK */
 import  * as circle from './circle.js'; //文件中间也可使用import
 console.log("圆面积：" + circle.area(4));
 console.log("圆周长：" + circle.circumference(14));
 

 /* OK */
 import myDefault,{ cube, foo, graph } from './my-module.js';//文件中只一个default,导入要放在最前面,这里可以改名
 graph.options = {
     color:'blue',
     thickness:'3px'
 }; 
 graph.draw();
 console.log(cube(3)); // 27
 console.log(foo);    // 4.555806215962888
 console.log(myDefault);
 
/* OK  */
import m from './def.js'//因文件中只一个default这里可以改名
console.log(m);

 /* OK */
 //https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Statements/import
 import { getUsefulContents } from './file.js';
 getUsefulContents('../jsonGet',
     data => { console.log(data); });
 
 
/* 
//动态import，只对Chrome有效，Firefox不行
//https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/import
let filename = 'circle.js';  
import('./' + filename). then(module =>{
    console.log(module);
}).catch(err => {
    console.log(err.message); 
});
*/ 




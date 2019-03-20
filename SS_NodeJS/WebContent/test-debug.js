/*
node --inspect test-debug.js  监听9229 端口
 chrome地址栏输入 chrome://inspect/ -> 可以看到运行的文件，点击进入
   -> Source标签-> +add Folder to workspace 选择源码目录，就可以调试了
*/

//var sys = require('sys');//sys is deprecated. Use util instead.
var util = require('util');
// 此乃计数器变量，Suspend（中断挂起）期间可以观察该变量的变化。
var count = 0;
//sys.debug("开始进行调试……");//util.debug is deprecated. Use console.error instead
console.error("开始进行调试……");
function timer_tick() {
    count++;
    console.error("计数器：" + count);
    if (count === 10) {
        count += 1000;
        console.error("能在这里打点吗？错过10后不行啦");
    }
    setTimeout(timer_tick, 1000);
}
timer_tick();
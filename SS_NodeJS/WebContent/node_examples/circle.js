
module.exports = function(name, age) {
    this.name = name;
    this.age = age;
    this.about = function() {
        console.log(this.name +' is '+ this.age +' years old');
    };
};//如加module.exports=function 下面的exports.perimeter= 和 module.exports.name =就不能被使用了
 //---
module.exports.name = function() {
    console.log('the name function');
};
//exports是module.exports的别名，如果一个新的值被赋值给 exports，它就不再绑定到 module.exports
var PI = 3.14;
exports.perimeter = function (r){
    return 2 * PI * r;
};
exports.area = function (r){
    return PI * r * r;
};
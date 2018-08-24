var PI = 3.14;
exports.perimeter = function (r){   //exports对象加暴露的方法
    return 2 * PI * r;
};
exports.area = function (r){
    return PI * r * r;
};
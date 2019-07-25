
//------ Symbol 是ECMAScript 6 中新增的数据类型
//是一种基本数据类型
console.log(Symbol("foo") === Symbol("foo"));  //false

var sym = Symbol(); //不能使用 new
console.log(typeof sym);//"symbol"
var symObj = Object(sym); 
console.log(typeof symObj); // "object"
//1. 用方括号添回
var a = {};
a[sym] = 'abc';
//2. 在对象内部定义
var a = {
[sym]: 'abc'
};
//3. 用defineProperty添加
var a = {};
Object.defineProperty(a, sym, { value: 'abc' });

var ownSymbolArrasy=Object.getOwnPropertySymbols(a); 
console.log(ownSymbolArrasy);

console.log(Symbol('desc').description);
// expected output: "desc"

console.log(Symbol.iterator.description);//Symbol.iterator是内建的Symbol
// expected output: "Symbol.iterator"

console.log(Symbol.for('foo').description);//Symbol.for() 方法和  Symbol.keyFor() 方法从全局的symbol注册
// expected output: "foo"

console.log(Symbol('foo').description + 'bar');
// expected output: "foobar"


var globalSym = Symbol.for('foo'); // create a new global symbol
console.log(Symbol.keyFor(globalSym)); // "foo" 



var myIterable = {}//让对象可被迭代
myIterable[Symbol.iterator] = function* () {
    yield 1;
    yield 2;
    yield 3;
};

for(let value of myIterable) { //要可迭代必须要有方法名 Symbol.iterator，按要求实现
    console.log(value);
}
// 1
// 2
// 3

//正则表达式 symbols,Symbol.match,Symbol.replace,Symbol.search,Symbol.split
const regexp1 = /foo/;  
regexp1[Symbol.match] = false; //正则当字串
console.log('/foo/'.startsWith(regexp1)); // true
console.log('/baz/'.endsWith(regexp1)); // false


var paragraph = 'The quick brown fox jumped over the lazy dog. It barked.';
var regex = /[A-Z]/g;
var found = paragraph.match(regex);

console.log(found);
// expected output: Array ["T", "I"]

class Search1 {
  constructor(value) {
    this.value = value;
  }
  [Symbol.search](string) { 
    return string.indexOf(this.value);//string=foobar,this.value=bar
  }
}
console.log('foobar'.search(new Search1('bar')));
//3

var paragraph = 'lazy dog. really lazy?'; 
var regex = /[^\w\s]/g;
console.log(paragraph.search(regex));//输出下标
// expected output: 8
console.log(paragraph[paragraph.search(regex)]);
// expected output: "."
 

class Replace1 {
  constructor(value) {
    this.value = value;
  }
  [Symbol.replace](string) {
    return `s/${string}/${this.value}/g`;
  }
}

console.log('foo'.replace(new Replace1('bar')));
// expected output: "s/foo/bar/g"


class Split1 
{
  constructor(value) 
  {
    this.value = value;
  }
  [Symbol.split](string)
  {
    var index = string.indexOf(this.value);
    var res= this.value + string.substr(0, index) + "/"
    		+ string.substr(index + this.value.length);
    return res;
   
  }
}

console.log('foobar'.split(new Split1('foo')));
// expected output: "foo/bar"


//其他 symbols,Symbol.hasInstance ,Symbol.isConcatSpreadable,Symbol.unscopables,Symbol.toPrimitive,Symbol.toStringTag,Symbol.species
class Array1 
{
  static [Symbol.hasInstance](instance) 
  {
    return Array.isArray(instance);
  }
} 
console.log([] instanceof Array1);
// expected output: true


const alpha = ['a', 'b', 'c'];
const numeric = [1, 2, 3];
let alphaNumeric = alpha.concat(numeric);
console.log(alphaNumeric);
// expected output: Array ["a", "b", "c", 1, 2, 3]
numeric[Symbol.isConcatSpreadable] = false;
alphaNumeric = alpha.concat(numeric);
console.log(alphaNumeric);
// expected output: Array ["a", "b", "c", Array [1, 2, 3]]


const object1 = {
  property1: 42
};
 
object1[Symbol.unscopables] = {
  property1: true
};
 
with (object1) {
  //console.log(property1);
  // expected output: Error: property1 is not defined
}


//An object without Symbol.toPrimitive property.
var obj1 = {};
console.log(+obj1);     // NaN
console.log(`${obj1}`); // "[object Object]"
console.log(obj1 + ''); // "[object Object]"

// An object with Symbol.toPrimitive property.
var obj2 = {
  [Symbol.toPrimitive](hint) {
    if (hint == 'number') {
      return 10;
    }
    if (hint == 'string') {
      return 'hello';
    }
    return true;
  }
};
console.log(+obj2);     // 10        -- hint is "number"
console.log(`${obj2}`); // "hello"   -- hint is "string"
console.log(obj2 + ''); // "true"    -- hint is "default"

//Object.prototype.toString=函数 重写toString()
//Object.prototype.toString.call 检测对象类
console.log(Object.prototype.toString.call('foo'));     // "[object String]"
console.log(Object.prototype.toString.call([1, 2]));    // "[object Array]"
console.log(Object.prototype.toString.call(3));         // "[object Number]"
console.log(Object.prototype.toString.call(true));      // "[object Boolean]"
console.log(Object.prototype.toString.call(new Map()));       // "[object Map]"
console.log(Object.prototype.toString.call(function* () {})); // "[object GeneratorFunction]"
console.log(Object.prototype.toString.call(Promise.resolve())); // "[object Promise]"
class ValidatorClass {
  get [Symbol.toStringTag]() { //get 只读属性
    return 'Validator';
  }
}
console.log(Object.prototype.toString.call(new ValidatorClass()));
// expected output: "[object Validator]"
 

class MyArray extends Array {
	  // Overwrite MyArray species to the parent Array constructor
	  static get [Symbol.species]() { return Array; }//instanceof 返回指定类型 ，get 只读属性，static
	}
const myArray = new MyArray(1, 2, 3);
const mapped = myArray.map(x => x * x);

console.log(mapped instanceof MyArray); 
//expected output: false

console.log(mapped instanceof Array);
//expected output: true


//---- apply方法  Function​.prototype​.apply() 
//call()方法的作用和 apply() 方法类似，区别就是call()方法接受的是 argument 列表，而apply()方法接受的是一个数组。
var numbers = [5, 6, 2, 3, 7];
var max = Math.max.apply(null, numbers);//第一个参数是thisArg，null表示全局对象
console.log(max);// expected output: 7

var array = ['a', 'b'];
var elements = [0, 1, 2];
array.push.apply(array, elements);
console.info(array); // ["a", "b", 0, 1, 2] 
/*
var array2 = [];
var array = ['a', 'b'];
var elements = [0, 1, 2];
array.push.apply(array2, elements);
console.info(array); //'a', 'b'
console.info(array2);//0, 1, 2 结果同 elements
*/



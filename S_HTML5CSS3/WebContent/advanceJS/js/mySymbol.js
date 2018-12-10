
//------ Symbol 是ECMAScript 6 中新增的数据类型
console.log(Symbol("foo") === Symbol("foo"));  //false

var sym = Symbol();
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



console.log(Symbol('desc').description);
// expected output: "desc"

console.log(Symbol.iterator.description);
// expected output: "Symbol.iterator"

console.log(Symbol.for('foo').description);
// expected output: "foo"

console.log(Symbol('foo').description + 'bar');
// expected output: "foobar"


var globalSym = Symbol.for('foo'); // create a new global symbol
console.log(Symbol.keyFor(globalSym)); // "foo" 



var myIterable = {}
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


console.log(Object.prototype.toString.call('foo'));     // "[object String]"
console.log(Object.prototype.toString.call([1, 2]));    // "[object Array]"
console.log(Object.prototype.toString.call(3));         // "[object Number]"
console.log(Object.prototype.toString.call(true));      // "[object Boolean]"

console.log(Object.prototype.toString.call(new Map()));       // "[object Map]"
console.log(Object.prototype.toString.call(function* () {})); // "[object GeneratorFunction]"
console.log(Object.prototype.toString.call(Promise.resolve())); // "[object Promise]"

class ValidatorClass {
  get [Symbol.toStringTag]() {
    return 'Validator';
  }
}

console.log(Object.prototype.toString.call(new ValidatorClass()));
// expected output: "[object Validator]"



class MyArray extends Array {
	  // Overwrite MyArray species to the parent Array constructor
	  static get [Symbol.species]() { return Array; }//创建派生类对象的构造函数
	}
const myArray = new MyArray(1, 2, 3);
const mapped = myArray.map(x => x * x);

console.log(mapped instanceof MyArray); //?????????????
//expected output: false

console.log(mapped instanceof Array);
//expected output: true




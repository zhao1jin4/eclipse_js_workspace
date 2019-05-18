
import logo from './logo.svg';
import './App.css';  
import React, {useState,useEffect} from 'react'; 
 
function App() { //Hook在类中不能工作 （不推荐修改现有的代码，修改为不使用类，但可以新代码使用hook不使用类）可以保存值的函数，函数组件
  const [count, setCount] = useState(0);//useState 返回两参数(pair)，当前状态值和一个函数用于更新值,参数是是初始状态
  //可以再增加useState要保存多个值


  // 等同于 componentDidMount, componentDidUpdate,  componentWillUnmount
  //可用多次使用 useEffect,按照 effect 声明的顺序依次调用
  //useLayoutEffect
  useEffect(() => { 
    document.title = `You clicked ${count} times`;
    //useEffect可选的返回一个无参函数 用于清除，组件卸载的时候执行清除操作
  });

   
  
  return (
    <div>
      <p>You clicked {count} times</p>   {/* 直接用，(符合react的数据变 联动 界面） */}
      <button onClick={() => setCount(count + 1)}>
        Click me
      </button>
    </div>
  );
}
export default App;

 
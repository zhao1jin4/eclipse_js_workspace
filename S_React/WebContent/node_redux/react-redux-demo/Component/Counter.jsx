import React, { Component } from 'react'
import {connect} from 'react-redux';

import {increment,decrement} from '../Redux/Action'

const buttonStyle = {
    margin: "20px"
}

function Counter({caption, Increment, Decrement, value}){
  //caption是props属性,其它3个为下再两函数返回放入props中
    return (
            <div>
                <button style={buttonStyle} onClick={Increment}>+</button>
                <button style={buttonStyle} onClick={Decrement}>-</button>
                <span>{caption} count :{value}</span>
            </div>
        )
}
function mapStateToProps(state,ownProps){//负责输入逻辑，即将state映射到 UI 组件的参数（props）
   return{
        value:state[ownProps.caption]//ownProps 容器组件的props属性 ,caption外部传入
    }
}
function mapDispatchToProps(dispatch,ownProps){//输出逻辑  负责将用户操作转化为Action的,功能函数映射到展示组件的this.props
    return {
        Increment:()=>{
             //dispatch是store的方法
            dispatch(increment(ownProps.caption)) //增加和减少的动作派发给Store
        },
        Decrement:()=>{
            dispatch(decrement(ownProps.caption))
        }

    }
}
//可以省略mapStateToProps参数,store更新就不会触发展示组件重绘了
//第二个参数mapDispatchToProps也可是个对象
export default connect(mapStateToProps,mapDispatchToProps)(Counter)
//connect方法，用于从 UI 组件生成容器组件(带逻辑的)

import React, { Component } from 'react'
import {connect} from 'react-redux';

import {increment,decrement} from '../Redux/Action'

const buttonStyle = {
    margin: "20px"
}

function Counter({caption, Increment, Decrement, value}){
    return (
            <div>
                <button style={buttonStyle} onClick={Increment}>+</button>
                <button style={buttonStyle} onClick={Decrement}>-</button>
                <span>{caption} count :{value}</span>
            </div>
        )
}
function mapStateToProps(state,ownProps){//输入逻辑  负责将通过state获得的数据映射到展示组件的this.props
	//如果省略的话，store更新就不会触发展示组件重绘了   
    return{
        value:state[ownProps.caption]//ownProps 容器组件的props属性 ,caption外部传入
    }
}
function mapDispatchToProps(dispatch,ownProps){//输出逻辑  负责将用户操作转化为Action的功能函数映射到展示组件的this.props
    return {
        Increment:()=>{
            dispatch(increment(ownProps.caption)) //增加和减少的动作派发给Store
        },
        Decrement:()=>{
            dispatch(decrement(ownProps.caption))
        }

    }
}
//第二个参数mapDispatchToProps也可是个对象
export default connect(mapStateToProps,mapDispatchToProps)(Counter)//返回一个新的容器组件，带逻辑的，里面是负责显示的组件



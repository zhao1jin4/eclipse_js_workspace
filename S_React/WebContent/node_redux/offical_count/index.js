import React from 'react'
import ReactDOM from 'react-dom'
import { createStore } from 'redux'

import Counter from './components/Counter'
import counter from './reducers'//如目录下有index.js就可不用加默认导入

const store = createStore(counter) //store里面存储state
const rootEl = document.getElementById('root')

const render = () => ReactDOM.render(
  <Counter
    value={store.getState()}//必须是getState(),相当于react的state,如数据变化,使用的地方会动刷新
    onIncrement={() => store.dispatch({ type: 'INCREMENT' })}//必须命名为type
    onDecrement={() => store.dispatch({ type: 'DECREMENT' })}
  />,
  rootEl
)

render()
store.subscribe(render)

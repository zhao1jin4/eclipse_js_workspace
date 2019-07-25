//reducer函数 state可以是对象，但不能修改这个对象，要返回新的对象
export default (state = 0, action) => {
  switch (action.type) { //必须命名为type
    case 'INCREMENT':
      return state + 1
    case 'DECREMENT':
      return state - 1
    default:
      return state
  }
}

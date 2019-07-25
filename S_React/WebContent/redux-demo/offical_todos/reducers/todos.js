const todos = (state = [], action) => {
  switch (action.type) { //接受事件，返回数组，用于显示
    case 'ADD_TODO':  //add返回数组
      return [
        ...state,
        {
          id: action.id, //有事件中读带的参数
          text: action.text,
          completed: false
        }
      ]
    case 'TOGGLE_TODO': //toggle返回修改对象的数组
      return state.map(todo =>
        (todo.id === action.id)
          ? {...todo, completed: !todo.completed}
          : todo
      )
    default:
      return state
  }
}

export default todos

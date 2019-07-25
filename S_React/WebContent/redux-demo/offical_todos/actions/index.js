let nextTodoId = 0
/*
export const addTodo = text => ({
  type: 'ADD_TODO',
  id: nextTodoId++,
  text
})
*/
//下面是全写方式 
export const addTodo = text =>{
  return {
    type: 'ADD_TODO',
    id: nextTodoId++,
    text:text
  }//发送事件，带自己属性
} 

export const setVisibilityFilter = filter => ({
  type: 'SET_VISIBILITY_FILTER',
  filter
})

export const toggleTodo = id => ({
  type: 'TOGGLE_TODO',
  id
})

export const VisibilityFilters = {
  SHOW_ALL: 'SHOW_ALL',
  SHOW_COMPLETED: 'SHOW_COMPLETED',
  SHOW_ACTIVE: 'SHOW_ACTIVE'
}

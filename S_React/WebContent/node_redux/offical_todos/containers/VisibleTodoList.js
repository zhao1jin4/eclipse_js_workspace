import { connect } from 'react-redux'
import { toggleTodo } from '../actions'
import TodoList from '../components/TodoList'
import { VisibilityFilters } from '../actions'

const getVisibleTodos = (todos, filter) => {
  switch (filter) {
    case VisibilityFilters.SHOW_ALL:
      return todos
    case VisibilityFilters.SHOW_COMPLETED:
      return todos.filter(t => t.completed)
    case VisibilityFilters.SHOW_ACTIVE:
      return todos.filter(t => !t.completed)
    default:
      throw new Error('Unknown filter: ' + filter)
  }
}

const mapStateToProps = state => ({
  todos: getVisibleTodos(state.todos, state.visibilityFilter)//这个返回用于UI组件显示
  //state中两个 todos 和 visibilityFilter(默认是ALL,由三个按钮来改变state,就影响UI) 是 combineReducers函数生产的
})

const mapDispatchToProps = dispatch => ({
  toggleTodo: id => dispatch(toggleTodo(id))//这个用于UI组件的事件
})

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList) //上两个函数产生todos , toggleTodo (props或store),给后面的UI组件用

import { combineReducers } from 'redux'
import todos from './todos'
import visibilityFilter from './visibilityFilter'

// combineReducers
export default combineReducers({
  todos, //全写为todos:todos,
  visibilityFilter
})

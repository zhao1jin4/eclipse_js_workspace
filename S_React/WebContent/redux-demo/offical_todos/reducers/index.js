import { combineReducers } from 'redux'
import todos from './todos'
import visibilityFilter from './visibilityFilter'

// combineReducers
export default combineReducers({
  todos,
  visibilityFilter
})

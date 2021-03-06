import React from 'react'
import PropTypes from 'prop-types'

const Todo = ({ onClick, completed, text }) => ( //表示从props 中取指定变量
  <li
    onClick={onClick}
    style={{
      textDecoration: completed ? 'line-through' : 'none'
    }}
  >
    {text}
  </li>
)
 

export default Todo

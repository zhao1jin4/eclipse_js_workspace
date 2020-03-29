import {createStore} from 'redux'
import reducer from '../Reducer' 
const initValue={
    'First':0,
    'Second':10,
    'Third':20
}
const store=createStore(reducer,initValue)//可带第二个参数，默认状态
export default store

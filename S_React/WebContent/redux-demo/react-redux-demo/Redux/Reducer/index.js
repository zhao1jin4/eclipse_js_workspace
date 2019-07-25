import {Increment,Decrement} from '../Action'
export default(state,action)=>{
    const {counterCaption}=action
    console.log("state[counterCaption]="+state[counterCaption]);//能取到值
    switch (action.type){
        case Increment:
        //return {...state,[counterCaption]:state[counterCaption]+1}//逻辑同下方
        var clonedObj={...state};//复制对象
        clonedObj[counterCaption]= state[counterCaption]+1;
        return clonedObj;
        case Decrement:
        return {...state,[counterCaption]:state[counterCaption]-1}
        default:
        return state
    }
}
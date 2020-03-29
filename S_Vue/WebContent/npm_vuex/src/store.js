import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)
export default new Vuex.Store({
	state: {
		count: 10
	},
	mutations: {
 		increment  (state) {//参数为store中的state
		    state.count++; 
		},
	    incrementByStep (state,step) { //后面为传来的参数
	      state.count+=step 
	    },
		decrement (state) {
			state.count--;
		},
		decrementByStep (state,step) {
			state.count-=step 
		}
	}, 
	actions: //可异步操作,调用 mutations中方法，不能修改state
	{
		incrementAsync ({ commit })  //context里的commit属性
		{  
			setTimeout(() => {
			commit('increment')//context.commit('increment');//是mutations中的方法名
			}, 1000)
		},
		incrementByStepAsync (context,step)  //带参数 
		{  
			setTimeout(() => {
				context.commit('incrementByStep',step) 
			}, 1000)
		}
	},
	getters:{ //只包装store中的数据,不修改,如store中数据变化,这里也变化,类似compute
		formatNumber:function(state)
		{
			return '$'+state.count;
		}
	}
})
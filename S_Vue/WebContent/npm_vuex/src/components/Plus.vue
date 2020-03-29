
<template>
  <div>
     count :{{$store.state.count}} ,mapState count : {{count}},{{countAlias}},{{countPlusLocalState}}
    <button @click="increment">+1</button><button @click="incrementByStep(2)">传参数不行OK</button>
	<br />
	<button @click="addAsync">add Async</button>
	<button @click="addByStepAsync">add by Step Async</button>
	<button @click="aliasAddAsyn">add  use mapActions </button>
	<button @click="incrementByStepAsync(5)">add by Step Async  use mapActions</button>
	<br/>
	mapGetters显示getter的值(computed): {{formatNumber}}
  </div>
</template> 
<script>
import { mapState,mapMutations ,mapActions,mapGetters} from 'vuex' 
export default {
  data() {
    return {};
  },
  computed:{
  	 //如使用自带的eslint报'mapState' is defined but never used 删除package.json 中全部eslint)
	 ...mapState({
		// 箭头函数可使代码更简练
		count: state => state.count, 
		// 传字符串参数 'count' 等同于 `state => state.count`
		countAlias: 'count', 
		// 为了能够使用 `this` 获取局部状态，必须使用常规函数
		countPlusLocalState (state) {
		return state.count + 10
		}
	}),
	//方式二 import { mapGetters } from 'vuex' 只对npm方式
	...mapGetters(['formatNumber']), //formatNumber是store 中 getters中方法名

  }
  /*
  computed: mapState({ //这种写法不能加自己的了 
    // 箭头函数可使代码更简练
    count: state => state.count, 
    // 传字符串参数 'count' 等同于 `state => state.count`
    countAlias: 'count', 
    // 为了能够使用 `this` 获取局部状态，必须使用常规函数
    countPlusLocalState (state) {
      return state.count + 10
    }
  })
  */
 ,
  methods:{
	   //increment:function(){
		//	this.$store.commit('increment',2);//commit的参数是store中mutations的函数名,第二为参数可选
		//}

		//方式二  import { mapMutations } from 'vuex' 只用于npm方式
		 ...mapMutations([
      		'increment', // 将 `this.increment()` 映射为 `this.$store.commit('increment')`
		 	'incrementByStep'//可传参数
		 ]),
		...mapMutations({
			add: 'increment' // 将 `this.add()` 映射为 `this.$store.commit('increment')`
		}), 


		//异步
 		addAsync:function()
		{
			this.$store.dispatch('incrementAsync')//你在组件中使用 ,对应store中actions中的函数
		},
		addByStepAsync:function()
		{
			this.$store.dispatch('incrementByStepAsync',3)//传参数,可为对象
			/*
			//store.dispatch('incrementByStepAsync',3)//组件外使用
			//以对象形式分发
			store.dispatch({
			type: 'incrementByStepAsync',
			amount: 10
			})*/
		},
		 //方式二 import { mapActions } from 'vuex' //只对npm方式
		...mapActions({
			aliasAddAsyn: 'incrementAsync' // 将 `this.aliasAddAsyn()` 映射为 `this.$store.dispatch('incrementAsync')`
		}),
		//可以传参数
		...mapActions([
			'incrementByStepAsync' // 将 `this.incrementByStepAsync(amount)` 映射为 `this.$store.dispatch('incrementByStepAsync', amount)`
		]),
  }

};
</script>
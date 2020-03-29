<template>
  <div>
     count : {{$store.state.count}} ,mapState get count : {{count}}
    <br />
    <button @click="decrement">-1</button>
  </div>
</template> 
<script>
import { mapState } from "vuex";
import { mapMutations } from 'vuex' 
export default {
  data() {
    return {};
  },
  // use eslint report error 'mapState' is defined but never used (package.json remove eslint)
  computed: mapState([ 
    // map this.count to store.state.count
    "count"
  ]),
  methods:mapMutations(['decrement'])
};
</script>
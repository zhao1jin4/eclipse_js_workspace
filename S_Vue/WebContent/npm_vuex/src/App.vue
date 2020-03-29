<template>
  <div>
    <minus></minus>
    <p>----</p>
    <plus></plus>
  </div>
</template>

<script>
import Minus from "./components/Minus.vue";
import Plus from "./components/Plus.vue";
export default {
  name: "App",
  components: {
    minus: Minus,
    plus: Plus
  }
};
</script>


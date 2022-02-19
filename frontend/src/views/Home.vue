<template>
  <div class="home">
    <Card v-for="card in cards"/>
  </div>
</template>

<script>
import Card from '@/components/Card.vue'

export default {
  name: 'Home',
  components: {
    Card
  },

  data: () => ({
    cards: [
      { desc: 'card 1', price: '22', title: 'hehe', label: 'label'},
      { desc: 'card 1', price: '22', title: 'hehe', label: 'label'},
      { desc: 'card 1', price: '22', title: 'hehe', label: 'label'},
      { desc: 'card 1', price: '22', title: 'hehe', label: 'label'},
      { desc: 'card 1', price: '22', title: 'hehe', label: 'label'},
      { desc: 'card 1', price: '22', title: 'hehe', label: 'label'},
    ],
    selection: 1,
  })
}
</script>

<style lang="sass" scoped>
  .home
    display: flex
    flex-wrap: wrap

</style>

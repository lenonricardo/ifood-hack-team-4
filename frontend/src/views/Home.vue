<template>
  <div>
    <div class="home-header">
      <h1>What we gonna eat today?</h1>
      <span class="instruction">Select a recipe and we deliver the ingredients</span>
      <div class="inputs">
        <div class="mt-10">
          <v-chip v-for="chip in chips" class="chip" @click="search">{{chip}}</v-chip>
        </div>
        <div class="options mt-10">
          <v-btn dark class="text-capitalize mr-4">Create your recipe</v-btn>
          <v-text-field
            dense
            label="Search"
            outlined
            append-icon="mdi-magnify"
          ></v-text-field>
        </div>
      </div>
    </div>
    <div class="cards">
      <Card v-for="card in cards"/>
    </div>
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
    chips: ['Low carb', 'Family', 'Easy Cook', 'Cakes'],
    selection: 1,
    chipSelected: false
  }),

  computed: {
    chipColor() {
      return this.chipSelected ? 'black' : ''
    }
  },

  methods: {
    search() {
      this.chipSelected = true
    }
  }
}
</script>

<style lang="sass">
  .cards
    display: flex
    flex-wrap: wrap

  .home-header
    margin: 0px 0px 50px

  .instruction
    font-size: 15px

  .chip
    margin-right: 30px

  .inputs
    display: flex
    align-items: center
    flex-direction: row
    justify-content: space-between
    width: 97%

  .options
    display: flex
    align-items: center

  .v-text-field__details
    display: none !important

</style>

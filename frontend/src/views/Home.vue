<template>
  <div>
    <div class="home-header">
      <h1>O que vamos <span>cozinhar</span> hoje?</h1>
      <span class="instruction">Compre, prepare e sirva. Nós entregamos os ingredientes.</span>
      <div class="options mt-10">
        <v-text-field
          dense
          label="Cozinhe com o que tem em casa..."
          outlined
          width="200"
          append-icon="mdi-magnify"
          :class="!isMobile ? 'search-input' : ''"
        />

        <v-chip v-if="!isMobile" outlined color="#303030" v-for="chip in chips" class="chip" @click="search">{{chip}}</v-chip>
      </div>
    </div>
    <div :class="cardsClass">
      <RecipeCard v-for="card in cards"/>
    </div>
  </div>
</template>

<script>
import RecipeCard from '@/components/pages/RecipeCard.vue'

export default {
  name: 'Home',
  components: {
    RecipeCard
  },

  data: () => ({
    cards: [
      { desc: 'card 1', price: '22', title: 'hehe', label: 'label'},
      { desc: 'card 1', price: '22', title: 'hehe', label: 'label'},
      { desc: 'card 1', price: '22', title: 'hehe', label: 'label'},
      { desc: 'card 1', price: '22', title: 'hehe', label: 'label'},
      { desc: 'card 1', price: '22', title: 'hehe', label: 'label'},
      { desc: 'card 1', price: '22', title: 'hehe', label: 'label'},
      { desc: 'card 1', price: '22', title: 'hehe', label: 'label'},
      { desc: 'card 1', price: '22', title: 'hehe', label: 'label'},
      { desc: 'card 1', price: '22', title: 'hehe', label: 'label'},
      { desc: 'card 1', price: '22', title: 'hehe', label: 'label'},
    ],
    chips: ['Low carb', 'Vegano', 'Cozinha fácil', 'Doces'],
    selection: 1,
    chipSelected: false
  }),

  computed: {
    chipColor() {
      return this.chipSelected ? 'black' : ''
    },

    isMobile() {
      return this.$vuetify.breakpoint.xs || this.$vuetify.breakpoint.sm || this.$vuetify.breakpoint.md
    },

    cardsClass() {
      return this.isMobile ? 'cards cards-mobile' : 'cards'
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

  .cards-mobile
    justify-content: center

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
    justify-content: space-between

  .v-text-field__details
    display: none !important

  .home-header h1 span
    color: #EA1D2C

  .search-input
    margin-right: 150px !important
</style>

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
          @input="search"
        />

        <v-chip
          v-for="chip in chips"
          v-if="!isMobile"
          outlined
          color="#303030"
          class="chip"
          @click="searchByLabel(chip)"
        >
          {{chip}}
        </v-chip>
      </div>
    </div>
    <div :class="cardsClass">
      <RecipeCard v-for="card in filteredCards" :card="card"/>
    </div>
  </div>
</template>

<script>
import RecipeCard from '@/components/pages/RecipeCard.vue'
import Recipes from '@/service/recipes'

export default {
  name: 'Home',
  components: {
    RecipeCard
  },

  data: () => ({
    filteredCards: [],
    cards: [],
    chips: ['Todos', 'Família', 'Vegano', 'Cozinha fácil', 'Doces'],
    selection: 1,
    chipSelected: false
  }),

  async created() {
    const data = Recipes.getRecipes()

    if (!data) {
      const { data } = await Recipes.list()
    }

    this.cards = data

    this.filteredCards = [...this.cards]
  },

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
    search(value) {
      if (value === '') {
        this.filteredCards = [...this.cards]
        return
      }

      const filter = value.split(',')
      const recipes = this.cards.filter(
        card => card.ingredients.find(
          ingredient => filter.some(el => ingredient.title.includes(el))
        )
      )

      this.filteredCards = recipes
    },

    searchByLabel(value) {
      if (value === 'Todos') {
        this.filteredCards = this.cards
      } else {
        this.filteredCards = this.cards.filter(card => card.label === value)
      }
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

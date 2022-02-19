<template>
  <div>
    <v-card
      class="card"
      max-width="258"
      max-with="313"
      rounded
      elevation="10"
    >
      <v-card-title class="card-title">
        <span>{{ title }}</span>
        <span>{{ label }}</span>
      </v-card-title>

      <v-img
        max-height="168"
        src="https://cdn.vuetifyjs.com/images/cards/cooking.png"
      ></v-img>

      <v-card-title class="pb-0 ">
        <span class="price">Price: {{ price }}</span>
      </v-card-title>

      <div class="card-desc">
        <v-card-text class="pt-1">
          {{ desc }}
        </v-card-text>

        <v-card-actions>
          <v-btn
            color="#EA1D2C"
            class="mb-1 mr-2 text-capitalize"
            depressed
            dark
            @click="reserve"
          >
            Cook
          </v-btn>
        </v-card-actions>
      </div>
    </v-card>
    <RecipeDetail :dialog="dialog" @close="dialog = false"/>
  </div>
</template>

<script>
  import RecipeDetail from '@/components/pages/RecipeDetail.vue'

  export default {
    name: 'RecipeCard',

    components: {
      RecipeDetail
    },

    props: {
      title: {
        default: 'Super meal',
      },
      label: {
        default: 'Low carb',
      },
      desc: {
        default: 'Small plates, salads & sandwiches - an intimate setting with 12 indoor seats plus patio seating.'
      },
      price: {
        default: '29,99'
      }
    },

    data: () => ({
      loading: false,
      selection: 1,
      dialog: false,
      step: 1
    }),

    methods: {
      reserve () {
        this.dialog = true
      },
    },
  }
</script>

<style lang="sass" scoped>
  .display-flex
    display: flex
    flex-direction: row
    justify-content: space-between

  .card-title
    @extend .display-flex
    color: #303030
    max-height: 33px
    align-items: center
    padding: 0px 15px 0px 15px

  .card-title span
    font-size: 12px

  .card-desc
    @extend .display-flex
    align-items: flex-end
    margin-bottom: 10px

  .card-desc div
    font-size: 11px

  .card
    border-radius: 18px !important
    margin-right: 32px
    margin-bottom: 54px
</style>

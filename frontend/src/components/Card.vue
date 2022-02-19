<template>
  <div>
    <v-card
      class="card"
      max-width="374"
      rounded
      elevation="10"
    >
      <template slot="progress">
        <v-progress-linear
          color="deep-purple"
          height="10"
          indeterminate
        ></v-progress-linear>
      </template>

      <v-card-title class="card-title">
        <span>{{ title }}</span>
        <span>{{ label }}</span>
      </v-card-title>

      <v-img
        height="250"
        src="https://cdn.vuetifyjs.com/images/cards/cooking.png"
      ></v-img>

      <v-card-title class="card-title pb-0">
        <span>Price: {{ price }}</span>
      </v-card-title>

      <div class="card-desc">
        <v-card-text>
          {{ desc }}
        </v-card-text>

        <v-card-actions>
          <v-btn
            color="#303030"
            class="mb-0 mr-2 text-capitalize"
            depressed
            dark
            rounded
            @click="reserve"
          >
            Cook
          </v-btn>
        </v-card-actions>
      </div>
    </v-card>
    <Dialog :dialog="dialog" @close="dialog = false"/>
  </div>
</template>
<script>
  import Dialog from '@/components/Dialog.vue'

  export default {
    name: 'Card',

    components: {
      Dialog
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
      dialog: false
    }),

    methods: {
      reserve () {
        this.dialog = true
      },
    },
  }
</script>

<style lang="sass" scoped>
  @import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap')

  .card-title
    display: flex
    flex-direction: row
    justify-content: space-between
    font-family: Poppins
    color: #303030

  .card-desc
    @extend .card-title
    align-items: flex-end
    margin-bottom: 10px

  .card
    border-radius: 18px !important
    margin: 54px
</style>

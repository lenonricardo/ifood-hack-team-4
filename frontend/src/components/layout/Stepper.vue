<template>
  <v-stepper v-model="internalStep">
    <v-stepper-header>
      <v-stepper-step
        :disabled="internalStep === '2'"
        :editable="internalStep === '1'"
        step="1"
        color="#303030"
      >
        Checkout
      </v-stepper-step>

      <v-divider></v-divider>

      <v-stepper-step
        editable
        step="2"
        color="#303030"
      >
        Quase lá
      </v-stepper-step>
    </v-stepper-header>
    </v-stepper>
</template>
<script>
  export default {
    name: 'Stepper',

    props: {
      dialog: {
        default: false,
      },

      step: {
        default: 0
      }
    },

    computed: {
      internalStep: {
        get: function () {
          return this.step
        },
        set: function(value) {
          this.$emit('update:step', value)
        }
      }
    },

    data: () => ({
      loading: false,
      selection: 1
    }),
  }
</script>

<style lang="sass">
  .v-stepper
    box-shadow: none !important
    width: 50%
</style>
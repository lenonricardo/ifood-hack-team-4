<template>
  <div class="text-center">
    <v-dialog
      v-model="internalDialog"
      width="850"
      @click:outside="$emit('close')"
    >
      <v-card class="card">
        <slot name="content"/>
        <v-card-actions>
          <v-spacer></v-spacer>
          <slot name="footer"/>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </div>
</template>
<script>
  export default {
    name: 'Dialog',

    props: {
      dialog: {
        default: false,
      }
    },

    computed: {
      internalDialog: {
        get: function () {
          return this.dialog
        },
        set: function(value) {
          this.$emit('update:dialog', value)
        }
      }
    },

    data: () => ({
      loading: false,
      selection: 1,
    })
  }
</script>

<style lang="sass" scoped>
  .card
    padding: 20px
</style>

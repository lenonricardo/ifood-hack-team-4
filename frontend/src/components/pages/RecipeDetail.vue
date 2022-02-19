<template>
    <Dialog ref="dialog" :dialog="dialog" @close="internalDialog = false">
      <slot>
        <div class="stepper">
          <Stepper :step="step"/>
        </div>
      </slot>
    </Dialog>
</template>

<script>
  import Dialog from '@/components/layout/Dialog.vue'
  import Stepper from '@/components/layout/Stepper.vue'

  export default {
    name: 'RecipeDetail',

    components: {
      Dialog,
      Stepper
    },

    props: {
      dialog: {
        required: true,
        default: false
      }
    },

    data: () => ({
      step: 1
    }),

    computed: {
      internalDialog: {
        get: function() {
          return this.dialog
        },
        set: function(value) {
          this.$refs.dialog.dialog = false
          this.$emit('close', value)
        }
      }
    }
  }
</script>

<style lang="sass" scoped>
  .stepper
    display: flex
    justify-content: center
</style>

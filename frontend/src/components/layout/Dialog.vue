<template>
  <div class="text-center">
    <v-dialog
      v-model="dialog"
      width="800"
    >
      <v-card>
        <slot/>

        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn
            color="primary"
            text
            @click="$emit('close')"
          >
            Close
          </v-btn>
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

    data: () => ({
      loading: false,
      selection: 1,
    }),

    methods: {
    },
  }
</script>

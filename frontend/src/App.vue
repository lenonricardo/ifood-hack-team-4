<template>
  <v-app id="inspire">
    <Header/>

    <v-main>
      <v-container>
        <v-sheet min-height="70vh" rounded="lg">
          <router-view></router-view>
        </v-sheet>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
  import Header from '@/components/layout/Header.vue'

  export default {
    name: "App",

    components: {
      Header
    },

    data: () => ({
    }),
  };
</script>
<style>
</style>

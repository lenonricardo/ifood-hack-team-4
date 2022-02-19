<template>
  <v-app-bar color="white" flat height="128">
      <v-container class="py-0 fill-height">
      <v-toolbar-title>
        <router-link to="/" exact tag="span" class="logo">iC<span class="logo-detail">oo</span>k</router-link>
      </v-toolbar-title>
      <v-spacer></v-spacer>
      <v-spacer></v-spacer>
      <div class="right-items">
        <router-link to="/home" tag="span" class="menu-options" exact >about us</router-link>
        <router-link to="/home" tag="span" class="menu-options ml-5" exact > cart <v-icon size="15">mdi-cart</v-icon></router-link>
      </div>

      <v-responsive> </v-responsive>
      </v-container>
  </v-app-bar>
</template>
<script>
  export default {
    name: 'Dialog',

    props: {

    },

    data: () => ({
    }),

    methods: {
    }
  }
</script>
<style lang="sass" scoped>
  .menu-options
    text-decoration: none
    color: #303030
    cursor: pointer

  .logo
    @extend .menu-options
    font-size: 26px

  .logo-detail
    @extend .menu-options
    color: #EA1D2C

  .menu
    display: flex
    justify-content: space-between

  .right-items
    position: absolute
    right: 150px

  .icon-cart
    font-size: 10px
</style>

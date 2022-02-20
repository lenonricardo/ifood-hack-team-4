<template>
  <v-app-bar color="white" flat height="128">
      <v-container class="py-0 fill-height">
      <v-toolbar-title>
        <router-link to="/" exact class="logo"><img width="86" height="44" src="../../assets/logo.svg" ></router-link>
      </v-toolbar-title>
      <v-spacer></v-spacer>
      <v-spacer></v-spacer>
      <div v-if="!isMobile" class="right-items">
        <router-link to="/" tag="span" class="menu-options" exact >sobre nós</router-link>
        <router-link to="/" tag="span" class="menu-options ml-5" exact > carrinho <v-icon color="#303030" size="15">mdi-cart</v-icon></router-link>
      </div>

      <v-responsive> </v-responsive>
      </v-container>
  </v-app-bar>
</template>
<script>
  export default {
    name: 'Dialog',

    computed: {
      isMobile() {
        return this.$vuetify.breakpoint.xs || this.$vuetify.breakpoint.sm || this.$vuetify.breakpoint.md
      }
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

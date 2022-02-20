module.exports = {
  "transpileDependencies": [
    "vuetify"
  ],
  css: {
    loaderOptions: {
      sass: {
        prependData: `
          @import "@/styles/_global.sass"
        `
      }
    }
  }
}

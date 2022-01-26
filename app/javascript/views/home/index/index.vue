<template>
  <section>
    <input type="text" v-model="searchSentence">
    <button>Search</button>
  </section>
</template>

<script>
export default {
  name: "Index",
  components: {
  },
  created(){
    this.init()
  },
  data: () => ({
    searchSentence: "",
    // TODO search for a better name
    connectors: [
        "is",
        "a",
        ""
    ]
  }),
  watch: {
    searchSentence(newValue) {
      const filteredWords = newValue.split(' ').filter(e => !this.connectors.includes(e))
      if (newValue.length > 2) {
        console.log(filteredWords)
      }
    }
  },
  methods: {
    init(){
      console.log("created")
    }
  }
}
</script>
<template>
  <section>
    <input type="text" v-model="searchSentence">
    <button>Search</button>
  </section>
</template>

<script>
import axios from 'axios'

export default {
  name: "Index",
  components: {
  },
  created(){
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
      if (filteredWords.length > 2) {
        console.log(filteredWords.join('-'))
        this.searchRequest(filteredWords.join('-'))
      }
    }
  },
  methods: {
    searchRequest(params){
      console.log("created")
      // TODO remove hardcoded URL
      axios.get(`http://localhost:3000/api/v1/articles/search?query=${params}`)
            .then(response => {
              console.log(response)
            })
            .catch(() => { console.log(error) });
    }
  }
}
</script>
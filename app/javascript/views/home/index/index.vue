<template>
  <section>
    <input v-debounce:5000ms="saveSearch" style="width: 50%" type="text" v-model="searchSentence">
    <button>Search</button>
    <div>
      <ul>
        <li v-for="article in articles" :key="article.id">{{ article.title }}</li>
      </ul>
    </div>
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
    articles: [],
  }),
  watch: {
    searchSentence(newValue) {
      this.searchRequest(newValue.replace(' ','-'))
    }
  },
  methods: {
    saveSearch(){
      console.log("Sending data")
      axios.post("/api/v1/search", {
        query: this.searchSentence
      })
      .then(() => {
        console.log("sent data")
      }).catch((error) => {
        console.log(error)})
    },
    searchRequest(params){
      // TODO remove hardcoded URL
      axios.get(`/api/v1/articles?query=${params}`)
            .then(response => {
              // TODO change timeout depending of how many articles has the response
              this.articles = response.data?.articles ? response.data?.articles : []
            })
            .catch(error => { console.log(error) });
    }
  }
}
</script>
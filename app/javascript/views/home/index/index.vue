<template>
  <section>
    <input type="text" v-model="searchSentence">
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
      const filteredWords = newValue.split(' ')
      if (filteredWords.length > 2) {
        this.searchRequest(filteredWords.join('-'))
      }
    }
  },
  methods: {
    searchRequest(params){
      // TODO remove hardcoded URL
      axios.get(`http://localhost:3000/api/v1/articles/search?query=${params}`)
            .then(response => {
              console.log(response)
              this.articles = response.data?.articles ? response.data?.articles : []
            })
            .catch(() => { console.log(error) });
    }
  }
}
</script>
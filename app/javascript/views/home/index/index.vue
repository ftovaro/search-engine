<template>
  <section>
    <v-container>
      <v-row>
        <v-col cols="12" sm="12" class="text-center mb-10">
          <h3 class="mt-10 font-weight-thin text-lg-h3">Search Articles</h3>
        </v-col>
        <v-col cols="12" sm="12">
          <v-text-field
              v-debounce:5000ms="saveSearch"
              v-model="searchSentence"
              label="Search box"
              value=""
              hint="For example, How to get a good car?"
          ></v-text-field>
        </v-col>
        <v-col cols="12" sm="12">
          <v-list dense>
            <v-subheader v-show="this.articles.length > 1">Articles found:</v-subheader>
            <v-list-item-group v-model="selectedItem" color="primary">
              <v-list-item v-for="(article, i) in this.articles" :key="i">
                <v-list-item-icon>
                  <v-icon v-text="'mdi-book'"></v-icon>
                </v-list-item-icon>
                <v-list-item-content>
                  <v-list-item-title v-text="article.title"></v-list-item-title>
                </v-list-item-content>
              </v-list-item>
            </v-list-item-group>
          </v-list>
        </v-col>
      </v-row>
    </v-container>
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
    selectedItem: 0,
  }),
  watch: {
    searchSentence(newValue) {
      this.searchRequest(newValue.toLowerCase().replace(/\?/g, '').replace(' ','-'))
    }
  },
  methods: {
    isBlank(str) {
      return (!str || /^\s*$/.test(str));
    },
    saveSearch(){
      console.log("Sending data")
      if (this.isBlank(this.searchSentence)){
        console.log('Empty string')
      } else {
        axios.post("/api/v1/search", {
          query: this.searchSentence,
          device: this.getUserDevice()
        }).then(() => {
            console.log("sent data")
        }).catch((error) => {
        console.log(error)})
      }
    },
    searchRequest(params){
      // TODO remove hardcoded URL
      axios.get(`/api/v1/articles?query=${params}`)
          .then(response => {
              // TODO change timeout depending of how many articles has the response
              this.articles = response.data?.articles ? response.data?.articles : []
            })
          .catch(error => { console.log(error) });
    },
    getUserDevice(){
      if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
        return 'Mobile'
      } else {
        return 'Desktop'
      }
    }
  }
}
</script>
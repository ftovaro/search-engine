<template>
  <section>
    <div>
      <ul>
        <li v-for="keyword in keywords" :key="keyword._id">{{ keyword._id }}, {{ keyword.count }}</li>
      </ul>
    </div>
    <div>
      <ul>
        <li v-for="(search, index) in last_searches" :key="index">{{ search }}</li>
      </ul>
    </div>
  </section>
</template>

<script>
import axios from 'axios'

export default {
  name: "Show",
  components: {
  },
  created(){
    axios.get('/api/v1/statistics')
    .then(response => {
      this.keywords = response.data.keywords
      this.last_searches = response.data.last_searches
      console.log(response.data)
    })
    .catch((error) => console.log(error))
  },
  data: () => ({
    keywords: [],
    last_searches: []
  }),
  methods: {}
}
</script>
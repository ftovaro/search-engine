<template>
  <section>
    <v-container>
      <v-row>
        <v-col cols="12" sm="12" class="text-center mb-lg-10">
          <h3 class="mt-10 font-weight-thin text-sm-h1 text-lg-h3">Statistics</h3>
        </v-col>
        <v-col cols="12" sm="6" class="text-center mb-10 px-lg-16">
          <h3 class="mt-10 mb-10 font-weight-thin text-lg-h4">Top 5 words</h3>
          <div id="container" style="height: 400px"></div>
        </v-col>
        <v-col cols="12" sm="6" class="text-center mb-10 px-lg-16">
          <h3 class="mt-10 mb-10 font-weight-thin text-lg-h4">Last Searches</h3>
          <v-list dense>
            <v-list-item-group color="primary">
              <v-list-item v-for="(search, i) in this.last_searches" :key="i">
                <v-list-item-content>
                  <v-list-item-title class="text-lg-body-1 font-weight-bold" v-text="search"></v-list-item-title>
                </v-list-item-content>
              </v-list-item>
            </v-list-item-group>
          </v-list>
        </v-col>
        <v-col cols="12" sm="6" class="text-center mb-10 px-lg-16">
          <h3 class="mt-10 mb-10 font-weight-thin text-lg-h4">Top devices</h3>
          <div id="container-devices" style="height: 400px"></div>
        </v-col>
      </v-row>
    </v-container>
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
      this.devices = response.data.devices
      this.setGraph(this.keywords)
      this.setBarGraph(this.devices)
      console.log(response.data)
    })
    .catch((error) => console.log(error))
  },
  data: () => ({
    keywords: [],
    last_searches: [],
    devices: [],
  }),
  methods: {
    setGraph(rawData){
      const chart = anychart.pie();
      console.log(this.setData(rawData))
      const data = this.setData(rawData)
      chart.data(data)
      chart.title("Top 5 most searched words");
      chart.container("container");
      chart.draw();
    },
    setBarGraph(rawData){
      console.log(rawData)
      const chart = anychart.bar();
      console.log(this.setData(rawData))
      const data = this.setData(rawData)
      chart.data(data)
      chart.title("Most used devices");
      chart.container("container-devices");
      chart.draw();
    },
    setData(rawData){
      const data = []
      for (let rawDatum of rawData) {
        data.push([rawDatum._id, rawDatum.count])
      }
      return data
    }
  }
}
</script>
<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
    <p>
      {{joke}}
    </p>
    <button :disabled="loading" @click="getRandomJoke" class="buttonJoke">New Joke</button>
    <div v-if="loading" class="loader"></div>
    
  </div>
</template>

<script>
export default {
  name: "HelloWorld",
  props: {
    msg: String,
  },
  data() {
    return {
      joke: "Empty",
      loading:false
    };
  },
  methods: {
    async getRandomJoke() {
      this.loading = true;
      fetch("https://icanhazdadjoke.com/", {
        headers: {
          Accept: "application/json"
        },
      })
        .then((response) => response.json())
        .then((jsonObj) => {
          this.joke = jsonObj.joke;
          this.loading = false;
        })
        .catch((error) => {
          console.log(error);
          this.loading = false;
          this.joke = "Error occured when getting new joke";
        });
    },
  },
  mounted() {
    this.getRandomJoke();
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}

.hello{
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.buttonJoke{
  padding: 10px;
  background: #42b983;
  outline: none;
  border: none;
  border-radius: 5px;
  color: white;
  transition: all 0.5s;
}

.buttonJoke:hover{
  background: #2e815c;
  cursor: pointer;
}

.loader {
  margin-top: 20px ;
  border: 16px solid #f3f3f3;
  border-radius: 50%;
  border-top: 16px solid #2e815c;
  width: 50px;
  height: 50px;
  -webkit-animation: spin 2s linear infinite; /* Safari */
  animation: spin 2s linear infinite;
}

/* Safari */
@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

</style>

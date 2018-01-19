/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      searchTerm: "",
      searchPrice: "",
      sortAttribute: 'name',
      products: [],
      sortAsc: true
    };
  },
  created: function() {
    console.log('home page');
    axios.get("/products").then(function(response) {
      this.products = response.data;
    }.bind(this));
  },
  methods: {
    isValidProduct: function(inputProduct) {
      console.log('testing method');
      var validName = inputProduct.name.includes(this.searchTerm);
      var validPrice = inputProduct.price.includes(this.searchPrice);
      return validName && validPrice;
    },
    sortByAttribute: function(inputAttribute) {
      console.log('testing sort method');
      // take the variable and change it to the price
      this.sortAsc = !this.sortAsc;
      this.sortAttribute = inputAttribute;
    } 
  },
  computed: {
    sortedProducts: function() {
      if (this.sortAsc) {
        return this.products.sort(function(product1,product2) {
          return product1[this.sortAttribute].localeCompare(product2[this.sortAttribute]);
        }.bind(this));
      } else {
        return this.products.sort(function(product1,product2) {
          return product2[this.sortAttribute].localeCompare(product1[this.sortAttribute]);
        }.bind(this));
      }
    }
  }
};

// // Signup Vue.js
var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};


// // Login vue.js
var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/user_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

// Logout vue.js
var LogoutPage = {
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};

// Show Product Page vue.js
var ShowProductPage = {
  template: "#show-product-page",
  data: function() {
    return {
      product: {}
    };
  },
  created: function() {
    console.log('in show product');
    axios.get('/products/' + this.$route.params.id).then(function(response) {
      this.product = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

// New Product Page vue.js
var NewProductPage = {
  template: "#new-product-page",
  data: function() {
    return {
      name: "",
      price: "",
      description: "",
      images: "",
      errors: []
    };
  },
  methods: {
    addProduct: 
    function() {
      console.log("testing....");
      var params = {
        name: this.name,
        price: this.price,
        description: this.description,
        images: this.images
      };
      axios
        .post("/products", params)
        .then(function(response) {
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  },
  created: function() {
    console.log('created component');
  }
};


// Edit Product Page vue.js
var EditProductPage = {
  template: "#edit-product-page",
  data: function() {
    return {
      product: {},
      errors: []
    };
  },
  methods: {
    editProduct: 
    function() {
      var params = {
        name: this.product.name,
        price: this.product.price,
        description: this.product.description,
        images: this.product.images
      };
      axios
        .patch("/products/" + this.$route.params.id, params)
        .then(function(response) {
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  },
  created: function() {
    console.log('created component');
    axios.get("/products/" + this.$route.params.id).then(function(response) {
      this.product = response.data;
    }.bind(this));
  }
};


var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    // // route to signup page
    { path: "/signup", component: SignupPage },
    // // route to login page
    { path: "/login", component: LoginPage },
    // route to logout page
    { path: "/logout", component: LogoutPage },
    // route to create new product
    { path: "/products/new", component: NewProductPage },
    // route to edit a product
    { path: "/products/:id/edit", component: EditProductPage },
    // route to show a product
    { path: "/products/:id", component: ShowProductPage}
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});
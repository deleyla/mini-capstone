/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Products Available For Purchase"
    };
  },
  created: function() {
    console.log('in created')
    this.runSomething();
  },
  methods: {
    runSomething: function() {
      console.log('running something')
    }
  },
  computed: {}
};

// // Signup Vue.js
// var SignupPage = {
//   template: "#signup-page",
//   data: function() {
//     return {
//       name: "",
//       email: "",
//       password: "",
//       passwordConfirmation: "",
//       errors: []
//     };
//   },
//   methods: {
//     submit: function() {
//       var params = {
//         name: this.name,
//         email: this.email,
//         password: this.password,
//         password_confirmation: this.passwordConfirmation
//       };
//       axios
//         .post("/v1/users", params)
//         .then(function(response) {
//           router.push("/login");
//         })
//         .catch(
//           function(error) {
//             this.errors = error.response.data.errors;
//           }.bind(this)
//         );
//     }
//   }
// };
// // Login vue.js
// var LoginPage = {
//   template: "#login-page",
//   data: function() {
//     return {
//       email: "",
//       password: "",
//       errors: []
//     };
//   },
//   methods: {
//     submit: function() {
//       var params = {
//         auth: { email: this.email, password: this.password }
//       };
//       axios
//         .post("/user_token", params)
//         .then(function(response) {
//           axios.defaults.headers.common["Authorization"] =
//             "Bearer " + response.data.jwt;
//           localStorage.setItem("jwt", response.data.jwt);
//           router.push("/");
//         })
//         .catch(
//           function(error) {
//             this.errors = ["Invalid email or password."];
//             this.email = "";
//             this.password = "";
//           }.bind(this)
//         );
//     }
//   }
// };
// New Product Page vue.js
var NewProductPage = {
  template: "#new-product-page",
  data: function() {
    return {
      name: "",
      price: "",
      tax: "",
      total: "",
      isDiscounted: "",
      description: "",
      availability: "",
      supplier: "",
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
        tax: this.tax,
        total: this.total, 
        is_discounted: this.isDiscounted,
        description: this.description,
        availability: this.availability, 
        supplier: this.supplier,
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

var router = new VueRouter({
  routes: [
     { path: "/", component: HomePage },
    // // route to signup page
    // { path: "/signup", component: SignupPage },
    // // route to login page
    // { path: "/login", component: LoginPage },
    // route to create new product
    { path: "/products/new", component: NewProductPage }
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router
});
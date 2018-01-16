/*gobal axios*/

// grab html element
var productContainer = document.querySelector('.row');
// grab the template
var productTemplate = document.querySelector('#product-card');
// modify its styling
// productContainer.appendChild(productTemplate.content.cloneNode(true));

axios.get("http://localhost:3000/products").then(function(response) {
  console.log(response.data);

  //set the variable as the response data from products table
  var products = response.data;
  //loop through response data
  for (var i = 0; i < products.length; i++) {
    //get the copied productTemplate
    var productClone = productTemplate.content.cloneNode(true);
    // modify the clone with information from the database (products array)
    productClone.querySelector('.product-image').innerText = products[i].image;
  }









});
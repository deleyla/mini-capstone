#require Unirest
require 'unirest'
p "Here are the products available for purchase:"
#make an http request to my app
response = Unirest.get("http://localhost:3000/all_products")
#show the user that data
products = response.body

product_length = products.length

i = 0
products.length.times do
  product_number = i.to_s
  product_name = products[i]["name"]
  p "#{product_number}. #{product_name}"
  i += 1
end

#get data from selected product

p "Which product would you like more information on?"

user_input = gets.chomp.to_i
product_data = products[user_input]

product_name = product_data["name"]
product_price = product_data["price"]
product_image = product_data["image"]
product_description = product_data["description"]

p "The #{product_name} costs $#{product_price} USD. #{product_description}. Here is an image of the product: #{product_image}"
#require Unirest
require 'unirest'
require 'pp'

base_url = "http://localhost:3000"
system "clear"

p "Welcome to my store."
p "Choose an option"
p "[1] see all the products"
p "[2] see a particular recipe"
p "[3] create a new product"

user_input = gets.chomp

if user_input == '1'
  # show all the products
  response = Unirest.get("#{base_url}/products")
  pp response.body
elsif user_input == '2'
  # get a particular product
  # get user input for the product id
  p "Enter the id for the item you would like to look at"
  product_id = gets.chomp
  # make a unirest call to get that item
  response = Unirest.get("#{base_url}/products/#{product_id}")
  pp response.body
elsif user_input == '3'
  # make a new product in the db
  p "Let's make a new product!"
  # ask for some user input
  p "Tell me what the product's name is"
  product_name = gets.chomp
  p "Tell me what the product's price is"
  product_price = gets.chomp.to_i
  p "Tell me what the product's image filename is"
  product_image = gets.chomp
  p "Give me a description of the product"
  product_description = gets.chomp
  #take that user input and save it as a new product
  response = Unirest.post("#{base_url}/products?name=#{product_name}&price=#{product_price}&image=#{product_image}&description=#{product_description}")
  pp response.body
end


# p "Here are the products available for purchase:"
# #make an http request to my app
# response = Unirest.get("http://localhost:3000/all_products")
# #show the user that data
# products = response.body

# product_length = products.length

# i = 0
# products.length.times do
#   product_number = i.to_s
#   product_name = products[i]["name"]
#   p "#{product_number}. #{product_name}"
#   i += 1
# end

# #get data from selected product

# p "Which product would you like more information on?"

# user_input = gets.chomp.to_i

# # use tty prompt
# # require 
# # prompt = TTY::Prompt.new
# # prompt.select("Which product would you like more information on?", [""])
# # # prompt.select("Which product would you like more information on?")


# product_data = products[user_input]

# product_name = product_data["name"]
# product_price = product_data["price"]
# product_image = product_data["image"]
# product_description = product_data["description"]

# p "The #{product_name} costs $#{product_price} USD. #{product_description}. Here is an image of the product: #{product_image}"
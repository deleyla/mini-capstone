#require Unirest
require 'unirest'
#require pretty print
require 'pp'

#this is the base url that does not change. 
base_url = "http://localhost:3000"
#clears the terminal
system "clear"

#Welcome the user to the store
p "Welcome to my store."
#Provide the user with the options
p "Choose an option"
p "[1] see all the products"
p "[2] see a particular recipe"
p "[3] create a new product"
p "[4] update a product"
p "[5] delete a product"

#Get the user's input or selection based on the options provided above
user_input = gets.chomp

if user_input == '1'
  # show all the products
  # in the routes file, /products calls the index method in the controller file. the index method calls all of the products so when we call this, it will call the method that is tied to this URL (i.e. the route)
  response = Unirest.get("#{base_url}/products")
  pp response.body
elsif user_input == '2'
  # get a particular product
  # get user input for the product id
  p "Enter the id for the item you would like to look at"
  product_id = gets.chomp
  # make a unirest call to get that item
  # in the routes file, we indicate that the URL for the show method is products/:id, and we indicate that the id is determined in the show method by finding 'id' in the json. Therefore, when we get the product_id from the user, it is placed in the URL and calls whatever id is in the database. 
  response = Unirest.get("#{base_url}/products/#{product_id}")
  pp response.body
elsif user_input == '3'
  # make a new product in the db
  p "Let's make a new product!"
  # ask for user input
  p "Tell me what the product's name is"
  product_name = gets.chomp
  p "Tell me what the product's price is"
  product_price = gets.chomp.to_i
  p "Tell me what the product's image filename is"
  product_image = gets.chomp
  p "Give me a description of the product"
  product_description = gets.chomp
  #take that user input and save it as a new product
  #?key=value
  #? calls the params hash
  #key is determined in the products_controller.rb file, under the create method - in this case, the keys are name, price, image and description
  #value is determined on this page above - it's the user input. 
  response = Unirest.post("#{base_url}/products?name=#{product_name}&price=#{product_price}&image=#{product_image}&description=#{product_description}")
  #print the new product's information for the user to see
  pp response.body
elsif user_input == '4'
  # ask the user for input
  p "Which product would you like to update? Type in the ID"
  product_id = gets.chomp
  # make a unirest call to get that item
  response = Unirest.get("#{base_url}/products/#{product_id}")
  # get user input on what the user would like to update
  p "Tell me what the product's new name is"
  new_name = gets.chomp
  p "Tell me what the product's new price is"
  new_price = gets.chomp
  p "Tell me what the product's new image filename is"
  new_image = gets.chomp
  p "Tell me what the product's new description is"
  new_description = gets.chomp
  #take that user input and update the product
  #?key=value
  #? calls the params hash
  #key is determined in the products_controller.rb file, under the update method - in this case, the keys are name, price, image and description.
  #value is determined on this page above - it's the user input.
  response = Unirest.post("#{base_url}/products?name=#{new_name}&price=#{new_price}&image=#{new_image}&description=#{new_description}")
  #print the updated product's information for the user to see
  p "Here is the updated product information:"
  pp response.body
elsif user_input == '5'
  #ask the user which product they want to delete
  p "Which product would you like to delete?"
  product = gets.chomp
  #make a call to the URL and delete that product
  response = Unirest.delete("#{base_url}/products/#{product_id}")
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
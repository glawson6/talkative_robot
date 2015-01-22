# OOP Lab

## Add on to previous lab with:

# Create User class
# use class methods to gather user info
# initialize with name, age, and other questions that are prompted
# create getter and setter methods for each question asked
# Set current_user = User.new(...) by passing in a hash of args
# In the script, change user[:name] to its getter method version
# Create GroceryList class
# initialize with file name
# pull other methods into GroceryList class
# Create a Person class
# Create an Author class
# Set it so that both User and Author inherit from Person
# For any shared behavior between User and Author, put it in Person
# Pass in the User instance into the GroceryList initialize, so there’s a connection
# Should be able to run:
# user = User.new({ name: “Gerry”, age: 28, gender: “M” })
# grocery_list = GroceryList.new(“grocery_list.txt”, user)
# grocery_list.owner.name # => “Gerry”

require 'pry'
require './lib/grocery_list'
require './lib/user'

name    = User.get_name
age     = User.get_age
gender  = User.get_gender
current_user = User.new(name: name, age: age, gender: gender)

author = Author.new
puts author.name

grocery_list = GroceryList.new("grocery_list.txt", current_user)
puts grocery_list
puts grocery_list.owner.name
# binding.pry
filename = "grocery_list.txt"
groceries = ["eggs", "flour", "milk", "sugar", "juice"]
GroceryList.write_to_csv ({filename: filename, array: GroceryList.output_grocery_list(groceries)})
user = User.new(name: "Gerry", age: 28, gender: "M")

grocery_list = GroceryList.new({filename: filename, user: user})
puts grocery_list

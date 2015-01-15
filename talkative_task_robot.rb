#gerry.pass
#[2:33 PM]
#Added Untitled in wdi-atl-2
# Create to_dos = [“dishes”, …] at least 5 tasks long -- start with “dishes”,
# include “walk the dog” somewhere
# Using Ruby, answer:
# First thing you need to do (should be “dishes”)
# Last thing you need to do
# What index is “walk dog”?
# Write commands to follow along with this story:
# You did the last thing on the list
# You just did the dishes
# You just remembered you want to do something right now
# You just remembered you want to do something when all the other stuff is done


#gerry.pass [3:26 PM]
#Add on to previous lab with:
#                           Create grocery_list array with 5+ items
#Turn your user questions into a hash
#Hint: Create user variable equal to a blank hash first, then put each key/value into that hash
#Pick out a random off list
#Print “Did you already grab the <random_item>?”
#Remove from list if yes
#Add new item to list “Oh yeah, don’t forget the bread!”
#
#Bonus
#In ~/ruby_scripts, create a file called arrays.rb
#Go through the entire Ruby doc on arrays and practice each method
#Ignore any method that takes a block
#Ex of one to ignore: arr.each { |x| puts x }
#We’re covering these next lesson
#
#Bonus
#In ~/ruby_scripts, create a file called hashes.rb
#Go through the entire Ruby doc on hashes and practice each method
#Ignore any method that takes a block
#Ex of one to ignore: hash.each { |k, v| puts “#{k} : #{v}” }
#We’re covering these next lesson
walk_the_dog = "walk the dog"
to_dos = ["dishes", walk_the_dog, "get groceries", "create some code", "get some sleep"]

first_task = to_dos.first
puts(" First thing you need to do #{first_task}")
last_task = to_dos.last
puts(" Last thing you need to do #{last_task}")
wthedog_index = to_dos.index(walk_the_dog)
puts(" What index is “walk dog”? => #{wthedog_index}")
puts(" You did the last thing on the last #{to_dos.pop}")
puts(" You just did the  #{to_dos.shift}")
last_task = "last task"
to_dos << last_task
puts(" You just remembered you want to do something when all the other stuff is done #{last_task}")
user = {}
q1 = {question1: " First thing you need to do #{first_task}"}
q2 = {question2: " Last thing you need to do #{last_task}"}
q3 = {question3: " What index is “walk dog”? => #{wthedog_index}"}
q4 = {question4: " You did the last thing on the last #{to_dos.pop}"}
q5 = {question5: " You just did the #{to_dos.shift}"}
getting_choice_arr = [true, false]

groceries = ["eggs", "flour", "milk", "sugar", "juice"]
random_item = groceries.sample

user.merge!(q1)
user.merge!(q2)
user.merge!(q3)
user.merge!(q4)
user.merge!(q5)
user[:groceries] = groceries

puts user

def askitem(random_item)
  puts("Did you already grab the #{random_item}?")
  gets().chomp().to_s.upcase
end

if (askitem(random_item).include?("Y"))
  user[:groceries].delete(random_item)
end

puts user

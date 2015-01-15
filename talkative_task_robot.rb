## REUSING PREVIOUS FILE
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
user = {name: "Greg"}
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
#new ;one character
$newline_char = "\n"
#puts user
big_tap_name = "BigTap"
def askitem(random_item)
  puts("Did you already grab the #{random_item}?")
  gets().chomp().to_s.upcase
end
def get_Author
  return {name: big_tap_name, book: ""}
end
def grocery_string_with_index(item,index)
  human_index = index + 1
  if (human_index < 10)
    return "0#{human_index} -- #{item.capitalize}"
  else
    return "#{human_index} -- #{item.capitalize}"
  end
end
def write_to_file_newline_ending(filename,array)
  object_to_write = array.join("\n")
  IO.write(filename,object_to_write)
end
def read_groceries_from_file(filename)
  read_file = IO.read(filename)
  # Split input on first two digits, space, and --
  read_file.split(%r{\d\d\s--\s})
end
def output_grocery_list(grocery_list)
  grocery_list.each_with_index.map{|element,index| grocery_string_with_index(element,index)}
end
def select_by_name(list_of_users, first_name)
  list_of_users.select{|element| element[:name]== first_name}
end

def write_to_csv_file(filename,array)
  # Create CSV header from array then join
  object_to_write = (["ItemNumber","Item"].join(",")) << $newline_char
  data = []
  # Create data portion with index
  array.each_with_index{|item, index| data.push(["#{index+1}","#{item}"].join(",") << $newline_char) }
  # Append data to output object
  object_to_write = object_to_write << data.join()
  IO.write(filename,object_to_write)
end
#if (askitem(random_item).include?("Y"))
#  user[:groceries].delete(random_item)
#end

#puts user
# Create author
author_create = user.clone
author_create[:favorite_book]="mine"
author_create[:name]=big_tap_name

# Add author to people array
people = [user, author_create]

# Display people
puts("people => #{people}")

#Select author

#author = people.select{|element| element.has_key?(:favorite_book)}
author = select_by_name(people,big_tap_name)

# Display author
puts("author => #{author}")

# Create and display grocery list from requirements......
grocery_list_required = output_grocery_list(user[:groceries])
puts(grocery_list_required)


filename = "groceries.txt"
newfilename = "newGroceries.txt"
csv_filename = "groceriesCSV.txt"

# write original grocery list to file
write_to_file_newline_ending(filename,grocery_list_required)

# read grocery list from file
read_groceries = read_groceries_from_file(filename)

# parse and strip unneeded data from grocery list
new_groceries = read_groceries.reject!{|item| item.strip.length == 0}.map{|item| item.include?("\n")?(item.chomp):item}

# display groceries and new grocery list
puts ("read groceries => #{read_groceries}")
puts("newgroceries => #{new_groceries}")

# modify grocery list
new_groceries << "Cheese"
new_groceries << "Bread"

#create required grocery list output format
new_groceries_required = output_grocery_list(new_groceries)

# write grocery list to new file
write_to_file_newline_ending(newfilename,new_groceries_required)

#Write to csv file
write_to_csv_file(csv_filename,new_groceries)




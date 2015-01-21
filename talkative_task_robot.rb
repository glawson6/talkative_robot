class Person

end

class User < Person

  attr_accessor :name, :age, :gender
  def initialize(args)
    @name = args[:name]
    @age = args[:age]
    @gender = args[:gender]
  end

end

class Author < Person

end

class GroceryList
  def initialize(args)
    @filename = args[:filename]
    @user = args[:user]
    @groceries = GroceryList.load_groceries @filename
  end

  def self.load_groceries filename
    read_file = IO.read(filename)
    # Split input on first two digits, space, and --
    groceries_raw = read_file.split(%r{\d\d\s--\s})
    groceries_raw.reject!{|item| item.strip.length == 0}.map{|item| item.include?("\n")?(item.chomp):item}
  end

  def list_items
    
  end

  def self.output_grocery_list(grocery_list)
    grocery_list.map.with_index{|element,index| grocery_string_with_index(element,index)}
  end

  def self.write_to_csv (args)
    array = args[:array]
    filename = args[:filename]
    object_to_write = array.join("\n")
    IO.write(filename,object_to_write)
  end

  def self.grocery_string_with_index(item,index)
    human_index = index + 1
    if (human_index < 10)
      return "0#{human_index} -- #{item.capitalize}"
    else
      return "#{human_index} -- #{item.capitalize}"
    end
  end

  def to_s
    "User #{@user.name} has #{@groceries} grocery list"
  end
end

class Utils

  def self.select_by_name(list_of_users, first_name)
    list_of_users.select{|element| element[:name]== first_name}
  end
  def self.askitem(random_item)
  puts("Did you already grab the #{random_item}?")
  gets().chomp().to_s.upcase
  end
  def self.get_author
    return {name: big_tap_name, book: ""}
  end
end

filename = "grocery_list.txt"
groceries = ["eggs", "flour", "milk", "sugar", "juice"]
GroceryList.write_to_csv ({filename: filename, array: GroceryList.output_grocery_list(groceries)})
user = User.new(name: "Gerry", age: 28, gender: "M")

grocery_list = GroceryList.new({filename: filename, user: user})
puts grocery_list

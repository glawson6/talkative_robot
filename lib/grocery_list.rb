
class GroceryList
  attr_accessor :owner, :grocery_list

  # def owner
  #   @owner
  # end

  # def owner=(new_owner)
  #   @owner = new_owner
  # end

  # def grocery_list
  #   @grocery_list
  # end

  # def grocery_list=(new_grocery_list)
  #   @grocery_list = new_grocery_list
  # end

  def initialize(file_name, owner)
    @grocery_list = import_list(file_name)
    @owner        = owner
    binding.pry
  end

  def import_list(file_name)
    IO.read(file_name).split("\n") # Assumes stacked on top of each other
  end

  def to_s
    # Boss status
    grocery_list.map.with_index do |item, index|
      "#{index + 1} -- #{item}"
    end.join("\n")

    # Broken out into multiple steps
    # itemized_grocery_list = grocery_list.map.with_index { |item, i| "#{i + 1} -- #{item}" }
    # itemized_grocery_list.join("\n")
  end
end
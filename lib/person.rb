
class Person
  def self.get_name
    print "Name: "
    gets.chomp
  end

  def self.get_age
    print "Age: "
    gets.chomp.to_i
  end

  def self.get_gender
    print "Gender [MF]: "
    gets.chomp.capitalize
  end


  attr_accessor :name, :age, :gender

  def initialize(args)
    @brain  = args[:brain]  || false
    @name   = args[:name]   || "N/A"
    @age    = args[:age]    || 0
    @gender = args[:gender] || "N/A"
  end

  def male?
    gender == "M"
  end

  def old?
    age >= 70
  end

  def young?
    age <= 10
  end
end

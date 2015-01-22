require 'person'
class Author < Person
  def initialize(args={})
    super(args)
    @name   = "Gerry Pass"
    @age    = 28
    @gender = "M"
  end
end
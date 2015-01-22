require_relative './person'

class User < Person
  def initialize(args={})
    super(args)
  end

  def print_age_based_message
    milestone = 75
    age_delta = (milestone - age).abs
    if age > milestone
      "You turned 75 #{age_delta} years ago!"
    elsif age < milestone
      "You will turn 75 in #{age_delta} years!"
    else
      "Congrats on being #{milestone}!"
    end
  end
end
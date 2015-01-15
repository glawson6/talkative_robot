def askAge
  puts("How old are you?")
  gets().chomp().to_i()
end

def askGender
  puts("Are you male or female (M/F)?")
  gets().chomp()
end

def lastMessage(ageDifference,gender)

  if (ageDifference > 60 && gender == "M")
    return "You are a young boy."
  elsif (ageDifference > 60 && gender == "F")
    return "You are a young girl."
  elsif (ageDifference < 10 && gender == "M")
    return "Are you a great-great grandfather?"
  elsif (ageDifference < 10 && gender == "F")
    return "Are you a great-great grandmother?"
  else
    return "Hang in there"
  end
end
age = askAge
genderInput = askGender

#age = ARGV[0]
#genderInput = ARGV[1]

gender = genderInput.upcase
ageDifference = 75 - age.to_i
ageMessage = (ageDifference == 0) ? "you’re 75!" :( (ageDifference > 0) ?"You’ll be 75 in #{ageDifference} years":"You turned 75 #{ageDifference} years ago" )
puts ageMessage
message = lastMessage(ageDifference,gender)
puts message


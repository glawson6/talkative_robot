puts("How old are you?")
age = gets().chomp().to_i()

puts("Are you male or female (M/F)?")
genderInput = gets().chomp()

#age = ARGV[0]
#genderInput = ARGV[1]

gender = genderInput.upcase
ageDifference = 75 - age.to_i
ageMessage = (ageDifference == 0) ? "you’re 75!" :( (ageDifference > 0) ?"You’ll be 75 in #{ageDifference} years":"You turned 75 #{ageDifference} years ago" )
puts ageMessage

if (ageDifference > 60 && gender == "M")
  puts ("You are a young boy.")
elsif (ageDifference > 60 && gender == "F")
  puts("You are a young girl.")
elsif (ageDifference < 10 && gender == "M")
  puts("Are you a great-great grandfather?")
elsif (ageDifference < 10 && gender == "F")
  puts("Are you a great-great grandmother?")
else
  puts("Hang in there")
end


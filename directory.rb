def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  # create an empty array
  students = []

  # get the first name

  name = gets.chomp.upcase
  puts "thanks now nationality?"

  nationality = gets.chomp.upcase
  puts "thanks now favourite food?"

  food = gets.chomp.upcase
  puts "and favourite number"

  number = gets.chomp.to_s.upcase
  puts "and cohort?"

  cohort = gets.chomp.upcase.to_sym

    cohort.empty?
    puts "you are being assigned a default cohort"
    cohort = "Cohort Default".to_sym

  # while the name is not empty, repeat this code
  while !name.empty? do
    students << {name: name, nationality: nationality, food: food, number: number, cohort: cohort}
    puts "Now we have #{students.count} students"

    # get another name from the user
    name = gets.chomp.upcase

    puts "thanks now nationality?"
    nationality = gets.chomp.upcase
     puts "thanks now favourite food?"
    food = gets.chomp.upcase
     puts "and favourite number"
    number = gets.chomp.to_s.upcase
    puts "and cohort?"
  cohort = gets.chomp.upcase.to_sym
  end

 # return the array of students
    students
  end

def print_header
puts "The students of Villains Academy"
puts "____________"
end

def print(students)
  i=0

  while i < students.length do

    puts "#{students[i][:name]} from #{students[i][:nationality]} enjoys #{students[i][:food]} fave number #{students[i][:number]} (#{students[i][:cohort]} cohort)".center(50) if students[i][:name].start_with?("N","n") && students[i][:name].size<12

    i += 1

   end

end

def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(50, '---')
end

students = input_students
print_header
print(students)
print_footer(students)

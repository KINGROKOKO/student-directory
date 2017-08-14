def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    students << {name: name, chort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
 # return the array of students
    students
  end

def print_header
puts "The students of Villains Academy"
puts "____________"
end

def print(students)
students.each_with_index{|student, index| puts "#{index} #{student[:name]} (#{student[:cohort]} cohort)" if student[:name].start_with?("N","n")&& student[:name].size<12}
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)

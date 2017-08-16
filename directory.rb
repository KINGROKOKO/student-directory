
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  # get the first name
students=[]
  name = gets.strip.upcase
  puts "thanks now nationality?"

  nationality = gets.strip.upcase
  puts "thanks now favourite food?"

  food = gets.strip.upcase
  puts "and favourite number"

  number = gets.strip.to_s.upcase
  puts "and cohort?"

  cohort = gets.strip.upcase.to_sym

    if cohort.empty?
    puts "you are being assigned a default cohort"
    cohort = "Cohort Default".to_sym
    end

  # while the name is not empty, repeat this code
  while !name.empty? do
    students << {name: name, nationality: nationality, food: food, number: number, cohort: cohort}
    puts "Now we have #{students.count} students"

    # get another name from the user
    name = gets.strip.upcase

    #check for empty name again within method
    if name.empty?
      students

    else
    puts "thanks now nationality?"
    nationality = gets.strip.upcase!
     puts "thanks now favourite food?"
    food = gets.strip.upcase!
     puts "and favourite number"
    number = gets.strip.to_s.upcase!
    puts "and cohort?"
    cohort = gets.strip.upcase.to_sym

  if cohort.empty?
    puts "you are being assigned a default cohort"
    cohort = "Cohort Default".to_sym
  end
  end
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
  if names.count > 1
  puts "Overall, we have #{names.count} great students".center(50, '---')
  elsif names.count == 1
  puts "Overall, we have #{names.count} great student".center(50, '---')
  else
  puts "Overall, we have #{names.count} great students".center(50, '---')
  end
end

def interactive_menu

  students = []

  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" #9 because we'll be adding more items
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user asked
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students) if students.count > 0
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end
  end
end

interactive_menu

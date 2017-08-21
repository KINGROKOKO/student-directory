@students=[]# an empty array accessible to all methods

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  # get the first name

  name = STDIN.gets.strip.upcase
  puts "thanks now nationality?"

  nationality = STDIN.gets.strip.upcase
  puts "thanks now favourite food?"

  food = STDIN.gets.strip.upcase
  puts "and favourite number"

  number = STDIN.gets.strip.to_s
  puts "and cohort?"

  cohort = STDIN.gets.strip.upcase.to_sym

    if cohort.empty?
    puts "you are being assigned a default cohort"
    cohort = "Cohort Default".to_sym
    end

  # while the name is not empty, repeat this code
  while !name.empty? do
    @students << {name: name, nationality: nationality, food: food, number: number, cohort: cohort}
    puts "Now we have #{@students.count} students"

    # get another name from the user
    name = STDIN.gets.strip.upcase

    #check for empty name again within method
    if name.empty?
      @students

    else
    puts "thanks now nationality?"
    nationality = STDIN.gets.strip.upcase!
     puts "thanks now favourite food?"
    food = STDIN.gets.strip.upcase!
     puts "and favourite number"
    number = STDIN.gets.strip.to_s
    puts "and cohort?"
    cohort = STDIN.gets.strip.upcase.to_sym

  if cohort.empty?
    puts "you are being assigned a default cohort"
    cohort = "Cohort Default".to_sym
  end
  end
end

 # return the array of students
    @students
  end

def print_header
puts "The students of Villains Academy"
puts "____________"
end

def print_students_list(students)
  i=0

  while i < @students.length do

    puts "#{@students[i][:name]} from #{@students[i][:nationality]} enjoys #{@students[i][:food]} fave number #{@students[i][:number]} (#{@students[i][:cohort]} cohort)".center(50) if @students[i][:name].start_with?("N","n") && @students[i][:name].size<12

    i += 1

   end

end

def print_footer(names)
  if names.count > 1
  puts "Overall, we have #{names.count} great students".center(50, '---')
  puts
  elsif names.count == 1
  puts "Overall, we have #{names.count} great student".center(50, '---')
  puts
  else
  puts "Overall, we have #{names.count} great students".center(50, '---')
  puts
  end
end

def save_students
    # open the file for writing
    file = File.open("students.csv", "w")
    # iterate over the array of students
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
    file.close
  end

def load_students(filename = "students.csv")
    file = File.open(filename, "r")
    file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
     @students << {name: name, cohort: cohort.to_sym}
  end
   file.close
end

def try_load_students
  filename = ARGV.first #first argument from the command line
  return if filename.nil? #get out of the method if it isn't given
  if File.exists?(filename) #if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list(@students)
  print_footer(@students) if @students.count > 0
end

def interactive_menu

  loop do
    # 1. print the menu and ask the user what to do
    print_menu#9 because we'll be adding more items
    # 2. read the input and save it into a variable
    process(STDIN.gets.chomp)
  end
end

  def process(selection)
    case selection
    when "1"
      puts
      puts "START INPUTTING STUDENTS"
      puts
      input_students
    when "2"
      puts
      puts "SHOWING STUDENTS"
      puts
      show_students
    when "3"
      puts
      puts "SAVED!"
      puts
      save_students
    when "4"
      puts
      puts "LOADED!"
      puts
      load_students
    when "9"
      puts "EXITING!"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end
  end

interactive_menu

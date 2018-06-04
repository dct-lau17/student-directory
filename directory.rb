def input_student
  
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
 
  # while the name is not empty, repeat this code
  while true do
    puts "Please enter the names of the student"
    name = gets.chomp
    break if name.empty?
    puts  "Please enter the students hobby"
    hobby = gets.chomp
    puts "Please enter the height"
    height = gets.chomp

    #add the student has to the array
    students << {name: name, cohort: :november, hobby: hobby, height: height}
    puts "Now we have #{students.count} students"
    # get another name from user
    break if name.empty? 
    end
    #return the array of students
    students
 end

def print_header
  puts "The Student of Villains Academy"
  puts "----------------------------"
end

def print(students)
  counter = 0
  while counter < students.length do
    puts "#{counter + 1}. #{students[counter][:name]} (#{students[counter][:cohort]} cohort) is #{students[counter][:height]}cm tall with an interest in #{students[counter][:hobby]} "
    counter += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

# nothing happens until we call the methods
students = input_student
print_header
print(students)
print_footer(students)

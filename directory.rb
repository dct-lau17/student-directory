def input_student
  
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  puts "Please enter the names of the student"
    name = gets.chomp
  # while the name is not empty, repeat this code
  while true do
    records = Hash.new
    break if name.empty? 
    records[:name] = name
    
    cohort = ""
    hobby = ""
    height = ""

   puts  "Please enter the students cohort" 
     cohort = gets.chomp

    if cohort.empty? 
       records[:cohort] = "november"
    else
      records[:cohort] = cohort
    end
    while hobby.empty? 
       puts  "Please enter the students hobby" 
       hobby = gets.chomp
       records[:hobby] = hobby
    end


  puts "Please enter the height"
    height = gets.chomp
    while true do 
        if height.to_i.to_s == height
            records[:height] = height
            break
        else
            puts "Please enter the height"
            height = gets.chomp
        end
       
    end 

    students << records
    puts "Now we have #{students.count} students" 
    puts "Please enter the names of the student"
       name = gets.chomp                    
    
    end
    #return the array of students
    students
 end

def print_header
  header = "The Student of Villains Academy"
  puts header.center(80)
  puts ("-" * header.length).center(80)
end

def print(students)
  counter = 0
  while counter < students.length do
    puts "#{counter + 1}. #{students[counter][:name]} (#{students[counter][:cohort]} cohort) is #{students[counter][:height]}cm tall with an interest in #{students[counter][:hobby]} ".center(80) 
    counter += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(80)
end

# nothing happens until we call the methods
students = input_student
print_header
print(students)
print_footer(students)

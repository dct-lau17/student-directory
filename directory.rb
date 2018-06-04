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
    # return the array of students
    students
 end

def print_header
  header = "The Student of Villains Academy"
  puts header.center(80)
  puts ("-" * header.length).center(80)
end

# group students by cohort 
def group(students)
  group_by_cohort = {}
  students.each do |student|
      cohort = student[:cohort]
      name = student[:name]

      if group_by_cohort[cohort] == nil
        group_by_cohort[cohort] = []
      end
  
  group_by_cohort[cohort] << name

  end
    group_by_cohort
end

def print(group)
  group.each do |key, value|
  puts "#{key.to_s.capitalize} cohort".center(80) 
        value.each do |name|
        puts name.to_s.center(80)
        end  


  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(80)
end

# nothing happens until we call the methods
students = input_student
print_header
students_grouped = group(students)
print(students_grouped)
print_footer(students)

@students = []
def input_student
  
  puts "To finish, just hit return twice"
    puts "Please enter the names of the student"
    name = STDIN.gets.strip
  # while the name is not empty, repeat this code
  while true do
    records = Hash.new
    break if name.empty? 
    records[:name] = name
    
    cohort = ""
    hobby = ""
    height = ""

   puts  "Please enter the students cohort" 
     cohort = STDIN.gets.strip

    if cohort.empty? 
        records[:cohort] = "november"
    else
        records[:cohort] = cohort
    end

    while hobby.empty? 
       puts  "Please enter the students hobby" 
       hobby = STDIN.gets.strip
       records[:hobby] = hobby
    end


  puts "Please enter the height"
    height = STDIN.gets.strip
    while true do 
        if height.to_i.to_s == height
            records[:height] = height
            break
        else
            puts "Please enter the height"
            height = STDIN.gets.strip
        end
       
    end 

  @students << records

  if @students.count <= 1
      puts "Now we have #{@students.count} student" 
  else
      puts "Now we have #{@students.count} students" 
  end


  puts "Please enter the names of the student"
  name = STDIN.gets.strip                    
    
  end
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

def print_footer
  puts "Overall, we have #{@students.count} great students".center(80)
end


def interactive_menu	
  loop do
	print_menu
	process(STDIN.gets.chomp)	
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
  students_grouped = group(@students)
  print(students_grouped)
  print_footer
end

def process(selection)
  case selection
    when "1"
		input_student
	when "2"
		show_students 
    when "3"
    	save_students
    when "4"
    	load_students
	when "9"
		exit
	else
		puts "I don't know what you meant, try again"
  end
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  @students.each do |student|
  	student_data = [student[:name], student[:cohort], student[:hobby], student[:height]]
  	csv_line = student_line = student_data.join(",")
  	file.puts csv_line
  end
  file.close
end	

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort, hobby, height = line.chomp.split(",")
      @students << {name: name, cohort: cohort.to_sym, hobby: hobby, height: height}
  end
  file.close	
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) #if it exists
    load_students(filename)
    puts "Loaded #{@students.count} records from #{filename}"
  else
  	puts "Sorry, #{filename} does not exist."
  	exit
  end	
end

try_load_students
interactive_menu
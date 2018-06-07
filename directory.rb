
@students = []
@records = 0

def input_student
  while true do
    puts "To finish, leave blank and hit return"
    puts "Please enter the names of the student"
    @name = STDIN.gets.strip
    break if @name.empty?
    
     puts  "Please enter the students cohort" 
     @cohort = STDIN.gets.strip 
     @cohort = "november" if @cohort.empty?
     
    
    while true do
      puts  "Please enter the students hobby" 
      @hobby = STDIN.gets.strip
      break if !@hobby.empty?
    end

    while true do 
      puts "Please enter the height"
      @height = STDIN.gets.strip
      break if @height.to_i.to_s == @height 
    end 

    add_students_to_hash
    @records += 1
    print_summary
  end
end

def add_students_to_hash
   @students << {name: @name, cohort: @cohort.to_sym, hobby: @hobby, height: @height}
end

def print_summary
  if @students.count == 1
    puts "Now we have #{@students.count} student"
  else
    puts "Now we have #{@students.count} students"
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
      name, cohort = student[:name], student[:cohort] 

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
  puts "3. Save the list"
  puts "4. Load a file"
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
      save_file
    when "4"
      load_file
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

# Takes a user input, if user hits enter without adding a filename the @filename takes
# the string assigned by @loadfile defined in try_to_load method 
# adds the extension if it hasn't been supplied and assigns it to @filename variable
# Then calls the save_students with the @filename as an argument
def save_file
  puts "enter new filename or leave blank if you want to overwrite the existing file"
  @filename = STDIN.gets.chomp 
  
  if @filename == ""
    @filename = @loadfile
  elsif !@filename.include? ".csv" 
    @filename += ".csv"
  end  
save_students(@filename)
end

# Asks user for a file to load if extension is not supplied add ".csv"
# Checks to see if file exists if it does clear the students array and call the load method 
# Else provide error message

def load_file 
  puts "enter an existing file name"
  @filename = STDIN.gets.chomp 

  if !@filename.include? ".csv" 
    @filename += ".csv"
   end
    
  if File.exist?(@filename)
    @students = []
    load_students(@filename)
  else  
    puts "sorry #{@filename} does not exist"
  end  
end

def save_students(filename)
  # open the file for writing
  file = File.open(filename, "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:hobby], student[:height]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "Sucessfully updated file with #{@records} more entry"
end 

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    @name, @cohort, @hobby, @height = line.chomp.split(",")
      add_students_to_hash
  end
  file.close  
  successful_load_message(filename)
end

def successful_load_message(filename) 
  puts "Loaded #{@students.count} records from #{filename}"
end

def try_load_students
  @loadfile = ARGV.first # first argument from the command line
  if @loadfile.nil? 
    @loadfile = "students.csv"
    load_students(@loadfile) # use students.csv if file not given
  elsif File.exists?(@loadfile) #if it exists
    load_students(@loadfile)
  else
    puts "Sorry, #{@loadfile} does not exist."
    exit
  end 
end

try_load_students
interactive_menu
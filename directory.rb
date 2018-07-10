@students = []

def input_students
	puts "Enter names of students, their age & their cohort."
	puts "To exit, press Enter twice."
	puts
	puts "Enter name."
	name = gets.chomp
	!name.empty? ? name.capitalize! : nil

	while !name.empty? do

		puts "#{name}'s age?"
		age = gets.chomp
		age.empty? ? age = "age_unknown" : nil

		puts "And #{name}'s cohort? (First three letters of month eg. 'Jan')"
		cohort = gets.chomp
		!cohort.empty? ? cohort.capitalize! : "cohort_unknown"
		puts

		@students << {name: name, cohort: cohort, age: age}

		if @students.count == 1
			puts "1 student registered."
		else
			puts "Now we have #{@students.count} students."
		end

		puts "Input info for another student, starting with their name, or press Enter to finish."
		puts
		name = gets.chomp
		!name.empty? ? name.capitalize! : nil
	end
  @students
end

def print_header
	puts "The students of Villains Academy".center(100)
	puts "-------------".center(100)
end

def print_footer(names)
	puts "Overall, there are #{names.count} students.".center(100)
end

#Prints all students, alphabetically
def print_all_names(names)
	ordered_names = names.sort_by {|student| student[:name]}
	ordered_names.each.with_index(1) {|student, index| puts "#{index}. Name: #{student[:name]}, Age: #{student[:age]} (Cohort: #{student[:cohort]})".center(100)}
	puts
end

#Prints info for single student
def print_info(student)
	puts "Name: #{student[:name]}, Age: #{student[:age]} (Cohort: #{student[:cohort]})".center(100)
end

def sort_by_cohort(names)
	cohort_hash = {}
	@students.each {|student|
		if cohort_hash[student[:cohort]] == nil
			cohort_hash[student[:cohort]] = [student[:name]]
		else 
			cohort_hash[student[:cohort]] << student[:name]
		end
	}
	cohort_hash
end

def print_by_cohort(hash)
	hash.each {|key, value|
		puts "#{key}: #{value}".center(100)
	}
end

students = input_students
print_header
print_all_names(students)
print_footer(students)

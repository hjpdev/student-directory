
def print_header
	puts "The students of Villains Academy"
	puts "-------------"
end
def print_names(names)
	names.each {|student| puts "#{student[:name]} (#{student[:cohort]} cohort)"}
	puts
end
def print_footer(names)
	puts "Overall, there are #{names.count} students."
end

def input_students
	puts "Enter names of students."
	puts "To exit, press Enter twice"
	students = []
	name = gets.chomp

	while !name.empty? do
		students << {name: name, cohort: :november}
		puts "Now we have #{students.count} students."
		name = gets.chomp
	end
  students
end

students = input_students
print_header
puts students
print_footer(students)
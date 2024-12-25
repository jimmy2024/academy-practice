# frozen_string_literal: true
STUDENTS_FILE_PATH = "#{__dir__}/students.txt"
RESULT_PATH = "#{__dir__}/result.txt"

def main
  students = read_students
  result = {}
  loop do
    puts "Enter age or -1 to exit"
    age = gets.chomp
    break if age == "-1"
    result[age] = [] unless result[age]
    result[age] = students[age]
    break if result == students
  end
  write_results(result)
  File.foreach(RESULT_PATH) { |line| print line }
end

def read_students
  students = {}
  File.open(STUDENTS_FILE_PATH, 'r').each_line do |line|
    name, surname, age = line.split
    students[age] = [] unless students[age]
    students[age].push "#{name} #{surname}"
  end
  students
end

def write_results(result)
  res = File.open(RESULT_PATH, 'w')
  result.each do |age, names|
    names.each { |name| res.puts "#{name} #{age}" }
  end
  res.close
end

main




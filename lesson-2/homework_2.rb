# frozen_string_literal: true
def greeting
  name = $stdin.gets.chomp
  surname = $stdin.gets.chomp
  age = $stdin.gets.chomp.to_i
  if age < 18
    puts "Привет, #{name} #{surname}. Тебе меньше 18 лет, но начать учиться программировать никогда не рано"
  else puts "Привет, #{name} #{surname}. Самое время заняться делом!"
  end
end

def foobar(num1, num2)
  if num1 == 20 || num2 == 20
    num2
  else num1 + num2
  end
end

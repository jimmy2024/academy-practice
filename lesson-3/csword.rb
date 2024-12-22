# frozen_string_literal: true
def cs_word
  word = $stdin.gets.chomp
  word.downcase!
  if word.index('cs',-2)
    puts 2 ** word.length
  else
    puts word.reverse
  end
end

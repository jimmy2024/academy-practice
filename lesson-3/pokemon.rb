# frozen_string_literal: true
def generate_pokemons
  n = $stdin.gets.chomp.to_i
  pokemons = []
  n.times do
    name = $stdin.gets.chomp
    color = $stdin.gets.chomp
    pokemons.push({ name => color })
  end
  pokemons
end

def custom_print(pokemons)
  result = String.new
  result << "["
  i = 0
  pokemons.each do |pokemon|
    pokemon.each { |key, val| result << "{name: '#{key}', color: '#{val}'}" }
    i += 1
    result << ", " if i < pokemons.length
  end
  result << "]"
  print result
end

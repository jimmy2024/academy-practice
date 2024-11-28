# frozen_string_literal: true

require_relative '../pokemon'

RSpec.describe '#generate_pokemons' do
  it 'create array of hashes' do
    allow($stdin).to receive(:gets).and_return('2', 'Pikachu', 'Yellow', 'Charmeleon', 'Red')
    exp = [{ "Pikachu" => "Yellow" }, { "Charmeleon" => "Red" }]
    expect(generate_pokemons).to match_array(exp)
  end
end

RSpec.describe '#custom_print' do
  it '2 element array of pokemons' do
    allow($stdin).to receive(:gets).and_return('2', 'Pikachu', 'Yellow', 'Charmeleon', 'Red')
    expect { custom_print(generate_pokemons) }.to output("[{name: 'Pikachu', color: 'Yellow'}, {name: 'Charmeleon', color: 'Red'}]").to_stdout
  end
  it '1 element array of pokemons' do
    allow($stdin).to receive(:gets).and_return('1', 'Pikachu', 'Yellow')
    expect { custom_print(generate_pokemons) }.to output("[{name: 'Pikachu', color: 'Yellow'}]").to_stdout
  end
  it 'empty array of pokemons' do
    allow($stdin).to receive(:gets).and_return('0', 'Pikachu', 'Yellow')
    expect { custom_print(generate_pokemons) }.to output("[]").to_stdout
  end
end

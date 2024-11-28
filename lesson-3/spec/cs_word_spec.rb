# frozen_string_literal: true

require_relative '../csword'

RSpec.describe '#cs_word' do
  it 'no cs ending' do
    tc = { "word" => "hello", "expect" => "hello".reverse }
    check(tc["word"], tc["expect"])
  end
  it 'lowercase cs' do
    tc = { "word" => "physics", "expect" => 2 ** "physics".length }
    check(tc["word"].downcase, tc["expect"])
  end
  it 'uppercase cs' do
    tc = { "word" => "DISCS", "expect" => 2 ** "DISCS".length }
    check(tc["word"].upcase, tc["expect"])
  end
  it 'just cs' do
    tc = { "word" => "cs", "expect" => 2 ** "cs".length }
    check(tc["word"], tc["expect"])
  end
end

def check(word, expected)
  allow($stdin).to receive(:gets).and_return(word)
  expect { cs_word }.to output("#{expected}\n").to_stdout
end

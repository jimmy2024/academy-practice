# frozen_string_literal: true
BALANCE_FILE_PATH = "#{__dir__}/balance.txt"

class ATM_v2
  DEFAULT_STARTING_BALANCE = 100
  attr_reader :balance

  def initialize
    @balance = read_balance_from_file
  end

  def deposit(amount)
    if amount <= 0
      puts 'Amount should be > 0'
      return
    end
    @balance += amount
  end

  def withdraw(amount)
    if amount < 0
      puts 'Amount should be > 0'
      return
    end
    if amount > @balance
      puts "Amount should be <= #{@balance}"
      return
    end
    @balance -= amount
  end

  def show_balance
    puts "Your balance is #{@balance}"
  end

  def read_balance_from_file
    return DEFAULT_STARTING_BALANCE unless File.exist? BALANCE_FILE_PATH
    File.open(BALANCE_FILE_PATH) { |f| return f.readline.to_i }
  end

  def write_balance_to_file
    File.open(BALANCE_FILE_PATH, 'w') { |f| f.write @balance }
  end
end

def main
  atm = ATM_v2.new
  show_controls
  while (command = gets) do break if command == nil
  command = command.chomp.upcase
  case command
  when "D"
    n = user_want_to_input?
    atm.deposit(n) if n
    atm.show_balance
  when "W"
    n = user_want_to_input?
    atm.deposit(n) if n
    atm.show_balance
  when "B"
    atm.show_balance
  when "Q"
    break; else puts "Unknown command"
  end
  end
  atm.write_balance_to_file
end

def user_want_to_input?
  amount = gets.chomp.to_i
  (amount != nil) ? amount : false
end

def show_controls
  puts "ATM machine"
  puts "D - deposit"
  puts "W - withdraw"
  puts "B - balance"
  puts "Q - quit"
end

main
# frozen_string_literal: true
STARTING_BALANCE = 100
BALANCE_FILE_PATH = "#{__dir__}/balance.txt"

def main
  show_controls
  current_balance = read_balance
  while (command = gets) do
    break if command == nil
    command = command.chomp.upcase
    case command
    when "D"
      current_balance = deposit(current_balance)
      show_balance(current_balance)
    when "W"
      current_balance = withdraw(current_balance)
      show_balance(current_balance)
    when "B"
      show_balance(current_balance)
    when "Q"
      break;
    else
      puts "Unknown command"
    end
  end
  write_balance(current_balance)
end

def deposit(current_balance)
  while (amount = gets)
    amount = amount.chomp.to_i
    if amount < 0
      puts 'Amount should be > 0'
    else
      break
    end
  end
  (amount != nil) ? current_balance + amount : current_balance
end

def withdraw(current_balance)
  while (amount = gets)
    amount = amount.chomp.to_i
    if amount < 0
      puts 'Amount should be > 0'
    elsif amount > current_balance
      puts "Amount should be <= #{current_balance}"
    else
      break
    end
  end
  (amount != nil) ? current_balance - amount : current_balance
end

def show_balance(current_balance)
  puts "Your balance is #{current_balance}"
end

def write_balance(current_balance)
  File.open(BALANCE_FILE_PATH, 'w') { |f| f.write current_balance }
end

def read_balance
  return STARTING_BALANCE unless File.exist? BALANCE_FILE_PATH
  File.open(BALANCE_FILE_PATH) { |f| return  f.readline.to_i }
end

def show_controls
  puts "ATM machine"
  puts "D - deposit"
  puts "W - withdraw"
  puts "B - balance"
  puts "Q - quit"
end

main
# frozen_string_literal: true

class ATM_v3
  BALANCE_FILE_PATH = "#{__dir__}/balance.txt"
  DEFAULT_STARTING_BALANCE = 100
  attr_reader :balance

  def initialize
    @balance = read_balance_from_file
  end

  def deposit(amount)
    if amount <= 0
      return 'Amount should be > 0'
    end
    @balance += amount
    write_balance_to_file
    @balance
  end

  def withdraw(amount)
    if amount < 0
      return 'Amount should be > 0'
    end
    if amount > @balance
      return "Amount should be <= #{@balance}"
    end
    @balance -= amount
    write_balance_to_file
    @balance
  end

  def show_balance
    "Your balance is #{@balance}"
  end

  def read_balance_from_file
    return DEFAULT_STARTING_BALANCE unless File.exist? BALANCE_FILE_PATH
    File.open(BALANCE_FILE_PATH) { |f| return f.readline.to_i }
  end

  def write_balance_to_file
    File.open(BALANCE_FILE_PATH, 'w') { |f| f.write @balance }
  end
end

# frozen_string_literal: true

DB_PATH = "#{__dir__}/db.txt"
TMP_FILE = "#{__dir__}/db.txt.tmp"

def index
  puts '======index======'
  File.foreach(DB_PATH) { |line| puts line }
end

def find(id)
  puts "======find #{id}======"
  File.foreach(DB_PATH).with_index do |line, index|
    if index == id - 1
      puts line
      return
    end
  end
end

def where(pattern)
  puts "======where #{pattern}========"
  File.foreach(DB_PATH) do |line|
    puts line if line.include?(pattern)
  end
end

def update(id, text)
  f = File.open(TMP_FILE, 'w')
  File.foreach(DB_PATH).with_index do |line, index|
    f.print (id - 1 == index) ? "#{text}\n" : line
  end
  f.close
  File.delete(DB_PATH)
  File.rename(TMP_FILE, DB_PATH)
end

def create(name)
  f = File.open(DB_PATH, 'a')
  f.puts
  f.print name
  f.close
end

def delete(id)
  f = File.open(TMP_FILE, 'w')
  File.foreach(DB_PATH).with_index do |line, index|
    f.print line unless (id - 1 == index)
  end
  f.close
  File.delete(DB_PATH)
  File.rename(TMP_FILE, DB_PATH)
end
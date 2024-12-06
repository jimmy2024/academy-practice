# frozen_string_literal: true

DB_PATH = "#{__dir__}/db.txt"
TMP_FILE = "#{__dir__}/db.txt.tmp"

def index
  File.foreach(DB_PATH) { |line| puts line }
end

def find(id)
  File.foreach(DB_PATH).with_index do |line, index|
    puts line if index == id
  return
  end
end

def where(pattern)
  File.foreach(DB_PATH) do |line|
    puts line if /#{pattern}/ =~ line
  end
end

def update(id, text)
  f = File.open(TMP_FILE, 'w')
  File.foreach(DB_PATH).with_index do |line, index|
    f.puts id == index ? text : line
  end
  f.close
  File.delete(DB_PATH)
  File.rename(TMP_FILE, DB_PATH)
end

def create(name)
  f = File.open(DB_PATH, 'a')
  f.puts name
  f.close
end

def delete(id)
  f = File.open(TMP_FILE, 'w')
  File.foreach(DB_PATH).with_index do |line, index|
    puts line unless id == index
  end
  f.close
  File.delete(DB_PATH)
  File.rename(TMP_FILE, DB_PATH)
end


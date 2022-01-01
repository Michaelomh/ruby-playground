# Ruby comments uses Hash

# Printing
print "Hello World";
# run this ruby file using
# > ruby ruby/helloworld.rb 

# Puts prints text with a line break
puts "Hello World with a line break"

# Variables 
# There are 4 variables in Ruby
# Local(_), instance(@), class(@@), global ($)
# variables uses snakecase
first_name = "John"

# Numbers
13.to_f     # 13.0
13.9.to_i   # 13
6.even?     # true
6.odd?      # false

# Strings
"hello"[0]      # "h"
"hello"[0..1]   # "he"
"hello"[0, 4]   # "hell"
"hello"[-1]     # "o"
puts "Hello, #{first_name}" # "Hello, John"
"hello".capitalize          # "Hello"
"hello".include?("ll")      # true
"hello".upcase              # "HELLO"
"HELLO".downcase            # "hello"
"hello".empty?              # false
"hello".length              # 5
" hello, world   ".strip    # "hello, world!"
5.to_s                      # "5"

# Null/Undefined = nil
# In Ruby, nil represents “nothing”. Everything in Ruby has a return value. When a piece of code doesn’t have anything to return, it will return nil.
undefined_in_ruby = nil

# Conditionals
conditional_num = 5
if conditional_num > 6
  print("The number is  more than 6")
elsif conditional_num < 4
  print("The number is less than 4")  
else
  print("The number is less than 4 and more than 6")  
end

# Comparison
5 == 5 # true
5 != 5 # false
5 >= 5 # true
5.eql?(5.0) # true .eql? checks both type and value
5.equal?(5.0) # false .equal? checks if both is the exact same object

# Logical Operators
# AND - && / and
# OR  - || / or
# NOT - !

# Case Statements
grade = 'F'
case grade
when 'A'
  puts "You're a genius"
when 'D'
  puts "Better luck next time"
else
  puts "'YOU SHALL NOT PASS!' -Gandalf"
end

# Loops
# While loop, loop while true. Stop when false
i = 0
while i < 10 do
  puts "i is #{i}"
  i += 1
 end

 # Until loop, loop until true. Continue if true
 until i >= 10 do
  puts "i is #{i}"
  i += 1
 end

 # For loop, loop as many times as the loop requires
 for i in 0..5
  puts "i=#{i}!"
end

# Arrays
num_array = [1, 2, 3, 4, 5]
str_array = ["This", "is", "a", "small", "array"]
str_array[0]            #=> "This"
str_array[-1]           #=> "array"
str_array.first         #=> "This"
str_array.first(2)      #=> ["This", "is"]
str_array.last(2)       #=> ["small", "array"]

# Hash
shoes = {
  "summer" => "sandals",
  "winter" => "boots"
}
shoes["summer"]   #=> "sandals"
shoes["hiking"]   #=> nil
shoes.fetch("hiking", "default Value") #=> "default Value"
shoes["fall"] = "sneakers" # adds key="fall" with value="sneakers" into the Hash
shoes["summer"] = "flip-flops" #replaces value of key="summe"r from "sandals" to "flip-flops"
shoes.delete("summer") #delete key="summer"
shoes.keys      #=> [return all keys]
shoes.values    #=> [return all values]

# Functions
def my_function_name(name)
  # write code here
end

# Predicate methods
# sometimes you see methods with ?. These are called predicate methods which is a naming convention that Ruby uses for methods that return boolean (true/false)
def is_valid_currency?(currency)
  return true;
end
puts is_valid_currency?(15)


# Advanced looping
# for each loop
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
friends.each { |friend| puts "Hello, " + friend }
friends.each_with_index { |friend, index| puts "#{index}. " + friend }

my_hash = { "one" => 1, "two" => 2 }
my_hash.each { |key, value| puts "#{key} is #{value}" }

# map - mainly used for data transformation
friends.map { |friend| friend.upcase }

# select/filter
friends.select { |friend| friend != 'Brian' }
 #=> ["Sharon", "Leo", "Leila", "Arun"]

# reduce
my_numbers = [5, 6, 7, 8]
sum = 0
my_numbers.each { |number| sum += number }

# For in array loop
for i in my_numbers 
  puts i
end

# For each array loop 
friends.each do |friend|
  puts "Hello! " + friend
end

# predicate methods
# include?  - return true if value exists
# any?      - return true if ANY condition matches 
# all?      - return true if ALL condition matches
# none?     - return true if NONE condition matches

numbers = [5, 6, 7, 8]
numbers.include?(6) # true
numbers.any?{ |number| number == 6} # true
numbers.all?{ |number| number >= 5} # true
numbers.none?{ |number| number < 5} # true

# OOP in Ruby 
# objects are named using PascalCase
class Student
  @name
  @email

  # getters / setters
  def name=(name)
    @name = name
  end

  def name
    @name
  end

  def to_s
    "First name: #{@name}"
  end 
end

john = Student.new
john.name = "John Doe"
puts john.name

class BetterStudent
  # create setter
  attr_accessor :name, :email
  
  # create getter
  attr_reader :name, :email
  @name
  @email

  def to_s
    "name: #{name} | email: #{email}"
  end
end

mary = BetterStudent.new
mary.name = "Mary Amie"
mary.email = "Mary@gmail.com"
puts mary

class StudentConstructor
  # create setter
  attr_accessor :name, :email
  
  # create getter
  attr_reader :name, :email

  # constructor
  def initialize(name, email)
    @name = name
    @email = email
  end

  def to_s
    "name: #{name} | email: #{email}"
  end
end

bob = StudentConstructor.new("Bobby Droptables", "bob@yahoo.com")
puts bob


# Creating mixins/ your own modules
#momentUtils.rb
module MomentUtils

  def self.is_valid_currency?(value)
    value > 0
  end
end

# To use your mixin
require_relative = 'momentUtils'
momentUtils.is_valid_currency?(5)
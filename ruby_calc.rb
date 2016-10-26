def greeting
  puts "\n---Welcome to the Ruby Calculator---\n"
  puts "I can [add] [subtract] [multiply] [divide]"
  puts "Type 'quit' to exit the calculator"
end

def first_number
  puts "\nWhat is your first number?\n"
  @user_number = gets.strip.downcase
  exit if @user_number == 'quit'
  @user_number = @user_number.to_f
  puts "Your first number is #{@user_number}"
  operation_menu
end

def operation_menu
  puts "\nWhat is the operator?\n"
  operators = ['+', '-', '*', '/']
  puts "\n| + | - | * | / | c |\n"
  @operator = gets.strip
  if operators.include?(@operator) # validates input is included in array
    second_number
  elsif
    @operator == 'c'
    @user_number = 0
    @user_second = 0
  else
    puts "Please enter valid operator"
    operation_menu
  end
end


def second_number
  puts "What is the second number?\n"
  @user_second = gets.to_f
  puts "Your second number is #{@user_second}"
  calculation
end

def calculation
  case @operator
  when '+'
      puts @user_number + @user_second
      @user_number = @user_number + @user_second
      operation_menu
  when '-'
      puts @user_number - @user_second
      @user_number = @user_number - @user_second
      operation_menu
  when '*'
      puts @user_number * @user_second
      @user_number = @user_number * @user_second
      operation_menu
  when '/'
      if @user_second == 0
        puts "\n ****You cannot divide by zero. Try again.****"
      else
        puts @user_number / @user_second
        @user_number = @user_number / @user_second
        operation_menu
      end
  end
end

while true
  greeting
  first_number
  calculation
end

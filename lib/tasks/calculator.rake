namespace :calculator do
  desc "Run the calculator"
  task run: :environment do
    puts "RPN Calculator"
    puts "enter q to exit"
    print ">  "
    calculator = Rpn.new
    while input = STDIN.gets.chomp
      begin
        break if input == "q"
        puts calculator.enter(input)
      rescue Exception => error
        puts error
      end
      print ">  "
    end
  end
end

require_relative "code"

class Mastermind

    def initialize(length)

        @secret_code = Code.random(length)

    end

    def print_matches(code)

        puts "You have #{@secret_code.num_exact_matches(code)} exact matches"

        puts "You have #{@secret_code.num_near_matches(code)} near matches"

    end

    def ask_user_for_guess

        puts "Enter a code consisting of the characters 'R', 'G', 'B', 'Y': "

        guess = Code.from_string(gets.chomp)

        self.print_matches(guess)

        guess == @secret_code

    end

end

class Code

  attr_reader :pegs 

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(chars)

    chars.all? { | char | POSSIBLE_PEGS.has_key?(char.upcase) }

  end

  def self.random(length)

    pegs = []
    
    length.times { | n | pegs << POSSIBLE_PEGS.keys.sample }

    Code.new(pegs)

  end

  def self.from_string(pegs)

    Code.new( pegs.split("") )

  end

  def initialize(pegs)

    if Code.valid_pegs?(pegs)

      @pegs = pegs.map(&:upcase)


    else

      raise "Pegs are invalid"

    end

  end

  def [](index)

    @pegs[index]

  end

  def length

    @pegs.length

  end

  def num_exact_matches(guess)

    (0...guess.length).count { | i  | @pegs[i] == guess[i] }

  end

  def num_near_matches(guess)

    (0...guess.length).count { | i | @pegs[i] != guess[i] && @pegs.include?(guess[i]) }

  end

  def ==(code)
    
     @pegs == code.pegs

  end

end

class Game < ActiveRecord::Base
  
  BODY_PARTS = 6

  has_many :guesses

  before_validation :create_random_word, on: :create

  def guess!(letter)

    matches = false

    self.word.split("").each_with_index do |char,idx|
      if char == letter
        self.solved[idx] = char
        matches = true
      end
    end

    self.guesses.create(
      letter: letter,
      matches: matches
    )

    self.save

    matches
  end

  def is_solved?
    word == solved
  end

  def guesses_left
    BODY_PARTS - self.guesses.wrong.count 
  end

  protected

  def create_random_word
    self.word = random_word
    self.solved = "_" * self.word.length
  end

  def random_word
    RandomWord.nouns.next.split("_")[0]
  end

end

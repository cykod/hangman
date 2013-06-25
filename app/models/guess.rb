class Guess < ActiveRecord::Base
  attr_accessible :matches, :letter

  belongs_to :game

  scope :wrong, Proc.new { where(matches: false) }
end

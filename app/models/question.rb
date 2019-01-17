class Question < ApplicationRecord

  has_many :answers
  belongs_to :user

  acts_as_followable
  acts_as_votable

end

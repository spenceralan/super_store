class Review < ApplicationRecord
  belongs_to :product

  validates :username, presence: true
  
  validates :content,
    presence: true,
    length: {
      in: 50..250,
      message: "The review's content must be between 50 and 250 characters."
    }

  validates :rating,
    presence: true,
    inclusion: { 
      in: 1..5,
      message: "Please select a number between 1 and 5"
    }

end

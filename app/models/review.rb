class Review < ApplicationRecord
  belongs_to :product

  validates :username, presence: true
  
  validates :content,
    presence: true,
    length: {
      in: 50..250
    }

  validates :rating,
    presence: true,
    inclusion: { 
      in: 1..5
    }

end

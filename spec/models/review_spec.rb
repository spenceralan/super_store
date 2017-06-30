require 'rails_helper'

RSpec.describe Review, type: :model do
  it { should validate_presence_of :username }
  it { should validate_presence_of :content }
  it { should validate_presence_of :rating }

  it { should validate_inclusion_of(:rating).in_range(1..5) }
  
  it { should validate_length_of(:content).is_at_least(50).is_at_most(250) }


  it { should belong_to :product }
end
